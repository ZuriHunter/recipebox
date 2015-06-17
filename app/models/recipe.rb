class Recipe < ActiveRecord::Base
  belongs_to :user
  
  has_many :ingredients
  has_many :directions
  #sets up the nested form for cocoon gem to draw the correlation between ingredients/directions with recipe
  
  
  accepts_nested_attributes_for :ingredients, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :directions, :reject_if => :all_blank, :allow_destroy => true
  
  has_attached_file :image, styles: { :medium => "400x400#" }
  #the hash tag by the pixel size for the image tells the gem to crop the image
  
  validates :title, :description, :image, presence: true
  #only acceptes if these attributes have been filled by user
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
