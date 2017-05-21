class Story < ApplicationRecord
  mount_uploader :img, ImgUploader
  belongs_to :item
end
