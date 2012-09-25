class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :lead_id
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
