class Menu < ActiveRecord::Base
  belongs_to :website
  belongs_to :page
  validates :name, presence: true
  validates :website, presence: true
  validates :position, presence: true
  validates :position, uniqueness: { scope: :website_id, message: "This is position is already used " }
  acts_as_list scope: :website
  translates :name
  
  def self.last_position
    return order(:position).last.position if last.present?
    0
  end
end
