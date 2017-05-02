#Meet Expecations submission
class Cohort
  attr_reader :title, :start_date, :end_date

  def initialize(title, start_date, end_date)
    @title = title
    @start_date = start_date
    @end_date = end_date
    @students = []
    @system_checks = []
  end

  def students
    @students
  end

  def system_checks
    @system_checks
  end

  def career_kickoff
    @end_date + 4
  end

  def enroll(new_student)
    unless @students.include?(new_student)
      @students << new_student
    end
  end

  def assign(system_checks)
    @system_checks << system_checks
  end

  def roster
    display = "\nCohort Roster: #{title}\n"
    display += "---------------------------"
    @students.each do |student|
      display += "#{student.name} #{student.email}\n"
    end
      display
  end

  def system_check_completed?(system_check)
    system_check.submissions.length == @students.length
  end
end
