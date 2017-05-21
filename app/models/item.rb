class Item < ApplicationRecord
  mount_uploader :img, ImgUploader
  belongs_to :user
  has_many :storys
  has_many :likes
  has_many :realizers, class_name: :User, through: :likes
end
