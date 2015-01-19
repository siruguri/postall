require_relative '../test_helper'

class RedirectTest < Capybara::Rails::TestCase
  include Capybara::DSL
  
  test 'asking for redirect gets a form' do 
    visit new_redirect_map_path
    page.has_content? 'Redirect what'
  end

end
