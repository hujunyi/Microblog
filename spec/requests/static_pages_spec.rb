require 'rails_helper'

RSpec.describe "StaticPages", :type => :request do
  let(:main_title) { "Microblog" }
  describe "Home page" do
    it "should have the content 'Microblog'" do
      visit '/static_pages/home'
      expect(page).to have_content('Microblog')
    end

    it "should have the right title" do
      visit '/static_pages/home'
      expect(page).to have_title("#{main_title} | Home")
    end
  end

  describe "Help page" do
    it "should have the content 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end
    it "should have the right title" do
      visit '/static_pages/help'
      expect(page).to have_title("#{main_title} | Help")
    end

  end

  describe "About page" do
    it "should have the content 'About Us'" do
      visit '/static_pages/about'
      expect(page).to have_content('About Us')
    end
    it "should have the right title" do
      visit '/static_pages/about'
      expect(page).to have_title("#{main_title} | About")
    end
  end


  describe "Contact page" do
    it "should have the content 'Contact'" do 
      visit '/static_pages/contact'
      expect(page).to have_content('Contact')
    end

    it "should have the right title" do
      visit '/static_pages/contact'
      expect(page).to have_title('Microblog | Contact')
    end
  end

end
