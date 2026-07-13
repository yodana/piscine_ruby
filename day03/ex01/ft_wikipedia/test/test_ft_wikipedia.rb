# frozen_string_literal: true

require "test_helper"

class TestFtWikipedia < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::FtWikipedia::VERSION
  end

  def test_working_well
    assert_equal(9, FtWikipedia::Ft_wikipedia.search("Kiss"))
  end

  def test_loop
    assert_nil(FtWikipedia::Ft_wikipedia.search("Dubplate"))
  end

  def test_deadend
    assert_nil(FtWikipedia::Ft_wikipedia.search("Substance"))
  end
end
