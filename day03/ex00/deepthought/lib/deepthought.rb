#!/usr/bin/ruby -w
# frozen_string_literal: true

require_relative "deepthought/version"
require "colorize"

module Deepthought
  class Error < StandardError; end
    class Deepthought
        def initialize
        end
        def respond(question)
            if question == "The Ultimate Question of Life, the Universe and Everything"
                puts "42".green
                return "42"
            else
                puts "Mmmm i'm bored".red
                return "Mmmm i'm bored"
            end
        end
    end
end
