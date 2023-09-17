class FriendshipsController < ApplicationController
    before_action :authenticate_user!
  
    # Create a new friendship (follow)
    def create
      friend = User.find(params[:friend_id])
      current_user.follow(friend)
      redirect_to friend, notice: 'You are now following this user.'
    end
  
    # Destroy a friendship (unfollow)
    def destroy
      friend = User.find(params[:id])
      current_user.unfollow(friend)
      redirect_to friend, notice: 'You have unfollowed this user.'
    end
  
    # Index action to retrieve and display friendships
    def index
        @friendships = current_user.friendships # Replace with your logic to retrieve friendships
        render json: @friendships
      end
  end
  