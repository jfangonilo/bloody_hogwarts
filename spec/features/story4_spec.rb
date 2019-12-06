require "rails_helper"

describe "usert story 4:" do
  it "student index page has average age of students" do
    harry = Student.create!(name: "Harry", age: 10, house: "Gryffindor")
    hermione = Student.create!(name: "Hermoine", age: 12, house: "Gryffindor")
    ron = Student.create!(name: "Ron", age: 13, house: "Gryffindor")

    visit "/students"
    save_and_open_page
    expect(page).to have_content "Average Age: 11.67"
  end
end