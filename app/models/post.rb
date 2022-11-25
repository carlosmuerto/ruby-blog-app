class Post < ApplicationRecord
  has_many :Likes, foreign_key: 'posts_id'
  has_many :comments, foreign_key: 'posts_id'

  belongs_to :author, class_name: 'User', foreign_key: 'users_id'

  after_save :increment_author_posts_couter

  def increment_author_posts_couter
    author.increment!(:posts_count)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
