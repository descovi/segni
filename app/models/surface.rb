class Surface < ActiveRecord::Base
  has_many :operas
  translates :name, :description
end