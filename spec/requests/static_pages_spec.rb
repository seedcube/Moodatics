require 'spec_helper'

describe "StaticPages" do 
  
  subject { page }

  shared_examples_for 'all static pages' do
    it { should have_selector('h1', text: heading) }
    it { should have_title(full_title(page_title)) }
  end
  
  
  describe "Home page" do
      before { visit root_path }
      it { should have_title( 'Moodatics') }
      it { should_not have_title('home') }
  end 
  
  describe "Sign in link" do
      before { visit root_path }
      it { click_link "Sign Up" } 
      it { click_link "Log In" } 
  end
  
end
