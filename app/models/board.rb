class Board < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true, length: { maximum: 65_535 }

  belongs_to :user
  
  has_many :bookmarks, dependent: :destroy
  has_many :board_hashtag_relations
  has_many :hashtags, through: :board_hashtag_relations

  mount_uploader :board_image, BoardImageUploader

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
