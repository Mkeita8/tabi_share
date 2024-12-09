class Hashtag < ApplicationRecord
  validates :hashname, presence: true, length: { maximum:99 }
  has_many :board_hashtag_relations
  has_many :boards, through: :board_hashtag_relations
end
