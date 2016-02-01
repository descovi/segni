class Menu < ActiveRecord::Base
  belongs_to :website
  validates :name, presence: true
  validates :url, presence: true
  validates :website, presence: true
end
