# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task, type: :model do
  before(:all) do
    @label = create(:label)
  end

  it 'creates a label if it is valid' do
    expect(@label).to be_valid
  end

  it "doesn't creates a board if visibility is not public or private" do
    @label.name = ''
    expect(@label).not_to be_valid
  end
end
