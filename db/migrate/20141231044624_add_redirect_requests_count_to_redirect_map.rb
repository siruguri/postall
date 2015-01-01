class AddRedirectRequestsCountToRedirectMap < ActiveRecord::Migration
  def change
    add_column :redirect_maps, :redirect_requests_count, :integer
  end
end
