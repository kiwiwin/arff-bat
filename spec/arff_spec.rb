require_relative 'spec_helper'

describe Arff do 

	before(:all) do
		@arff = Arff.new("#{FIXTURE_PATH}/simplest.arff")
	end

	it "relation name is simplest" do
		@arff.relation.should == "simplest"
	end

	it "should return 0, 0 for index 0 record" do
		@arff[0].should == "0, 0"
	end 

	it "should return all 3 instances for all" do
		@arff.all.should == ["0, 0", "1, 1", "2, 2"]
	end

	it "should return all 2 attributes for attributes" do
		@arff.attributes.should == ["@attribute X numeric", "@attribute Y numeric"]
	end

end
