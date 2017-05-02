class Lesson
  attr_accessor :name, :body

  def initialize(name, body)
    @name = name
    @body = body
  end

  def submittable?
    false
  end

  private
  def average_grade
    total = 0
    @submissions.each do |submission|
      total += submission.grade.to_f
    end
    total / @submissions.length
  end

end
