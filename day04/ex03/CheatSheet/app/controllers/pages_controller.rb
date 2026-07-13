class PagesController < ApplicationController
  def convention
    @title = "Convention"
  end

  def console
    @title = "Console"
  end

  def ruby
    @title = "Ruby"
  end

  def ruby_concepts
    @title = "Ruby - Concepts Généraux"
  end

  def ruby_numbers
    @title = "Ruby - Nombres"
  end

  def ruby_strings
    @title = "Ruby - Chaînes de caractères"
  end

  def ruby_arrays
    @title = "Ruby - Arrays"
  end

  def ruby_hashes
    @title = "Ruby - Hashes"
  end

  def rails_folder_structure
    @title = "Rails - Structure des dossiers"
  end

  def rails_commands
    @title = "Rails - Commandes"
  end

  def rails_erb
    @title = "Rails - ERB"
  end

  def editor
    @title = "Éditeur"
  end

  def help
    @title = "Aide"
  end

  def quick_search
    @title = "Quick Search"
  end
  
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