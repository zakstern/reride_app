require 'spec_helper'

describe "Static Pages" do

	subject { page }

  	shared_examples_for "all static pages" do
    	it { should have_selector('h1', text: heading) }
    	it { should have_title(full_title(page_title)) }
  	end

 	describe "Home Page" do
 		let(:heading)    { 'ReRide Bikes' }
    	let(:page_title) { '' }
 		before { visit root_path }

 		it_should_behave_like "all static pages"
	end 

	describe "Help Page" do

		let(:heading)    { 'Help' }
    	let(:page_title) { 'Help' }
 		before { visit help_path }

 		it_should_behave_like "all static pages"
	end 

	describe "About Page" do

		let(:heading)    { 'About Us' }
    	let(:page_title) { 'About' }
 		before { visit about_path }

 		it_should_behave_like "all static pages"
	end

	describe "Contact Page" do

		let(:heading)    { 'Contact' }
    	let(:page_title) { 'Contact' }
 		before { visit contact_path }

 		it_should_behave_like "all static pages"
	end
	it "should have the right links on the layout" do
    	visit root_path
    	click_link "About"
    	expect(page).to have_title(full_title('About'))
    	click_link "Help"
    	expect(page).to have_title(full_title('Help'))
    	click_link "Contact"
    	expect(page).to have_title(full_title('Contact'))
    	click_link "Home"
        first(:link, "ReRide").click
    	expect(page).to have_title(full_title(''))
  end
end
