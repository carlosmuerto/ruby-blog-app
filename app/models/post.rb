class Post < ApplicationRecord
	has_many :Likes
	has_many :comments

  belongs_to :author, class_name: 'User', foreign_key: 'users_id'

  after_save :increment_author_posts_couter

  def increment_author_posts_couter
    author.increment!(:posts_count)
  end
end
