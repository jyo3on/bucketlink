class Story < ApplicationRecord
  mount_uploader :img, ImgUploader
  belongs_to :user
  belongs_to :item
end
