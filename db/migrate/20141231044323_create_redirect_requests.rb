class CreateRedirectRequests < ActiveRecord::Migration
  def change
    create_table :redirect_requests do |t|
      t.integer :redirect_map_id
      t.string :request_agent
      t.string :request_referer

      t.timestamps
    end
  end
end
