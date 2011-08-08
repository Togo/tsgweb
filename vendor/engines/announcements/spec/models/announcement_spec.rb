require 'spec_helper'

describe Announcement do

  def reset_announcement(options = {})
    @valid_attributes = {
      :id => 1,
      :league => "RSpec is great for testing too"
    }

    @announcement.destroy! if @announcement
    @announcement = Announcement.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_announcement
  end

  context "validations" do
    
    it "rejects empty league" do
      Announcement.new(@valid_attributes.merge(:league => "")).should_not be_valid
    end

    it "rejects non unique league" do
      # as one gets created before each spec by reset_announcement
      Announcement.new(@valid_attributes).should_not be_valid
    end
    
  end

end