require 'spec_helper'

describe Comment do
  let(:comment) {Comment.new}
  let(:image) {Image.create(:title => "image #1", image_date: 2.days.ago)}
  let(:event) {Event.create(:name => "event #1", event_date: 2.weeks.ago)}

  it "should set content" do
    comment.content = "This is a comment."
    comment.save
    expect(comment.content).to eq "This is a comment."
  end

  it "should not have empty content" do
    comment.content = ""
    comment.save
    comment.should_not be_valid
  end

  it "should have commentable_id" do
    image.comments << comment
    image.save
    comment.commentable_id.should_not be_nil
  end

  it "should have a commmetable_type of Image if associated with an image" do
    image.comments << comment
    image.save
    comment.commentable_type.should eq "Image"
  end

  it "should have a commmetable_type of Event if associated with an image" do
    event.comments << comment
    event.save
    comment.commentable_type.should eq "Event"
  end

  it "should return comments in reverse chronological order" do
    comment_1 = Comment.new(:content => "Comment #1")
    comment_1.save
    comment_1.created_at = 1.week.ago
    comment_1.save
    comment_2 = Comment.new(:content => "Comment #2")
    image.comments << comment_2
    image.comments << comment_1
    image.save
    expect(image.comments[0]).to eq comment_2
  end

end



    # t.text    "content"
    # t.integer "commentable_id"
    # t.string  "commentable_type"