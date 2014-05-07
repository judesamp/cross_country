require 'spec_helper'

describe Tag do
  let(:tag) {Tag.new(name: "Kick it!" )}
  let(:image) {Image.create}
  let(:event) {Event.create}

  it "should set name" do
    tag.name = "This is a tag."
    tag.save
    expect(tag.name).to eq "This is a tag."
  end

  it "should not have empty content" do
    tag.name = ""
    tag.save
    tag.should_not be_valid
  end

  it "should have an associated image" do
    image.tags << tag
    image.save
    expect(image.tags.first).to eq tag
  end

end