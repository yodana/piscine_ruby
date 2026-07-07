#!/usr/bin/ruby -w

class Text
    def initialize(text)
        @text = text
    end

    def to_s
        "#{@text}"
    end
end


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
        text_html = "<#{@tag}"
        @opt.each do |key, value|
            text_html = text_html + " #{key}='#{value}' "
        end
        if @tag_type == "simple"
            text_html = text_html + "/>\n"
        else
            text_html = text_html + ">\n"
        end
        if @content.is_a?(Array)
            @content.each do |element|
                text_html = text_html + element.to_s(false) 
            end
        elsif @content.is_a?(Text) or @content.is_a?(String)
            if @content.is_a?(String)
                @content = Text.new(@content)
            end
            text_html = text_html.chomp("\n")
            text_html = text_html + @content.to_s
        end
        if @tag_type == "double"
            text_html = text_html + "</#{@tag}>\n"
        end
        if first == true
            text_html = text_html.chomp("\n")
        end
        return text_html
    end
end

def create_tag(name, orphan = false)
  Class.new(Elem) do #creer une class heritant de Elem
    define_method(:initialize) do |contenu = [], opt = {}| # defini la method initialize dynamiquement!
      super(name, contenu, orphan ? "simple" : "double", opt)
    end
  end
end

def create_elem
    double = ["Html", "Head", "Body", "Title", "Table", "Th", "Tr", "Td",
            "Ul", "Ol", "Li", "H1", "H2", "P", "Div", "Span"]
    simple = ["Img", "Meta", "Hr", "Br"]
    double.each do |name|
        Object.const_set(name, create_tag(name)) #Object const_set equivaut a Html = Class.new
    end
    simple.each do |name|
        Object.const_set(name, create_tag(name, true))
    end
end

if $PROGRAM_NAME == __FILE__
    create_elem
    puts Html.new([Head.new([Title.new("Hello ground!")]),Body.new([H1.new("Oh no, not again!"),Img.new([], {'src':'http://i.imgur.com/pfp3T.jpg'}) ]) ])
end

