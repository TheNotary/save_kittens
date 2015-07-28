class CreateSignatures < ActiveRecord::Migration
  def change
    create_table :signatures do |t|
      t.string :name
      t.string :email
      t.string :zip
      t.string :state
      t.boolean :subscriber

      t.timestamps
    end
  end
end
