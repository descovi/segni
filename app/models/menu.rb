class Menu < ActiveRecord::Base
  belongs_to :website
  validates :name, presence: true
  validates :url, presence: true
  validates :website, presence: true
  validates :position, presence: true
  validates :position, uniqueness: { scope: :website_id, message: "This is position is already used" }

  def self.last_position
    last.position
  end
end
