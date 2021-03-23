require 'rails_helper'

feature 'User', type: :feature do
  context 'Sign Up' do
    scenario 'should be successfull' do
      visit 'users/new'
      fill_in 'user_name', with: 'John'
      click_button 'Sign Up'
      expect(page).to have_content('Welcome John Your Account is Ready')
    end

    scenario 'should be unsuccessfull' do
      visit 'users/new'
      fill_in 'user_name', with: 'Paulqqqqqqqqqqqqqqqqqqqqqqqqqqqq'
      click_button 'Sign Up'
      expect(page).to have_content('Name is too long (maximum is 10 characters)')
    end
  end

  context 'Sign Up' do
    scenario 'should be successfull' do
      User.create(name: 'John')
      visit 'articles/new'
      fill_in 'name', with: 'John'
      click_button 'Log In'
      expect(page).to have_content('Welcome John You have successfully signed in')
    end

    scenario 'should be unsuccessfull' do
      visit 'articles/new'
      fill_in 'name', with: 'Mathew'
      click_button 'Log In'
      expect(page).to have_content('Please Enter a valid name')
    end
  end
end
