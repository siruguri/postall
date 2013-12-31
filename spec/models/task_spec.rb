require 'spec_helper'

describe Task do
  it "should not create a task with an empty title" do
    should validate_presence_of(:title)
    
  end
end
