class Opera < ActiveRecord::Base
  # d is for dynamic
  # c is for cropped
  has_attached_file :image, styles: { 
    _20x20c: '20x20#',
    _50x50c: '50x50#',
    _100x100c:  '100x100#',
    _200x200c:  '200x200#',
    _1024x768d: '1024x768>',
    _1150x850d: '1150x850>' 
  }, 
  convert_options: { 
    _20x20c: '-quality 75 -strip',
    _50x50c: '-quality 75 -strip',
    _100x100c: '-quality 75 -strip',
    _200x200c: '-quality 75 -strip',
    _1024x768d: '-quality 90 -strip',
    _1150x850d: '-quality 90 -strip'
  }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  
  validates :archive_index, uniqueness: true
  validates :archive_index, presence: true
  validates :name, presence: true
  validates :year, presence: true

  belongs_to :website
  belongs_to :surface
  belongs_to :subject
  validates :website_id, presence: true
  #translates :title, :description

  def other_from_same_websites
    Opera.where(website: self.website).where.not(id: self.id)
  end
end
