require 'rails_helper'

RSpec.describe "MicropostPages", :type => :request do
  subject { page }
  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "Micropost creation" do
    before { visit root_path }




    #expect do
    #  xhr :post, :create, relationship: { followed_id: other_user.id }
    #end.to change(Relationship, :count).by(1)

    describe "with invalid information" do
      it "should not create a micropost" do
        #expect do
        #  xhr :post, :create, micropost: { content: "" }
        #end.not_to change(Micropost,:count)
        expect { click_button "Post" }.not_to change(Micropost, :count)
      end

      describe "error message" do
        before { click_button "Post" }
        it { should have_content("error") }
      end
    end


    describe "with valid information" do
      
      before { fill_in "micropost_content", with: "Lorem ipsum" }

      it "should create a micropost" do
        expect { click_button "Post" }.to change(Micropost, :count).by(1)
      end
    end


    describe "micropost destruction" do
      before { FactoryGirl.create(:micropost,user: user) }

      describe "as correct user" do
        before { visit root_path }

        it "should delete a micropost" do
          expect { click_link "delet" }.to change(Micropost,:count).by(-1)
        end
      end
    end

  end
end
