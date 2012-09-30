class Lead < ActiveRecord::Base
  attr_accessible :contact, :description, :email, :organisation, :status, 
                  :telephone, :title, :user_id, :last_contacted, :tag_list
  
  STATES = ['INTEREST', 'MEETINGS', 'PROPOSED', 'WON', 'DEAD']
  
  acts_as_taggable
  
  belongs_to :user
  has_many :notes, :order => 'created_at DESC'
  
  # Had to override this here as there seems to be a bug in acts_as_taggable
  # http://stackoverflow.com/questions/12661633/missing-column-error-in-acts-as-taggable-on-gem-with-rails-3-and-sqlite3
  def self.tag_counts
    ActsAsTaggableOn::Tag.select("tags.*, count(taggings.tag_id) as count").
      joins(:taggings).group("taggings.tag_id")
  end

  def human_contact
    organisation.empty? ? contact : "#{contact} (#{organisation})"
  end
end
