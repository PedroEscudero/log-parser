class Parser

  require 'file/tail'

  UUID_MATCHED = /.{8}-.{4}-.{4}-.{4}-.{12}/

  attr_reader :path, :uuid, :message, :allow_assets

  def initialize(path, allow_assets = false)
    @path = path if File.exist?(path)
    @allow_assets = allow_assets
  end

  def read
    File.read(@path).each_line do |line|
      treat_line(line) unless is_asset?(line) || line.split.first.nil?
    end
  end

  def tail
    File.open(@path) do |log|
      log.extend(File::Tail)
      log.interval = 10
      log.tail { |line| treat_line(line) unless is_asset?(line) || line.split.first.nil? ; puts line }
    end
  end

  private

  def treat_line(line)
    @uuid = line.split.first.match(UUID_MATCHED).to_s
    @message = line.slice(38..line.size)
    Log.create(uuid: @uuid) if Log.where(uuid: uuid).empty? && valid_uuid?
    parse_message
  end

  def parse_message
    case @message.split[0]
      when "Started"
        started
      when "Completed"
        completed
      when "DEPRECATION", "WARNING"
        treat_exception(:warning)
      when "Parameters:"
        save_parameters
      when "Rendered", "Processing"
        return
      when "Error"
        treat_exception(:error)
      else
        complete_exception  
    end
  end

  def started
    Log.find(@uuid).update(method: @message.split[1],
     url: @message.split[2],
     ip: @message.split[4],
     time: "#{@message.split[6]} #{@message.split[7]} #{@message.split[8]} GMT".to_time)
  end

  def completed
    Log.find(@uuid).update(result: "#{@message.split[1]} #{@message.split[2]}")
  end

  def treat_exception(exception)
    issue = "#{Log.all.order(:created_at).last.send(exception)}#{@message}"
    Log.all.order(:created_at).last.update(exception => issue)
  end

  def complete_exception
    Log.all.order(:created_at).last.error.nil? ? treat_exception(:warning) : treat_exception(:error)
  end

  def save_parameters
    Log.find(@uuid).update(parameters: @message.slice(14..@message.size))
  end

  def is_asset?(line)
    line.include?('assets') && allow_assets == false
  end

  def valid_uuid?
    @uuid.match(UUID_MATCHED).present?
  end

end