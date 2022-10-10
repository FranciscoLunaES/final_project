# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user = build(:user)
  end

  it 'creates a user if it is valid' do
    expect(@user).to be_valid
  end

  it "doesn't creates a user if email is not valid" do
    @user.email = 'test'
    expect(@user).not_to be_valid
  end

  it "doesn't creates a user if name is not valid" do
    @user.name = ''
    expect(@user).not_to be_valid
  end
end
