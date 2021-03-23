require 'rails_helper'

feature 'Article', type: :feature do
  
  fixtures :categories, :articles

  context 'Upvoting an article' do
    scenario 'should be Successfull' do
      User.create(name: 'Paul')
      visit 'articles/new'
      fill_in 'name', with: 'Paul'
      click_button 'Log In'
      visit 'articles/new'
      fill_in 'article_title', with: 'Canoe Race'
      fill_in 'article_body', with: 'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.'
      check(categories(:category3).name)
      click_button 'Create Article'
      visit "categories/#{categories(:category3).id}"
      click_link  'Upvote'
      expect(page).to have_content("Thanks for your vote")
    end

    scenario 'should be Successfull' do
      User.create(name: 'Paul')
      visit 'articles/new'
      fill_in 'name', with: 'Paul'
      click_button 'Log In'
      visit 'articles/new'
      fill_in 'article_title', with: 'Canoe Race'
      fill_in 'article_body', with: 'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.'
      check(categories(:category3).name)
      click_button 'Create Article'
      visit "categories/#{categories(:category3).id}"
      click_link  'Upvote'
      click_link  'Downvote'
      expect(page).to have_content("You can vote again")
    end
  end
end