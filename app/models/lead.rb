class Lead < ActiveRecord::Base
  attr_accessible :contact, :description, :email, :organisation, :status,
                  :telephone, :title, :user_id, :last_contacted, :tag_list

  validates :title, :presence => true
  validates :description, :presence => true

  STATES = ['INTEREST', 'MEETINGS', 'PROPOSED', 'WON', 'DEAD']

  acts_as_taggable

  belongs_to :user
  has_many :notes, :order => 'created_at DESC', :dependent => :delete_all

  scope :won, where("status = 'WON'")
  scope :dead, where("status = 'DEAD'")

  # Had to override this here as there seems to be a bug in acts_as_taggable
  # http://stackoverflow.com/questions/12661633/missing-column-error-in-acts-as-taggable-on-gem-with-rails-3-and-sqlite3
  # Have also modified it to partition the counts by user_id
  # def self.tag_counts(user_id)
  #   # Assuming MySQL
  #   mysql_results = connection.execute(
  #     "SELECT t.id AS id, t.name AS name, COUNT(x.tag_id) AS count " +
  #     "FROM tags t, taggings x, leads l " +
  #     "WHERE t.id = x.tag_id AND x.taggable_id = l.id AND l.user_id = #{user_id} " +
  #     "GROUP BY t.name")
  #
  #   results = []
  #   mysql_results.each_hash do |h|
  #     results << h
  #   end
  #
  #   results.map do |result|
  #     ActsAsTaggableOn::Tag.select("*, #{result['count']} AS count").where("id = #{result['id']}").first
  #   end
  # end

  def human_contact
    organisation.empty? ? contact : "#{contact} (#{organisation})"
  end
end
