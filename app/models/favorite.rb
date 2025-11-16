class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates_uniqueness_of :post_id, scope: :post_id
end
