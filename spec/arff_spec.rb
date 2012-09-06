require_relative 'spec_helper'

describe Arff do 

	context "simplest" do

		before(:all) do
			@arff = Arff.open("#{FIXTURE_PATH}/simplest.arff")
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

		it "should return arff file as a single string object" do
			arff_file = File.open("#{FIXTURE_PATH}/simplest.arff")
			expected = arff_file.readlines.collect do |line|
				line.chomp!
			end
			@arff.to_s.should == expected 
		end

	end

	context "advanced functinal" do
		
		it "sample 6 instances into 3 instances with sample rate 2" do
			@arff = Arff.open("#{FIXTURE_PATH}/6_instances.arff")
			@arff.sample(2).should == Arff.open("#{FIXTURE_PATH}/3_instances.arff")
		end
		
	end

end
