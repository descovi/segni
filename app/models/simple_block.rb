class SimpleBlock < ActiveRecord::Base
  belongs_to :page
  acts_as_list scope: :page
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
  validates :custom_type, presence: true

  def custom_type_label
    map = {
      'products-block' => 'Products',
      'text-with-image' => 'Text',
      'image-block' => 'Images'
    }
    "#{map[self.custom_type]} block"
  end
  def name_of_view
    custom_type.gsub!('-', '_')
  end

  def css_class
    css_class_custom = ''
    [
      ['block-background-photo', self.background_image.present?],
      ['block-colors-inverted', self.colors_inverted]
    ].each do |option|
      css_class_custom += "#{option[0]} " if option[1] == true
    end
    css_class_custom
  end
end