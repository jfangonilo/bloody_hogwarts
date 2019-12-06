require "rails_helper"

describe "user story 1:" do
  it "when I visit /students, i see a list of students sorted alpha" do
    harry = Student.create!(name: "Harry", age: 10, house: "Gryffindor")
    draco = Student.create!(name: "Draco", age: 11, house: "Slytherin")
    luna = Student.create!(name: "Luna", age: 12, house: "Ravenclaw")

    visit "/students"
    expect(page).to have_content harry.name
    expect(page).to have_content harry.age
    expect(page).to have_content harry.house

    expect(page).to have_content draco.name
    expect(page).to have_content draco.age
    expect(page).to have_content draco.house

    expect(page).to have_content harry.name
    expect(page).to have_content luna.age
    expect(page).to have_content luna.house

    expect(page.body.index("Draco")).to be < page.body.index("Harry")
  end
end