require "./lib/student"
require "./lib/course"

class Term
  attr_reader :name, :courses

  def initialize(name)
    @name = name
    @courses = []
  end

end
