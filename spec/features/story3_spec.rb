require "rails_helper"

describe "user story 3:" do
  it " when i visit /courses, i see a list of courses sorted alpha and their total students" do
    harry = Student.create!(name: "Harry", age: 10, house: "Gryffindor")
    hermione = Student.create!(name: "Hermoine", age: 10, house: "Gryffindor")
    ron = Student.create!(name: "Ron", age: 10, house: "Gryffindor")
    
    potions = Course.create!(name: "Potions", student_ids: [ron.id])
    herbs = Course.create!(name: "Herbology", student_ids: [harry.id, hermione.id, ron.id])
    dada = Course.create!(name: "Defense Against the Dark Arts", student_ids: [harry.id, hermione.id])

    visit "/courses"
    save_and_open_page
    expect(page).to have_content "Defense Against the Dark Arts: 2"
    expect(page).to have_content "Herbology: 3"
    expect(page).to have_content "Potions: 1"

    expect(page.body.index("#{dada.name}")).to be < page.body.index("#{potions.name}")
    expect(page.body.index("#{herbs.name}")).to be < page.body.index("#{potions.name}")
  end
end