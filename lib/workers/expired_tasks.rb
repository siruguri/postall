class ExpiredTasks
  @queue = 'task3'

  def self.perform
    puts "In expiry perform" 
  end

end
