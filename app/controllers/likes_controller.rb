class LikesController < ApplicationController
  before_action :authenticate_user!
	authorize_resource

  def create
    @post = Post.find params[:post_id]
    like = Like.new(author: current_user, post: @post)

		authorize! :create, like

		like.save
    redirect_to user_post_path @post.author, @post
  end
end
