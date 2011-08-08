require 'spec_helper'

describe Coach do

  def reset_coach(options = {})
    @valid_attributes = {
      :id => 1,
      :name => "RSpec is great for testing too"
    }

    @coach.destroy! if @coach
    @coach = Coach.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_coach
  end

  context "validations" do
    
    it "rejects empty name" do
      Coach.new(@valid_attributes.merge(:name => "")).should_not be_valid
    end

    it "rejects non unique name" do
      # as one gets created before each spec by reset_coach
      Coach.new(@valid_attributes).should_not be_valid
    end
    
  end

end