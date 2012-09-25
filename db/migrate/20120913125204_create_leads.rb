class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string :contact
      t.string :telephone
      t.string :email
      t.string :organisation
      t.string :title
      t.text :description
      t.string :status

      t.timestamps
    end
  end
end
