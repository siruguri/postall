module Helpers
  def sign_in_manually(user)
    visit new_user_session_path
    fill_in "user[email]", :with => user.email
    fill_in "user[password]", :with => user.password
    click_button "Login"

    current_path.should eq(root_path)
  end
end
