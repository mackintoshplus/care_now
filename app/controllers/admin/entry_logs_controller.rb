module Admin
  class EntryLogsController < ApplicationController
    def new
      @entry_log = EntryLog.new
    end

    def create
      @entry_log = EntryLog.new(entry_log_params)
      @entry_log.entry_time = DateTime.now
      if @entry_log.save
        redirect_to admin_entry_logs_new_path, notice: "入室ログが保存されました"
      else
        render :new
      end
    end

    private

    def entry_log_params
      params.require(:entry_log).permit(:barcode)
    end
  end
end
