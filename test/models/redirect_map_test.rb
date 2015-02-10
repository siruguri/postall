require 'test_helper'

class RedirectMapTest < ActiveSupport::TestCase
  self.use_transactional_fixtures = true
  def setup
    @map1 = RedirectMap.new(src: 'is_valid', dest: 'http://www.google.com')
    @map2 = RedirectMap.new(src: 'is_valid', dest: 'http://www.yahoo.com')
  end

  test 'srcs are unique' do
    @map1.save
    assert @map1.valid?

    assert_not @map2.valid?
  end
end
