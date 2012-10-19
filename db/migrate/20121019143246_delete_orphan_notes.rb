class DeleteOrphanNotes < ActiveRecord::Migration
  def change
    Note.all.each do |n|
      n.delete if n.lead.nil?
    end
  end
end
