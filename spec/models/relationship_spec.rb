require 'rails_helper'

RSpec.describe Relationship, :type => :model do

  let(:follower) { FactoryGirl.create(:user) }
  let(:followed) { FactoryGirl.create(:user) }
  let(:relationship) { follower.relationships.build(followed_id: followed.id) }


  subject {relationship}

  it { should be_valid }

  
  describe "follower methods" do
    it { should respond_to(:follower) }
    it { should respond_to(:followed) }

    its(:follower) { should eq follower }
    its(:followed) { should eq followed }
  end


end
