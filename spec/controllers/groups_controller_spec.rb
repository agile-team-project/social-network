# frozen_string_literal: true
class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = Group.all.order(:name)
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.owner = current_user
    @group.users << current_user
    @group.save
    redirect_to group_path(@group)
  end

  def destroy
    if current_user == current_group.owner
      current_group.destroy
      redirect_to root_path
    else
      redirect_to group_path(current_group), alert: 'You are not the owner of the group.'
    end
  end

  def edit; end

  def update; end

  def join
    if current_group.users.include? current_user
      redirect_to group_path(current_group), alert: "You are already a member"
    else
      current_group.users << current_user
      redirect_to group_path(current_group)
    end
  end

  def leave
    if current_user == current_group.owner
      redirect_to group_path(current_group),alert: "Group owners cannot leave groups, pass ownership or delete group."
    else
      current_group.users.delete(current_user)
      redirect_to group_path(current_group) 
    end
      
  end

  def show

  end

  private

  helper_method :current_group
  def current_group
    @current_group ||= Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :description, :category)
  end
end
