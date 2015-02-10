require 'test_helper'

class RedirectTest < Capybara::Rails::TestCase
  include Capybara::DSL
  
  test 'asking for redirect gets a form' do 
    visit new_redirect_map_path
    assert page.has_content? 'Redirect what'
    assert page.has_content? 'Src'
    assert page.has_content? 'Dest'

    assert page.has_css? 'input[type=text]'
  end

end
