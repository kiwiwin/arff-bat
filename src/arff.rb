class Arff	

	def self.open(arff_file_path)
		lines = read_lines(arff_file_path)
		relation = parse_relation(lines[0])
		instances = parse_instances(lines)
		attributes = parse_attributes(lines)
		Arff.new(relation, attributes, instances)		
	end

	def to_s
		result = []
		result << "@relation #{@relation}"
		result << ""
		result << @attributes
		result << ""
		result << "@data"
		result << @instances
		result.flatten!
	end

	def initialize(relation, attributes, instances)
		@relation = relation
		@attributes = attributes
		@instances = instances
	end

	def ==(obj)
  	return false if obj.relation != @relation
  	return false if obj.attributes != @attributes
		return false if obj.all != @instances
		return true
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

	def sample(sample_rate)
		index = 0
		sample_instances = @instances.inject([]) do |result, instance|
			result << instance if index % sample_rate == 0
			index += 1
			result
		end
		return Arff.new(@relation, @attributes, sample_instances)
	end

private

	def self.read_lines(arff_file_path)
		file = File.open(arff_file_path)
		lines = file.readlines.collect do |line|
			line.chomp!
		end
		file.close
		lines
	end

	def self.parse_relation(line)
		line.match(/@relation (.*)/)[1]
	end

	def self.parse_instances(lines)
		data_index = lines.index("@data")
		lines[data_index+1..-1]
	end

	def self.parse_attributes(lines)
		lines.inject([]) do |attributes, line|
			attributes << line if line.match(/@attribute .*/)
			attributes
		end
	end

end
