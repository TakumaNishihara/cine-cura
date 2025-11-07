class User < ApplicationRecord
  has_many :posts, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one_attached :profile_image
  
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

end
