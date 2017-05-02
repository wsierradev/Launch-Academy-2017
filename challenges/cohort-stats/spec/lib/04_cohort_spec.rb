require "spec_helper"

describe Cohort do
  describe ".new" do
    it "takes a title, start_date, and end_date as arguments" do
      first_day = Date.parse("2020/02/22")
      last_day = Date.parse("2020/04/29")
      cohort = Cohort.new("! => Science", first_day, last_day)
      expect(cohort).to be_a(Cohort)
    end
  end

  let(:cohort) do
    Cohort.new("! => Science", Date.parse("2020/02/22"), Date.parse("2020/04/29"))
  end

  describe "#title" do
    it "has a reader for title" do
      expect(cohort.title).to eq("! => Science")
    end

    it "does not have a writer for title" do
      expect { cohort.title = "Hash of Hope" }.to raise_error(NoMethodError)
    end
  end

  describe "#start_date" do
    it "has a reader for start_date" do
      expect(cohort.start_date).to eq(Date.parse("2020/02/22"))
    end

    it "does not have a writer for start_date" do
      expect { cohort.start_date = nil }.to raise_error(NoMethodError)
    end
  end

  describe "#end_date" do
    it "has a reader for end_date" do
      expect(cohort.end_date).to eq(Date.parse("2020/04/29"))
    end

    it "does not have a writer for start_date" do
      expect { cohort.end_date = nil }.to raise_error(NoMethodError)
    end
  end

  describe "#students" do
    it "is initialized as an empty array" do
      expect(cohort.students).to eq([])
    end
  end

  describe "#system_checks" do
    it "is initialized as an empty array" do
      expect(cohort.system_checks).to eq([])
    end
  end

  describe "#career_kickoff" do
    it "should be a date object" do
      expect(cohort.career_kickoff).to be_a(Date)
    end

    # Hint: http://ruby-doc.org/stdlib/libdoc/date/rdoc/Date.html#method-i-2B
    it "should be four days after the end_date" do
      career_kickoff = Date.parse("2020/05/03")
      expect(cohort.career_kickoff).to eq(career_kickoff)
    end

    it "should be different for the summer cohort" do
      start_date = Date.parse("2020/05/23")
      end_date = Date.parse("2020/08/05")
      summer = Cohort.new("Summer 2020", start_date, end_date)

      expect(summer.career_kickoff).to eq(Date.parse("2020/08/09"))
    end
  end

  describe "#enroll" do
    it "adds a student to the students array" do
      student = Student.new("Jane Smith", "jane.smith@gmail.com")
      cohort.enroll(student)
      expect(cohort.students).to include(student)
    end

    it "should not add the student if they are already in the cohort" do
      student = Student.new("Jane Smith", "jane.smith@gmail.com")
      cohort.enroll(student)
      cohort.enroll(student)
      expect(cohort.students.length).to eq(1)
    end
  end

  describe "#assign" do
    it "adds a system_check to the system_checks array" do
      due = Date.parse("2020/03/04")
      system_check = SystemCheck.new("Grocery List using Postgres", due)
      cohort.assign(system_check)
      expect(cohort.system_checks).to include(system_check)
    end
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

  describe "#roster" do
    <<-EXAMPLE_OUTPUT

      Cohort: ! => Science
      --------------------
      Jane Smith jane.smith@gmail.com
      John Smith john.smith@gmail.com
      Jack Smith jack.smith@gmail.com

    EXAMPLE_OUTPUT

    it "returns a string" do
      expect(cohort_with_students.roster).to be_a(String)
    end

    it "includes the cohort title" do
      expect(cohort_with_students.roster).to include("! => Science")
    end

    it "includes the student names" do
      expect(cohort_with_students.roster).to include("Jane")
      expect(cohort_with_students.roster).to include("John")
      expect(cohort_with_students.roster).to include("Jack")
    end

    it "includes the student email addresses" do
      expect(cohort_with_students.roster).to include("jane.smith@gmail.com")
      expect(cohort_with_students.roster).to include("john.smith@gmail.com")
      expect(cohort_with_students.roster).to include("jack.smith@gmail.com")
    end
  end
end
