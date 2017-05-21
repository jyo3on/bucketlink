class Like < ApplicationRecord
  belongs_to :realizee, class_name: :Item, foreign_key: :item_id
  belongs_to :realizer, class_name: :User, foreign_key: :user_id
end
