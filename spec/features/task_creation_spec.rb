require 'spec_helper'

feature "signed in user and task creation" do
  background do
    @user = FactoryGirl.create(:ordinary_user)
    @user.save
    browser_sign_in @user
    visit new_task_path

    gets
  end

  scenario "should create a task and set the owner to the user" do
    page.text.should have_content "New Task!"
    fill_in "Title*", with: "Test task"
    click_button "Create Task"

    page.text.should match I18n.t(:successful_resource_creation)

    task = Task.last
    task.owner_id.should eq(@user.id)
  end

  scenario "should show the critical task message when entering a !", js: true do
    page.all('#help_message', visible: true).size.should == 0

    fill_in "Title*", with: "!critical"
    page.all('#help_message', visible: true).size.should_not == 0    
    fill_in "Title*", with: "not critical"
    page.all('#help_message', visible: true).size.should == 0    

  end
end

feature "signed out user and resource creation" do
  scenario "should not allow task creation for logged out users" do

    logout(:ordinary_user)

    visit new_task_path

    page.text.should match /not authorized/i
    current_path.should eq(root_path)
  end
end
