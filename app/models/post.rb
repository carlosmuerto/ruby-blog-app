class Post < ApplicationRecord
  has_many :likes, foreign_key: 'posts_id'
  has_many :comments, foreign_key: 'posts_id'

  belongs_to :author, class_name: 'User', foreign_key: 'users_id'

	paginates_per 5

  after_save :increment_author_posts_couter

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  validates :title, presence: true
	validates :author, presence: true
  validates :title, length: { maximum: 250 }
  validates :comments_counter, :likes_counter, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0
  }

  private

  def increment_author_posts_couter
    author.increment!(:posts_count)
  end
end
