require 'rails_helper'

feature 'Question_question management' do

  ##FIND ELEMENTS FOR SECOND TWO AND ADD TEST TO CHECK COUNT

  background do
    visit root_path
    click_link 'Add a new question'
    fill_in 'question_question', with: "What is the meaning of life?"
    fill_in 'question_answer', with: "Don't know"
    click_button 'Create Question'
  end

  scenario "creates a new question" do
    visit root_path
    click_link 'Add a new question'
    fill_in 'question_question', with: "What is greater than blue?"
    fill_in 'question_answer', with: "Tomato"
    click_button 'Create Question'
    expect(page).to have_content 'blue'
  end

  scenario "increases question count" do
    visit root_path
    expect{
      click_link 'Add a new question'
      fill_in 'question_question', with: "What is the best part of a rails developer's day?"
      fill_in 'question_answer', with: "Using capybara!"
      click_button 'Create Question'
      }.to change(Question, :count).by(1)
  end

  scenario "passes a correct answer" do
    visit root_path
    click_link 'What is the meaning of life?'
    fill_in 'answer_answer', with: 'To do good'
    click_button 'Submit answer'
    expect(page).to have_content 'Aww, you got it wrong!'

  end

  scenario "fails an incorrect answer" do
    visit root_path

    click_link 'What is the meaning of life?'
    fill_in 'answer_answer', with: "Don't know"
    click_button 'Submit answer'
    expect(page).to have_content 'Correct! You got it right!'
  end

end