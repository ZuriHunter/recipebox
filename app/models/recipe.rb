class Recipe < ActiveRecord::Base
  has_attached_file :image, styles: { :medium => "400x400#" }
  #the hash tag by the pixel size for the image tells the gem to crop the image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
