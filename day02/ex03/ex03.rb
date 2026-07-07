#!/usr/bin/ruby -w

class Elem
    attr_reader :content
    attr_reader :opt
    attr_reader :tag
    attr_reader :tag_type
    
    def initialize(balise, contenu = [], orphan="double", opt={})
        @tag = balise
        @content = contenu
        @tag_type = orphan
        @opt = opt.is_a?(Hash) ? opt : {}
    end

    def add_content(*balise)
        @content.concat(balise)
    end

    def to_s(first = true)
        if first == true
            text_html = "\""
        else
            text_html = ""
        end
        text_html += "<#{@tag}"
        @opt.each do |key, value|
            text_html = text_html + " #{key}='#{value}' "
        end
        if @tag_type == "simple"
            text_html = text_html + "/>\\n"
        else
            text_html = text_html + ">\\n"
        end
        if @content.is_a?(Array)
            @content.each do |element|
                text_html = text_html + element.to_s(false) 
            end
        elsif @content.is_a?(Text)
            text_html = text_html.chomp("\\n")
            text_html = text_html + @content.to_s
        end
        if @tag_type == "double"
            text_html = text_html + "</#{@tag}>\\n"
        end
        if first == true
            text_html = text_html.chomp("\\n")
            text_html = text_html + "\""
        end
        return text_html
    end
end

class Text
    def initialize(text)
        @text = text
    end

    def to_s
        "#{@text}"
    end
end