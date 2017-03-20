require 'rails_helper'

RSpec.describe Card, type: :card do

  it { should have_valid(:cardId).when(1) }
  it { should have_valid(:name ).when('name') }
  it { should have_valid(:cardSet).when('set') }
  it { should have_valid(:cardType ).when('type') }
  it { should have_valid(:faction ).when('faction') }
  it { should have_valid(:rarity).when('rarity') }
  it { should have_valid(:cost).when(1) }
  it { should have_valid(:text).when('text') }
  it { should have_valid(:flavor).when('flavor') }
  it { should have_valid(:artist).when('artist') }
  it { should have_valid(:collectible).when(true, false) }
  it { should have_valid(:playerClass).when('playerClass') }
  it { should have_valid(:howToGet).when('howToGet') }
  it { should have_valid(:howToGetGold).when('howToGetGold') }
  it { should have_valid(:img).when('test.png', 'test.jpg') }
  it { should have_valid(:imgGold).when('test.png', 'test.jpg') }
  it { should have_valid(:locale).when('locale') }

end

# it { should_not have_valid(:cardId).when('test') }
# it { should_not have_valid(:name ).when(1) }
# it { should_not have_valid(:cardSet).when(1) }
# it { should_not have_valid(:cardType ).when(true) }
# it { should_not have_valid(:faction ).when(1) }
# it { should_not have_valid(:rarity).when(false) }
# it { should_not have_valid(:cost).when('string') }
# it { should_not have_valid(:text).when(1) }
# it { should_not have_valid(:flavor).when(2) }
# it { should_not have_valid(:artist).when(3) }
# it { should_not have_valid(:collectible).when('string', 1) }
# it { should_not have_valid(:playerClass).when(1) }
# it { should_not have_valid(:howToGet).when(2) }
# it { should_not have_valid(:howToGetGold).when(3) }
# it { should_not have_valid(:img).when(4) }
# it { should_not have_valid(:imgGold).when(5, 'test') }
# it { should_not have_valid(:locale).when(1) }
