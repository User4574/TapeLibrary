require 'rubygems'
require 'docile'

Library = Struct.new(:name, :tapes)

class LibraryBuilder
	def initialize name
		@name = name
		@nextslot = 1
		@tapes = Hash.new
	end
	def tape name, opts = {}
		slot = opts[:slot]
		if slot.nil? then
			@tapes[name] = @nextslot
			@nextslot += 1
		else
			@nextslot += 1 if slot == @nextslot
			@tapes[name] = slot
		end
	end
	def build
		Library.new @name, @tapes
	end
end

def library name, &block
	Docile.dsl_eval(LibraryBuilder.new(name), &block).build
end

Robot = Struct.new(:name, :libraries)

class RobotBuilder
	def initialize name
		@name = name
		@libraries = Hash.new
	end
	def uselibrary library
		@libraries[library.name] = library
	end
	def build
		Robot.new @name, @libraries
	end
end

def robot name, &block
	Docile.dsl_eval(RobotBuilder.new(name), &block).build
end

Backup = Struct.new(:name, :robot, :backups)

class BackupBuilder
	def initialize name, robot
		@name = name
		@robot = robot
	end
	def backup bkp = {}
		bkp.each do |dir, lib|
			puts "Backup #{@name}: Backing up #{dir} to library #{lib} on robot #{@robot.name}"
		end
	end
end

def backups name, robot, &block
	Docile.dsl_eval(BackupBuilder.new(name, robot), &block)
end
