# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
  describe 'groups#create action' do
    it 'should allow the creation of groups when given the required info' do
      post :create, params: { group: { name: 'group name', description: 'adjasd' } }

      group = Group.last

      expect(response).to redirect_to group_path(group)

      expect(group.name).to eq('group name')
      expect(group.description).to eq('adjasd')
    end
  end
end
