class ImagesOpera < ActiveRecord::Base
  belongs_to :opera
  belongs_to :image
  accepts_nested_attributes_for :image, :reject_if => :all_blank
  accepts_nested_attributes_for :opera, :reject_if => :all_blank
end