class AddUnconfirmedEmailToDeviseUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      ## Confirmable
      t.string   :unconfirmed_email
    end
  end
end
