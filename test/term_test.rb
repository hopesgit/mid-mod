require "./lib/student"
require "./lib/course"
require "./lib/term"
require "minitest/autorun"
require "minitest/pride"

class TermTest < Minitest::Test
  def test_it_is_term
    term = Term.new("Winter 2018")

    assert_instance_of Term, term
  end

  def test_it_has_attributes
    term = Term.new("Winter 2018")

    assert_equal "Winter 2018", term.name
    assert_equal [], term.courses
  end
end
