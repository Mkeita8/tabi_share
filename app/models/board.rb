class Board < ApplicationRecord
  validates :title, presence: { message: "地名・建物名を入力してください" }
  validates :official_link, format: { with: /\Ahttps?:\/\/[\S]+\z/, message: "正しいURLを入力してください" }, allow_blank: true
  validates :body, format: { with: /\A(#[^\s#]+)+\z/, message: "半角 # から始めてください" }
  validates :address, presence: { message: "住所を入力してください" }
  validates :board_image, presence: { message: "写真を追加してください" }

  belongs_to :user
  
  has_many :bookmarks, dependent: :destroy
  has_many :board_hashtag_relations, dependent: :destroy
  has_many :hashtags, through: :board_hashtag_relations

  mount_uploader :board_image, BoardImageUploader

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def self.ransackable_attributes(auth_objects = nil)
    %w[title body]
  end

  def self.ransackable_associations(auth_objects = nil)
    []
  end

  after_create do
    board = Board.find_by(id: self.id)
    hashtags = self.body.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    board.hashtags = []
    hashtags.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      board.hashtags << tag
    end
  end

  before_update do
    board = Board.find_by(id: self.id)
    board.hashtags.clear
    hashtags = self.body.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      board.hashtags << tag
    end
  end
end
