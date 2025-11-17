class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  #いいねしたPost一覧を呼び出す場合は以下throughを使う
  #has_many :favorite_posts, through: :favorites, source: :post

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one_attached :profile_image
  
  # 名前は必須
  validates :name, presence: true

  # 退会済みユーザーはログイン不可にする
  def active_for_authentication?
    super && (self.is_active == true)
  end

  # ログイン失敗時のメッセージ
  def inactive_message
    "このユーザーアカウントは退会済みです。再度ご登録いただくか、管理者にお問い合わせください。"
  end

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_pro_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  # 検索機能
  def self.search_for(content, method)
    if method == 'perfect'
      User.where(name: content)
    elsif method == 'forward'
      User.where('name LIKE ?', content + '%')
    elsif method == 'backward'
      User.where('name LIKE ?', '%' + content)
    else
      User.where('name LIKE ?', '%' + content + '%')
    end
  end

  def favorite(post)
    self.favorites.find_or_create_by(post: post)
  end

  def unfavorite(post)
    favorite = self.favorites.find_by(post_id: post.id)
    favorite.destroy if favorite
  end
end
