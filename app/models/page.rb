class Page < ActiveRecord::Base
  belongs_to :website
  has_many :page_translations
  has_many :pages
  has_many :simple_blocks, -> { order(position: :asc) }
  
  translates :title, :content, :slug
  extend FriendlyId
  friendly_id :title, use: [:slugged, :globalize, :scoped], scope: :website

  globalize_accessors locales: I18n.available_locales, attributes: [:title, :content]
end