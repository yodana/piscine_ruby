#!/usr/bin/ruby -w

class Html
    attr_reader :page_name 

    def initialize(title)
        @page_name = title
        head
    end

    def head
        raise "A file #{@page_name} already exist!" if File.exist?("#{@page_name}.html")
        file = File.open("#{page_name}.html", "w")
        file.write("<!DOCTYPE html>\n<html>\n<head>\n<meta charset='UTF-8'>\n<title>#{@page_name}</title>\n</head>\n<body>\n")
        file.close
    end

    def dump(phrase)
        filename = "#{@page_name}.html"
        if File.exist?(filename)
            content = File.read(filename)
            raise "There is no body tag in #{filename}" unless content.include?("<body>")
            raise "Body has already been closed in #{filename}" if content.include?("</body>")
        end
        file = File.open(filename, "a")
        file.puts " <p>#{phrase}<p>\n"
        file.close
    end

    def finish
        filename = "#{@page_name}.html"
        if File.exist?(filename)
            content = File.read(filename)
            raise "Body has already been closed in #{filename}" if content.include?("</body>")
        end
        file = File.open(filename, "a")
        file.puts "</body>\n<html>"
        file.close
    end
end

if $PROGRAM_NAME == __FILE__
    html = Html.new("accueil")
    #html = Html.new("accueil")
    html.dump("phrase")
    html.finish
    #html.dump("try to dump after finish")
    #html.finish
end