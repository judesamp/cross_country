require 'spec_helper'

describe User do
  let(:user_with_no_name) { User.new( password: "bill" )}
  let(:user_with_no_password) { User.new(email: "user1@email.com" )}

  it "should require an email" do
    user_with_no_name.should_not be_valid
  end

  it "should require a password" do
    user_with_no_password.should_not be_valid
  end

end




    # t.string "name"
    # t.string "type"
    # t.string "password_digest"
    # t.string "email"