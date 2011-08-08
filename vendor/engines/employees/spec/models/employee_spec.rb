require 'spec_helper'

describe Employee do

  def reset_employee(options = {})
    @valid_attributes = {
      :id => 1,
      :name => "RSpec is great for testing too"
    }

    @employee.destroy! if @employee
    @employee = Employee.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_employee
  end

  context "validations" do
    
    it "rejects empty name" do
      Employee.new(@valid_attributes.merge(:name => "")).should_not be_valid
    end

    it "rejects non unique name" do
      # as one gets created before each spec by reset_employee
      Employee.new(@valid_attributes).should_not be_valid
    end
    
  end

end