# frozen_string_literal: true

class FriendshipsController < ApplicationController
  def destroy
    if @friendship = current_user.friendships.where(friend_id: params[:id]).first.destroy
      flash[:notice] = 'Friend was successfully removed'
    else
      flash[:notice] = 'Friend cannot be removed'
    end
    redirect_to my_friends_path
  end
end
