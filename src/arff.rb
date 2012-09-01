class Arff

	def initialize(arff_file_path)
		lines = read_lines(arff_file_path)
		@relation = parse_relation(lines[0])
		@instances = parse_instances(lines)
		@attributes = parse_attributes(lines)
	end

	def relation
		@relation
	end

	def [](index)
		@instances[index]
	end

	def all
		@instances
	end

	def attributes
		@attributes
	end

private

	def read_lines(arff_file_path)
		file = File.open(arff_file_path)
		lines = file.readlines.collect do |line|
			line.chomp!
		end
		file.close
		lines
	end

	def parse_relation(line)
		line.match(/@relation (.*)/)[1]
	end

	def parse_instances(lines)
		data_index = lines.index("@data")
		lines[data_index+1..-1]
	end

	def parse_attributes(lines)
		lines.inject([]) do |attributes, line|
			if line.match(/@attribute .*/)
				attributes << line
			end
			attributes
		end
	end

end
