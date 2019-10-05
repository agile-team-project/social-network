require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
  describe "groups#create action" do
    it "should allow the creation of groups when given the required info" do
      user = FactoryBot.create(:user)
      sign_in user
      post :create, params: { group: {name: "group name", description: "adjasd", category: "asd"} }

      group = Group.last
      
      expect(response).to redirect_to group_path(group)


      expect(group.name).to eq("group name")
      expect(group.description).to eq("adjasd")
    end 
  end  

  describe "groups#join action" do
    it "should allow a user to join a group" do
      user1 = FactoryBot.create(:user)
      sign_in user1

      post :create, params: { group: {name: "group name", description: "adjasd", category: "asd"} }
      group = Group.last
      expect(group.owner).to eq(user1)
      sign_out user1

      user2 = FactoryBot.create(:user)
      sign_in user2
      patch :join, params: {id: group.id}
      expect(group.users).to include(user2)
    end
  end
end
