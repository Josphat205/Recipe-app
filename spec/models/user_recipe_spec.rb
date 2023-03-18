# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

RSpec.describe UserRecipe, type: :model do
  current_user = User.first

  subject do
    UserRecipe.new(name: 'Pizza', description: 'All the best description', cooking_time: 30, preparation_time: 30,
                   public: true, user: current_user)
  end

  before { subject.save }

  it 'Name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should return only Recipes with the public attibute set to true' do
    expect(UserRecipe.public_recipes_ordered_by_newest.count).to eq(0)
  end
end
