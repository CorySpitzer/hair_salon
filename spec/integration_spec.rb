require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the app', :type => :feature) do
  describe('the root path') do
    it('visits the home page') do
      visit('/')
      expect(page).to have_content('Manage Your Salon')
    end
  end

  describe('getting the stylists path') do
    it('visits the stylists page') do
      visit('/stylists')
      expect(page).to have_content("Stylists:")
    end
  end

  describe('posting to the stylists path') do
    it('it adds a stylist to the list of all the stylists') do

    end
  end

  describe('') do
    it('') do

    end
  end

  describe('') do
    it('') do

    end
  end
end
