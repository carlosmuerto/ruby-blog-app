class Comment < ApplicationRecord
  belongs_to :post, class_name: 'Post', foreign_key: 'posts_id'
  belongs_to :author, class_name: 'User', foreign_key: 'users_id'

  after_save :increment_comment_couter

	private

  def increment_comment_couter
    post.increment!(:comments_counter)
  end
end
