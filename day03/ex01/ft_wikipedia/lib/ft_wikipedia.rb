#!/usr/bin/ruby -w
# frozen_string_literal: true
require 'nokogiri'
require 'open-uri'
require_relative "ft_wikipedia/version"

module FtWikipedia
  class Error < StandardError; end
  class Ft_wikipedia
      def initialize
      end
      
      def self.search(query)
        elems = []
        puts "First search @ :https://en.wikipedia.org/wiki/#{query}"
        next_elem = query
        elems << next_elem
        begin
            while elems.include?("Philosophy") == false
                html_content = URI.open("https://en.wikipedia.org/wiki/#{next_elem}").read
                next_elem = detect_next(html_content)
                elems << next_elem
                puts "https://en.wikipedia.org/wiki/#{next_elem}"
                raise StandardError, "Loop detected there is no way to philosophy here" if elems.count(next_elem) > 1
            end
            rescue StandardError => e
                puts e.message
                return nil
        end
        return elems.length - 1
      end

    def self.detect_next(html)
        doc = Nokogiri::HTML(html)
        links = doc.css('div.mw-content-ltr p a')
        links.each do |link|
            if link['href'].start_with?('/wiki/') and link['href'].include?(":") == false
                word = link['href'].gsub('/wiki/', '')
                return word
            end
        end
        raise StandardError, "Dead end page reached"
    end
  end
end
