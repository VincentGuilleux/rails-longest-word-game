require 'application_system_test_case'

class GamesTest < ApplicationSystemTestCase
  test 'Going to /new gives us a new random grid to play with' do
    visit new_url
    assert test: 'New game'
    assert_selector 'li', count: 10
  end

  test 'Helg is not an english word' do
    visit new_url
    fill_in 'word', with: 'Helg'
    click_on 'Play!'
    assert_text 'Sorry but Helg is not an english Word'
  end

  test 'Spaceship is not in the grid' do
    visit new_url
    fill_in 'word', with: 'Spaceship'
    click_on 'Play!'
    assert_text 'Sorry but Spaceship cant be built from the grid'
  end
end
