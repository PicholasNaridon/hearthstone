require 'rails_helper'

RSpec.describe Deck, type: :deck do
let!(:user) { FactoryGirl.create(:user) }

  it { should have_valid(:name).when('Test', 'name') }
  it { should_not have_valid(:name).when(nil) }
  it { should_not have_valid(:name).when('') }

  it 'has a valid factory' do
    expect(FactoryGirl.build(:deck, user: user)).to be_valid
  end
end
