class LogbookController < ApplicationController
  def write
    text = params[:entry_text]
    timestamp = Time.now.strftime("%d/%m/%Y %H:%M:%S")
    entry = "#{timestamp} : #{text}\n"
    File.open(Rails.root.join('entry_log.txt'), 'a') do |file|
      file.write(entry)
    end
    redirect_to log_book_path
  end

  def log_book
    @title = "Log Book"
    if File.exist?(Rails.root.join('entry_log.txt'))
      entries_text = File.read(Rails.root.join('entry_log.txt'))
      @entries = entries_text.split("\n").reverse
    else
      @entries = ""
    end
  end
end