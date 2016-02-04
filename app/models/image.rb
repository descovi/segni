class Image < ActiveRecord::Base
  has_attached_file :url, styles: { _1150x850d: "1150x850>" }, 
                          convert_options: { _1150x850d: '-quality 90' }
  crop_attached_file :url
  validates_attachment :url, content_type: /\Aimage\/.*\Z/
end