require 'rails_helper'

feature 'Article', type: :feature do
  fixtures :categories
  before(:each) do
    User.create(name: 'Paul')
    visit 'articles/new'
    fill_in 'name', with: 'Paul'
    click_button 'Log In'
  end

  context 'Creating an article' do
    scenario 'should be Successfull' do
      visit 'articles/new'
      fill_in 'article_title', with: 'Canoe Race'
      fill_in 'article_body', with: 'In publishing and graphic design,
                                        Lorem ipsum is a placeholder text commonly'
      check(categories(:category3).name)
      click_button 'Create Article'
      expect(page).to have_content('Article successfully created')
    end

    scenario 'should be Unsuccessfull' do
      visit 'articles/new'
      fill_in 'article_title', with: 'Canoe Race'
      fill_in 'article_body', with: 'In publishing and graphic design,
                                      Lorem ipsum is a placeholder text commonly
                                      used to demonstrate'
      click_button 'Create Article'
      expect(page).to have_content("Categories can't be blank")
    end
  end
end
