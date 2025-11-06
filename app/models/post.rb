class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :title, :body, :release, :timeline, presence: true

  validates :release,  numericality: {
    only_integer: true, greater_than_or_equal_to: 1000, less_than_or_equal_to: 9999,
    allow_nil: true, message: 'は4桁の数字で入力してください'
  }

  validates :timeline, numericality: {
    only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 99,
    allow_nil: true, message: 'は1〜99の数字で入力してください'
  }
end
