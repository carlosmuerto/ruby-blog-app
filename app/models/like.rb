class Like < ApplicationRecord
  belongs_to :posts
  belongs_to :author, class_name: 'User', foreign_key: 'users_id'

  after_save :increment_like_couter

  private

  def increment_like_couter
    post.increment!(:likes_counter)
  end
end
