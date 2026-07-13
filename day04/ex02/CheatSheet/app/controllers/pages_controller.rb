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
  
end