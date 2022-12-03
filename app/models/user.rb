class User < ApplicationRecord
  has_many :posts, foreign_key: 'users_id'
  has_many :likes, foreign_key: 'users_id'
  has_many :comments, foreign_key: 'users_id'

  paginates_per 10

  validates :name, presence: true
  validates :posts_count, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0
  }

  def post_liked?(post)
    likes.find_by(post:).present?
  end

  def recent_posts
    posts.order(updated_at: :desc).limit(3)
  end
end
