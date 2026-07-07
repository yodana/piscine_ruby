#!/usr/bin/ruby -w

class Html
    attr_reader :page_name 

    def initialize(title)
        @page_name = title
        head
    end

    class Dup__file < StandardError
        def initialize(title)
            @page_name = title
            @correct_file = @page_name + ".new"
        end
        
        def showstate
            path = Dir.pwd
            puts "A file named #{@page_name} was already there: #{path}/#{@page_name}.html"
        end

        def correct
            while File.exist?("#{@correct_file}.html")
                @correct_file = @correct_file + ".new"
            end
            file = File.open("#{@correct_file}.html", "w")
            file.close
            return @correct_file
        end

        def explain
            path = Dir.pwd
            puts "Appended .new in order to create requested file: #{path}/#{@correct_file}.html"
        end
    end

    class Body__closed < StandardError
        def initialize(title, phrase)
            @page_name = title
            @correct_file = @page_name + ".new"
            @phrase = phrase
            @index = 0
        end
        def showstate
            puts "In #{@page_name} body was closed :"
        end

        def correct
            File.open("#{@page_name}", 'r+') do |file|
                lines = file.each_line.to_a
                lines.each_with_index do |line, index|
                    if line.include?("</body>")
                        lines[index] = " <p>#{@phrase}</p>\n</body>\n"
                        @index = index + 1
                    end
                end
                file.rewind
                file.write(lines.join)
            end
        end

        def explain
            puts "> ln :#{@index} </body> : text has been inserted and tag moved at the end of it."
        end
    end

    def head
        begin
            raise Dup__file.new(@page_name) if File.exist?("#{@page_name}.html")
        rescue Dup__file => e
            e.showstate
            @page_name = e.correct
            e.explain
        end
        file = File.open("#{page_name}.html", "w")
        file.write("<!DOCTYPE html>\n<html>\n<head>\n<meta charset='UTF-8'>\n<title>#{@page_name}</title>\n</head>\n<body>\n")
        file.close
    end

    def dump(phrase)
        filename = "#{@page_name}.html"
        if File.exist?(filename)
            content = File.read(filename)
            raise "There is no body tag in #{filename}" unless content.include?("<body>")
            begin
                raise Body__closed.new(filename, phrase) if content.include?("</body>")
            rescue Body__closed => e
                e.showstate
                e.correct
                e.explain
                return
            end
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