require 'spec_helper'

describe "Static pages" do
  describe "Home page" do
    it "should have the content 'Sample App'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit '/static_pages/home'
      expect(page).to have_content('Sample App')
    end
  end

  describe "About page" do
      it "should have the content 'About us'" do
          visit '/static_pages/about'
          expect(page).to have_content('About Us')
      end
  end
end
