require "./lib/student"
require "minitest/autorun"
require "minitest/pride"

class StudentTest < Minitest::Test
  def test_it_is_a_student
    student = Student.new({name: "Morgan", age: 21})

    assert_instance_of Student, student
  end

  def test_it_has_details
    student = Student.new({name: "Morgan", age: 21})

    assert_equal "Morgan", student[:name]
    assert_equal 21, student[:age]
  end

  def test_it_holds_scores
    student = Student.new({name: "Morgan", age: 21})

    assert_equal [], student.scores

    student.log_score(89)
    student.log_score(78)

    assert_equal [89, 78], student.scores
  end

  def test_it_can_average
    student = Student.new({name: "Morgan", age: 21})

    student.log_score(89)
    student.log_score(78)

    assert_equal 83.5, student.grade
  end
end
