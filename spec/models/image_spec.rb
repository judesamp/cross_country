require 'spec_helper'


describe Image do
  let(:image_with_no_title) {Image.new(:image_data => "data")}
  let(:image_with_no_image_data) {Image.new(:title => "title")}


  it "should have a title" do
    image_with_no_title.should_not be_valid
  end

  it "should have an image" do
    image_with_no_image_data.should_not be_valid
  end

  # it "should return images in reverse chronological order (based on image_date)" do
  #   image_1 = Image.new(:title => "image #1", image_date: 2.days.ago)
  #   image_1.save
  #   image_2 = Image.new(:title => "image #2", image_date: 1.days.ago)
  #   image_2.save
  #   all_images = Image.descending
  #   expect(all_images.first).to eq image_2
  # end

end
