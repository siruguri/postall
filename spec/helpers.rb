module Helpers
  def browser_sign_in(user)
    visit new_user_session_path
    fill_in "user[email]", :with => user.email
    fill_in "user[password]", :with => user.password
    click_button "Login"
  end

  # Expect this to be called in a controller, where @request is defined (bad idea?)
  def devise_sign_in(user_obj)
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in(user_obj)
  end
end

