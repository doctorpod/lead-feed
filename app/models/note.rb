class Note < ActiveRecord::Base
  attr_accessible :body, :lead_id, :title
  
  belongs_to :lead
end
