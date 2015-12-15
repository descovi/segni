class Product < ActiveRecord::Base
  # d is for dynamic
  # c is for cropped
  has_attached_file :image, styles: { 
    _50x50c: '50x50#',
    _100x100c:  '100x100#',
    _1024x768d: '1024x768>' 
  }, 
  convert_options:  { 
    _100x100c: '-quality 75 -strip',
    _1024x768d: '-quality 90 -strip'
  }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates :website, presence: true
  belongs_to :website
end