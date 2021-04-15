class Post < ApplicationRecord
  belongs_to :user
  has_many :replies, dependent: :destroy 
  acts_as_votable
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum:140} # tweets are capped at 140 chars.
  default_scope -> { order(created_at: :desc) } #display new tweet first
  has_one_attached :image

  attr_accessor :remove_image

  after_save :purge_image, if: :remove_image
  private def purge_image
    return unless @remove_image == "1"
      image.purge_later
  end
end
