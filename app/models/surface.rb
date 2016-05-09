class Surface < ActiveRecord::Base
  has_many :operas
  translates :name
  default_scope {includes(:translations)}
end