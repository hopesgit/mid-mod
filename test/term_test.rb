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

  def test_it_can_add_courses
    term = Term.new("Winter 2018")
    course1 = Course.new("Calculus", 2)

    term.add_course(course1)

    assert_equal [course1], term.courses
  end

  def test_it_can_list_open_courses
    term = Term.new("Winter 2018")
    course1 = Course.new("Calculus", 2)
    course2 = Course.new("U.S. History", 2)
    course3 = Course.new("Art", 1)
    student1 = Student.new({name: "Morgan", age: 21})
    student2 = Student.new({name: "Jordan", age: 29})

    term.add_course(course1)
    term.add_course(course2)
    term.add_course(course3)
    term.courses[0].enroll(student1)
    term.courses[2].enroll(student2)

    assert_equal [course1, course2], term.open_courses
  end

  def test_it_can_list_students
    term = Term.new("Winter 2018")
    course1 = Course.new("Calculus", 2)
    course2 = Course.new("U.S. History", 2)
    course3 = Course.new("Art", 1)
    student1 = Student.new({name: "Morgan", age: 21})
    student2 = Student.new({name: "Jordan", age: 29})

    term.add_course(course1)
    term.add_course(course2)
    term.add_course(course3)
    term.courses[0].enroll(student1)
    term.courses[2].enroll(student2)

    assert_equal ["Morgan", "Jordan"], term.list_students
  end
end
