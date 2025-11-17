class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  validates :title, :body, :release, :timeline, presence: true

  validates :release,  numericality: {
    only_integer: true, greater_than_or_equal_to: 1000, less_than_or_equal_to: 9999,
    allow_nil: true, message: 'は4桁の数字で入力してください'
  }

  validates :timeline, numericality: {
    only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 99,
    allow_nil: true, message: 'は1〜99の数字で入力してください'
  }

  def favorited_by?(user)
    return false if user.nil?
    favorites.exists?(user_id: user.id)
  end

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  # タイトル検索
  def self.search_for_title(content, method)
    if method == 'perfect'
      Post.where(title: content)
    elsif method == 'forward'
      Post.where('title LIKE ?', content+'%')
    elsif method == 'backward'
      Post.where('title LIKE ?', '%'+content)
    else
      Post.where('title LIKE ?', '%'+content+'%')
    end
  end

  # タグ検索
  def self.search_for_tag(content, method)
    if method == 'perfect'
      Post.where(tag: content)
    elsif method == 'forward'
      Post.where('tag LIKE ?', content+'%')
    elsif method == 'backward'
      Post.where('tag LIKE ?', '%'+content)
    else
      Post.where('tag LIKE ?', '%'+content+'%')
    end
  end
  
end
