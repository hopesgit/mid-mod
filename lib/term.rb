require "./lib/student"
require "./lib/course"

class Term
  attr_reader :name, :courses

  def initialize(name)
    @name = name
    @courses = []
  end

  def add_course(course)
    @courses << course
  end

  def open_courses
    open_class = []
    courses.map do |course|
      if course.full? == false
        open_class << course
      end
    end
    open_class
  end

  def list_students
    all_students = []
    @courses.each do |course|
      course.students.each do |student|
        all_students << student.name
      end
    end
    all_students.flatten
    all_students
  end
end
