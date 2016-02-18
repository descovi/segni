class Website < ActiveRecord::Base
  validates :name, presence: true
  has_many :menus, -> {order 'position ASC'}
  has_many :pages
  has_many :products
  has_many :operas
  has_and_belongs_to_many :users
  belongs_to :template
  belongs_to :first_page, class_name: 'Page'

  def products_first_page
    products.where(first_page: true)
  end

  def products_from_other_websites
    Product.where.not(website_id: self.id)
  end

  def others_websites_with_same_domain
    Website.where("domain = ? AND id != ?", self.domain, self.id)
  end
end
