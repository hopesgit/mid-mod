require "./lib/student"
require "./lib/course"
require "minitest/autorun"
require "minitest/pride"

class CourseTest < Minitest::Test
  def test_it_is_a_course
    course = Course.new("Calculus", 2)

    assert_instance_of Course, course
  end

  def test_it_has_details
    course = Course.new("Calculus", 2)

    assert_equal "Calculus", course.name
    assert_equal 2, course.capacity
  end

  def test_it_can_hold_students
    course = Course.new("Calculus", 2)

    assert_equal [], course.students

    student1 = Student.new({name: "Morgan", age: 21})
    student2 = Student.new({name: "Jordan", age: 29})

    course.enroll(student1)
    course.enroll(student2)

    assert_equal ["Morgan", "Jordan"], course.students
  end

  def test_it_can_get_full
    course = Course.new("Calculus", 2)

    assert_equal false, course.full?

    course.enroll(student1)
    course.enroll(student2)

    assert_equal true, course.full?
  end
end
