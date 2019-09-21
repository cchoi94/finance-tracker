# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_stocks = @user.stocks
  end

  def my_portfolio
    @user = current_user
    @user_stocks = current_user.stocks
  end

  def my_friends
    @friendships = current_user.friends
  end

  def search
    if params[:search_param].present?
      @users = User.search(params[:search_param])
      @users = current_user.except_current_users(@users)
      if !@users.blank?
        render partial: 'friends/result'
      else
        flash[:danger] = "The searched user doesn't exist"
        render partial: 'friends/result'
      end
    else
      flash[:danger] = 'You have entered an empty search string'
      render partial: 'friends/result'
    end
  end

  def add_friend
    @friend = User.find(params[:friend])
    if current_user.friendships.create!(friend_id: @friend.id)
      flash[:success] = 'Friend was successfully added'
    else
      flash[:danger] = 'there was something wrong with the friend request'
    end
    redirect_to my_friends_path
  end
end
