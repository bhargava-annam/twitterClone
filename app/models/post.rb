class Post < ApplicationRecord
  belongs_to :user
  acts_as_votable
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum:140} # tweets are capped at 140 chars.
  default_scope -> { order(created_at: :desc) } #display new tweet first
end
