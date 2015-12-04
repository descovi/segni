class Page < ActiveRecord::Base
  belongs_to :website
  validates :website, presence: true
  translates :title, :content
end