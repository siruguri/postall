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
