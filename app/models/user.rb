class User < ApplicationRecord
  authenticates_with_sorcery!
  mount_uploader :avatar, AvatarUploader

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :full_name, presence: true, length: { maximum: 255 }
  validates :nickname, presence: true, length: { maximum: 255 }
  validates :email, presence: true, uniqueness: true
  validates :reset_password_token, presence: true, uniqueness: true, allow_nil: true

  has_many :boards, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_boards, through: :bookmarks, source: :board

  def own?(object)
    id == object.user_id
  end

  def bookmark(board)
    bookmark_boards << board
  end

  def unbookmark(board)
    bookmark_boards.destroy(board)
  end

  def bookmark?(board)
    bookmark_boards.include?(board)
  end

  def avatar_url
    avatar.url || "default_image.png"
  end
end

