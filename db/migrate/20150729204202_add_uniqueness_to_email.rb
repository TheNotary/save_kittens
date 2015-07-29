class AddUniquenessToEmail < ActiveRecord::Migration
  def change
    change_table :signatures do |t|
      t.index :email, :unique => true
    end
  end
end
