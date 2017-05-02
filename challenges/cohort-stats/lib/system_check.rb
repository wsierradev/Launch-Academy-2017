class SystemCheck

  def initialize(name, due_date)
    @name = name
    @due_date = due_date
    @submissions = []
  end

  def submissions
    @submissions
  end

  def add_submission(submission)
    @submissions << submission
  end

  def average_grade
    total = 0
    @submissions.each do |submission|
      total += submission.grade.to_f
    end
    total / @submissions.length
  end

  def did_student_complete_system_check?(person)
    response = false
    @submissions.each do |submission|
      if submission.student == person
        response = true
      end
    end
    response
  end

  def submittable?
    true
  end


end
