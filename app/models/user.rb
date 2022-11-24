class User < ApplicationRecord
	has_many :Likes
	has_many :comments
	has_many :posts
end
