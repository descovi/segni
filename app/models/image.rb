class Image < ActiveRecord::Base
  has_attached_file :url, styles: { 
    _100x100c:  '100x100#', 
    _1150x850d: '1150x850#',
    block6:     '390x390#',
    _300height: '1150x300#'
  }, 
  convert_options: { 
    _100x100c:  '-quality 90 -strip',
    _1150x850d: '-quality 90 -strip',
    block6:     '-quality 90 -strip',
    _300height: '-quality 90 -strip'
  }
  crop_attached_file :url
  validates_attachment_content_type :url, content_type: /\Aimage\/.*\Z/
  belongs_to :simple_block
end