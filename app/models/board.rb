class Board < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true, length: { maximum: 65_535 }

  belongs_to :user
  
  has_many :bookmarks, dependent: :destroy

  mount_uploader :board_image, BoardImageUploader

  def self.ransackable_attributes(auth_objects = nil)
    %w[title body]
  end

  def self.ransackable_associations(auth_objects = nil)
    []
  end
end
