class Page < ActiveRecord::Base
  belongs_to :website
  has_many :page_translations
  
  translates :title, :content, :slug
  extend FriendlyId
  friendly_id :title, use: [:globalize]
end