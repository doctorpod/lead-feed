class AddLastContactedToLeads < ActiveRecord::Migration
  def change
    add_column :leads, :last_contacted, :date
  end
end
