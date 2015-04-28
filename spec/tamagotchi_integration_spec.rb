require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the tamagotchi life cycle', {:type => :feature}) do
  it('test and verify basic routing of sinatra') do
    visit('/test')
    expect(page).to have_content('test page')
  end

  it('test user giving actions to pet') do
    visit('/')
    #find('#action').find(:xpath, 'option[0]').select_option()
    select('Status Check', :from => 'action')
    click_button('Do')
    expect(page).to have_content('Lil Gem is fine')
  end

  it('test user setting food to 0') do
    visit('/')
    select('No Food', :from => 'action')
    click_button('Do')
    expect(page).to have_content('Lil Gem is hungry')
  end
end
