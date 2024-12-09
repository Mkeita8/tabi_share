class BoardHashtagRelation < ApplicationRecord
  belongs_to :board
  belongs_to :hashtag
  with_options presence: true do
    validates :board_id
    validates :hashtag_id
  end
end
