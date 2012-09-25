class Lead < ActiveRecord::Base
  attr_accessible :contact, :description, :email, :organisation, :status, :telephone, :title, :user_id
  
  STATES = ['INTEREST', 'MET', 'PROPOSED', 'WON', 'DEAD']
  
  belongs_to :user
  has_many :notes
end
