class Like < ApplicationRecord
  belongs_to :post, class_name: 'Post', foreign_key: 'posts_id'
  belongs_to :author, class_name: 'User', foreign_key: 'users_id'

  validates :posts_id, uniqueness: { scope: :users_id }

  validates :post, presence: true
	validates :author, presence: true

  after_save :increment_like_couter

  private

  def increment_like_couter
    post.increment!(:likes_counter)
  end
end
