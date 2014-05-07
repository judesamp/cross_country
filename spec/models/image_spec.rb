require 'spec_helper'


describe Image do
  let(:image_with_no_title) {Image.new}


  it "should have a title" do
    image_with_no_title.should_not be_valid
  end

  # it "should have an image" do
  #   image_with_no_image_data.should_not be_valid
  # end

  it "should return images in reverse chronological order (based on image_date)" do
    image_1 = Image.new(:title => "image #1", image_date: 2.days.ago)
    image_1.save
    image_2 = Image.new(:title => "image #2", image_date: 1.days.ago)
    image_2.save
    all_images = Image.all
    expect(all_images[0]).to eq image_2
  end

end


 # t.string   "title"
 #    t.text     "description"
 #    t.datetime "image_date"
 #    t.string   "image_data"