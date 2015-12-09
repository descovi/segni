class SimpleBlock < ActiveRecord::Base
  belongs_to :page
  has_attached_file :background_image, styles: { 
    medium: "300x300>", 
    thumb: "100x100>",
    big: "1024x1024#",
    big_hq: "1600x1200"
  }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :background_image, content_type: /\Aimage\/.*\Z/
end