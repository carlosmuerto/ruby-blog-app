class Comment < ApplicationRecord
  belongs_to :post, class_name: 'Post', foreign_key: 'posts_id'
  belongs_to :author, class_name: 'User', foreign_key: 'users_id'

  after_save :increment_comment_couter
  after_destroy :decrement_comments_counter

  validates :text, presence: true

  paginates_per 10

  private

  def decrement_comments_counter
    post.decrement!(:comments_counter)
  end

  def increment_comment_couter
    post.increment!(:comments_counter)
  end
end
