json.array!(@logs) do |log|
  json.extract! log, :id, :uuid, :message, :ip
  json.url log_url(log, format: :json)
end
