class GroupsController < ApplicationController

  def index
    @groups = Group.all.order(:name)
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.create(group_params)
    redirect_to group_path(@group)
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to root_path
  end

  def edit

  end

  def update
    
  end

  def show
    @group = Group.find(params[:id])
  end

  private

  def group_params
    params.require(:group).permit(:name, :description)
  end
end
