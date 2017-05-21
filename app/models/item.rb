class Item < ApplicationRecord
  mount_uploader :img, ImgUploader
  has_many :storys
end
