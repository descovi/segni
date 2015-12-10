class SimpleBlock < ActiveRecord::Base
  belongs_to :page
  styles = { 
    medium: "300x300>", 
    thumb: "100x100>",
    big: "1024x1024#",
    big_standard: "1080x720",
    big_hq: "1600x1200"
  }
  has_attached_file :background_image, styles: styles

  has_attached_file :image_1, styles: styles
  has_attached_file :image_2, styles: styles
  has_attached_file :image_3, styles: styles
  has_attached_file :image_4, styles: styles
  has_attached_file :image_5, styles: styles
  has_attached_file :image_6, styles: styles
  
  translates :title, :content, :action
  validates_attachment_content_type :background_image, content_type: /\Aimage\/.*\Z/
  globalize_accessors locales: I18n.available_locales
end