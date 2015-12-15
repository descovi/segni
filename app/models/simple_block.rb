class SimpleBlock < ActiveRecord::Base
  belongs_to :page
  styles = { 
    medium: "300x300>", 
    block6: "650x350>",
    big: "1024x1024#",
    big_standard: "1080x720",
    big_hq: "1600x1200"
  }

  convert_options = {
    medium: '-quality 75 -strip',
    block6: '-quality 90 -strip',
    big: '-quality 90 -strip',
    big_standard: '-quality 90 -strip',
    big_hq: '-quality 90 -strip',
  }

  has_attached_file :background_image, styles: styles, convert_options: convert_options

  has_attached_file :image_1, styles: styles, convert_options: convert_options
  has_attached_file :image_2, styles: styles, convert_options: convert_options
  has_attached_file :image_3, styles: styles, convert_options: convert_options
  has_attached_file :image_4, styles: styles, convert_options: convert_options
  has_attached_file :image_5, styles: styles, convert_options: convert_options
  has_attached_file :image_6, styles: styles, convert_options: convert_options
  
  translates :title, :content, :action
  validates_attachment_content_type :background_image, content_type: /\Aimage\/.*\Z/
  globalize_accessors locales: I18n.available_locales
end