class AddHideFlagsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :hide_won, :boolean, :default => false
    add_column :users, :hide_dead, :boolean, :default => false
  end
end
