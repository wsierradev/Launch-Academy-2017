require "spec_helper"

describe Cohort do
  let(:cohort) do
    Cohort.new("! => Science", Date.parse("2020/08/10"), Date.parse("2020/10/16"))
  end

  let(:cohort_with_students) do
    student_1 = Student.new("Jane Smith", "jane.smith@gmail.com")
    student_2 = Student.new("John Smith", "john.smith@gmail.com")
    student_3 = Student.new("Jack Smith", "jack.smith@gmail.com")

    cohort.enroll(student_1)
    cohort.enroll(student_2)
    cohort.enroll(student_3)

    cohort
  end

  describe "#system_check_completed?" do
    it "returns 'true' if everyone has submitted" do
      jane = cohort_with_students.students.first
      john = cohort_with_students.students[1]
      jack = cohort_with_students.students.last

      system_check = SystemCheck.new("Grocery List using Postgres", Date.parse("2015/08/28"))
      cohort_with_students.assign(system_check)

      [jane, john, jack].each do |student|
        submission = SystemCheckSubmission.new("binding.pry", student)
        system_check.add_submission(submission)
      end

      expect(cohort.system_check_completed?(system_check)).
        to eq(true)
    end

    it "returns 'false' if we are missing submissions" do
      jane = cohort_with_students.students.first

      system_check = SystemCheck.new("Grocery List using Postgres", Date.parse("2015/08/28"))
      cohort_with_students.assign(system_check)
      submission = SystemCheckSubmission.new("binding.pry", jane)
      system_check.add_submission(submission)

      expect(cohort.system_check_completed?(system_check)).
        to eq(false)
    end
  end
end
