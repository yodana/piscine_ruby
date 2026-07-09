#!/usr/bin/ruby -w
# frozen_string_literal: true
require "test_helper"

class TestDeepthought < Minitest::Test
  def test_that_it_has_a_version_number
    assert_equal("0.0.1", ::Deepthought::VERSION)  
  end

  def test_type_object
    deepthought = Deepthought::Deepthought.new
    assert_instance_of(Deepthought::Deepthought, deepthought)
  end

  def test_1
    deepthought = Deepthought::Deepthought.new
    assert_equal("42",deepthought.respond("The Ultimate Question of Life, the Universe and Everything"))
  end

  def test_2
    deepthought = Deepthought::Deepthought.new
    assert_equal("Mmmm i'm bored", deepthought.respond("Question of Life, the Universe and Everything"))
  end
end
