class Lead < ActiveRecord::Base
  attr_accessible :contact, :description, :email, :organisation, :status, 
                  :telephone, :title, :user_id, :last_contacted, :tag_list
  
  STATES = ['INTEREST', 'MEETINGS', 'PROPOSED', 'WON', 'DEAD']
  
  acts_as_taggable
  
  belongs_to :user
  has_many :notes, :order => 'created_at DESC'
  
  # Had to override this here as there seems to be a bug in acts_as_taggable
  # http://stackoverflow.com/questions/12661633/missing-column-error-in-acts-as-taggable-on-gem-with-rails-3-and-sqlite3
  # Have also modified it to partition the counts by user_id
  def self.tag_counts(user_id)
    results = connection.execute(
      "SELECT t.id AS id, t.name AS name, COUNT(x.tag_id) AS count " + 
      "FROM tags t, taggings x, leads l " +
      "WHERE t.id = x.tag_id AND x.taggable_id = l.id AND l.user_id = #{user_id} " +
      "GROUP BY t.name")
    
    results.map do |result|
      ActsAsTaggableOn::Tag.select("*, #{result['count']} AS count").where("id = #{result['id']}").first
    end
  end

  def human_contact
    organisation.empty? ? contact : "#{contact} (#{organisation})"
  end
end
