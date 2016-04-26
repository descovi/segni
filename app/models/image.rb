class Image < ActiveRecord::Base
  has_attached_file :url, styles: { 
    _20x20c: '20x20#',
    _100x100c:  '100x100#', 
    _1150x850d: '1150x850#',
    _1150x750d: '1150x750#',
    _1150x650d: '1150x650#',
    _1150x550d: '1150x550#',
    _1150x450d: '1150x450#',
    _1150x350d: '1150x350#',
    _1150x250d: '1150x250#',
    photo1150:  '1150x1150>',
    block6:     '390x390#',
    _300height: '1150x300#'
  }, 
  convert_options: { 
    _20x20c: '-quality 90 -strip',
    _100x100c:  '-quality 90 -strip',
    _1150x850d: '-quality 90 -strip',
    _1150x750d: '-quality 90 -strip',
    _1150x650d: '-quality 90 -strip',
    _1150x550d: '-quality 90 -strip',
    _1150x450d: '-quality 90 -strip',
    _1150x350d: '-quality 90 -strip',
    _1150x250d: '-quality 90 -strip',
    _300height: '-quality 90 -strip',
    photo1150:  '-quality 90 -strip',
    block6:     '-quality 90 -strip'
  }
  crop_attached_file :url
  validates_attachment_content_type :url, content_type: /\Aimage\/.*\Z/
  belongs_to :simple_block
end