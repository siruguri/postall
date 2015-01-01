class CreateRedirectMaps < ActiveRecord::Migration
  def change
    create_table :redirect_maps do |t|
      t.string :src
      t.string :dest

      t.timestamps
    end
  end
end
