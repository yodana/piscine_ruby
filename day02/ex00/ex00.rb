#!/usr/bin/ruby -w

class Html
    attr_reader :page_name 

    def initialize(title)
        @page_name = title
        head
    end

    def head
        file = File.open("#{page_name}.html", "w")
        file.write("<!DOCTYPE html>\n<html>\n<head>\n<meta charset='UTF-8'>\n<title>#{@page_name}</title>\n</head>\n<body>\n")
        file.close
    end

    def dump(phrase)
        file = File.open("#{page_name}.html", "a")
        file.puts " <p>#{phrase}<p>\n"
        file.close
    end

    def finish
        file = File.open("#{page_name}.html", "a")
        file.puts "</body>\n<html>"
        file.close
    end
end

if $PROGRAM_NAME == __FILE__
    html = Html.new("accueil")
    html.dump("phrase")
    html.finish
end