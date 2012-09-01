require 'stringio'

#require all source files
Dir[File.dirname(__FILE__) + "/../src/**/*.rb"].each do |source_file|
	require source_file
end

#fixture path
FIXTURE_PATH = File.dirname(__FILE__) + "/fixture"
