class LogsController < ApplicationController
  before_action :set_log, only: [:show, :edit, :update, :destroy]

  # GET /logs
  # GET /logs.json
  def index
    @logs = Log.all
  end

  # GET /logs/1
  # GET /logs/1.json
  def show
  end


  def new
  end


  def edit
  end

  def create
  end

  def update
  end

  def destroy
    @log.destroy
    respond_to do |format|
      format.html { redirect_to logs_url, notice: 'Log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    def set_log
      @log = Log.find(params[:id])
    end

    
    def log_params
      params.require(:log).permit(:uuid, :message, :ip)
    end
end
