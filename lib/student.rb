class Student

  attr_reader :name, :age, :scores

  def initialize(details)
    @name = details[:name]
    @age = details[:age]
    @scores = Array.new
  end

  def log_score(score)
    @scores << score
  end

  def grade
    total = 0
    @scores.sum do |score|
      total << score
    end
    total.to_f / @scores.count
  end
end
