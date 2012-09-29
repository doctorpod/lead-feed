class Lead < ActiveRecord::Base
  attr_accessible :contact, :description, :email, :organisation, :status, 
                  :telephone, :title, :user_id, :last_contacted
  
  STATES = ['INTEREST', 'MEETINGS', 'PROPOSED', 'WON', 'DEAD']
  
  belongs_to :user
  has_many :notes, :order => 'created_at DESC'
  
  def human_contact
    organisation.empty? ? contact : "#{contact} (#{organisation})"
  end
end
