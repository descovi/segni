class Website < ActiveRecord::Base
  validates :name, presence: true
  has_many :pages
  has_many :products
  belongs_to :user
  belongs_to :first_page, class_name: 'Page'
  def products_first_page
    products.where(first_page: true)
  end
  def products_from_other_websites
    Product.where.not(website_id: self.id)
  end
end
