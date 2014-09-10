class ExpiredTasks
  @queue=:expired_tasks

  def self.perform
    puts "In expiry perform"
  end

end
