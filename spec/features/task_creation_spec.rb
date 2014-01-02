require 'spec_helper'

feature "signed in user and task creation" do
  background do
    @user = FactoryGirl.create(:user)
    sign_in_manually @user
    visit new_task_path
  end

  scenario "should create a task and set the owner to the user" do
    fill_in "Title", with: "Test task"
    click_button "Create Task"

    page.should have_content "Task was successfully created"

    task = Task.last
    task.owner_id.should eq(@user.id)
  end

  scenario "should show the critical task message when entering a !", js: true do
    page.all('#help_message', visible: true).size.should == 0

    fill_in "Title", with: "!critical"
    page.all('#help_message', visible: true).size.should_not == 0    
    fill_in "Title", with: "not critical"
    page.all('#help_message', visible: true).size.should == 0    

  end
end

feature "signed out user and resource creation" do
  scenario "should not allow task creation for logged out users" do

    logout(:user)

    visit new_task_path
    page.should have_content "not authorized"

    current_path.should eq(root_path)
  end
end
