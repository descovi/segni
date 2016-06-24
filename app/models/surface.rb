class Surface < ActiveRecord::Base
  has_many :operas
  translates :name
  globalize_accessors locales: I18n.available_locales, attributes: [:name]
end