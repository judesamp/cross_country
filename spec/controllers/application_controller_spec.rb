require 'spec_helper'

describe ApplicationController do 
  let(:user) { FactoryGirl.create(:user) }
  let(:image) { FactoryGirl.create(:image) }

  describe "#current_user" do

    it "should return the current user (if they're logged in)" do
      login(user)
      expect(current_user).to eq user
    end


    it "should return an error if not logged in" do
      expect { current_user }.to raise_error
    end

  end

end