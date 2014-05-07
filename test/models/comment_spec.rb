require 'spec_helper'

describe Comment do
  let(comment) {Comment.new}

  it "should set content" do
    comment.content = "This is a comment."
    comment.save
    expect(comment.content).to eq "This is a comment."
  end

  it "should not have empty content" do

  end

  it "should have commentable_id" do
  end

  it "should have a commmetable_type" do

  end

  it "should return comments in reverse chronological order" do

  end


  
end



    # t.text    "content"
    # t.integer "commentable_id"
    # t.string  "commentable_type"