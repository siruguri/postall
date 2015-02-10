require 'test_helper'

class RedirectMapsControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  self.use_transactional_fixtures = true
  
  test 'Good redirect request succeeds' do
    valid_request = redirect_maps(:redirect_number_one)
    get :redirect, {src: valid_request.src}

    assert_redirected_to(valid_request.dest)
  end

  test 'Bad redirect request fails' do
    get :redirect, {src: 'this_doesnt_exist'}

    assert_template 'pages/nothing'
  end

  test 'redirect creation needs logged in user' do
    sign_out(:user)

    post :create, {redirect_map: {src: 'new_one', dest: 'http://www.newone.com/'} }
    assert_redirected_to new_user_session_path
  end

  test 'redirect creation works for logged in user' do
    sign_in(users(:valid_user))

    assert_difference('RedirectMap.count', 1) do 
      post :create, {redirect_map: {src: 'new_one_1', dest: 'http://www.newone.com/'} }
    end

    redirect_map = RedirectMap.last
    assert assigns(:redirect_map)
    assert_redirected_to redirect_map_path(id: redirect_map.id)
  end

  test 'can get index' do
    get :index
    assert assigns(:redirect_maps)
    assert_template :index
  end

  test 'cannot create redirect with duplicate src' do
    sign_in(users(:valid_user))

    existing_map = redirect_maps(:redirect_number_one)
    post :create, {redirect_map: {src: existing_map.src, dest: 'http://www.newone.com/'} }
    assert_template :new
  end
end
