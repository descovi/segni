class Website < ActiveRecord::Base
  validates :name, presence: true
  has_many :pages
  has_many :products
  belongs_to :user
  belongs_to :first_page, class_name: 'Page'
end
