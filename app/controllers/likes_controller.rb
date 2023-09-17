class LikesController < ApplicationController
    before_action :authenticate_user! # Assuming you want to authenticate users
  
    def create
      @post = Post.find(params[:post_id])
      like = current_user.likes.build(post: @post)
  
      if like.save
        # Handle successful like creation
        redirect_to @post, notice: 'Post liked!'
      else
        # Handle like creation failure
        redirect_to @post, alert: 'Unable to like the post.'
      end
    end
  
    def destroy
      @post = Post.find(params[:post_id])
      like = current_user.likes.find_by(post: @post)
  
      if like&.destroy
        # Handle successful unlike
        redirect_to @post, notice: 'Post unliked!'
      else
        # Handle unlike failure (e.g., if like doesn't exist)
        redirect_to @post, alert: 'Unable to unlike the post.'
      end
    end
  end
  