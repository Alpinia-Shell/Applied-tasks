class RelationshipsController < ApplicationController

  def create
    user = User.find(params[:user_id])
    current_user.follow(user)
    redirect_to request.referer

    # メソッド使わないならこれでもOK
    # user = User.find(params[:user_id])
    # relationship = current_user.active_relationships.new(followed_id:user_id)
    # relationship.save
    # redirect_to request.referer
  end

  def destroy
    user = User.find(params[:user_id])
    current_user.unfollow(user)
    redirect_to request.referer
  end

  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end
end
