require 'rails_helper'

RSpec.describe "UserPages", :type => :request do

  before do
    @user = User.new(name:"Example User",email: "user@example.com",password:"foobar",password_confirmation:"foobar")
  end
  subject { @user }

  

  subject {page}

  describe "signup page" do
    before {visit signup_path}

    it {should have_content("Sign up")}
    it {should have_title(full_title("Sign up"))}
  end

end
  
