class Website < ActiveRecord::Base
  validates :name, presence: true
  has_many :pages
  has_many :operas
  belongs_to :user
end
