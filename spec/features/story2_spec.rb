require "rails_helper"

describe "user story 2:" do
  it "when i visit /students/:id, i see a list of the student's courses" do
    harry = Student.create!(name: "Harry", age: 10, house: "Gryffindor")

    course_1 = harry.courses.create!(name: "Potions")
    course_2 = harry.courses.create!(name: "Defense Against the Dark Arts")
    course_3 = harry.courses.create!(name: "Herbology")

    visit "/students/#{harry.id}"

    expect(page).to have_content course_1.name
    expect(page).to have_content course_2.name
    expect(page).to have_content course_3.name
  end
end