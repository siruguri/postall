require 'test_helper'

class FourOhFourTest < Capybara::Rails::TestCase
  include Warden::Test::Helpers
  Warden.test_mode!

  test 'asking for redirect gets a form' do
    visit '/nosuchpage'
    assert_equal page.current_path, '/'

    page.has_content? I18n.t(:message_404)
  end

end
