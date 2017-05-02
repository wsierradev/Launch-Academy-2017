class SystemCheckSubmission
  attr_reader :solution, :student

    def initialize(solution, student)
      @solution = solution
      @student = student
    end

    def assign_grade(grade)
      if grade >= 0
        @grade = grade
      else
        raise InvalidGradeError, "What kinda grade is that? Try again teach."
      end
    end

    def grade
      @grade
    end

    def graded?
      !@grade.nil?
    end

end

class InvalidGradeError < StandardError
end
