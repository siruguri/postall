require 'spec_helper'

feature "signed in user and resource creation" do
  background do
    @user = FactoryGirl.create(:user)
    sign_in_manually @user
  end

  it "should create a task and set the owner to the user" do
    visit new_task_path
    fill_in "Title", with: "Test task"
    click_button "Create Task"

    page.should have_content "Task was successfully created"

    task = Task.last
    task.owner_id.should eq(@user.id)
  end
end

describe "signed out user and resource creation" do
  it "should not allow task creation for logged out users" do

    logout(:user)

    visit new_task_path
    page.should have_content "not authorized"

    current_path.should eq(root_path)
  end
end
