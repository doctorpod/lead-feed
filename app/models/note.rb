class Note < ActiveRecord::Base
  attr_accessible :body, :lead_id
  belongs_to :lead
  validates_presence_of :body
end
