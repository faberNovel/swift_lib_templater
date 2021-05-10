require 'optparse'
require 'find'
require 'fileutils'

require_relative 'swift_lib_templater/copy_template_command.rb'
require_relative 'swift_lib_templater/get_framework_name_command.rb'
require_relative 'swift_lib_templater/get_template_command.rb'
require_relative 'swift_lib_templater/rename_files_command.rb'
require_relative 'swift_lib_templater/library_template.rb'
require_relative 'swift_lib_templater/initialize_git_repository_command.rb'

def systemWithoutOutput(command)
	system command
end

module SwiftLibTemplater

	options = {}
	OptionParser.new do |opts|
	  opts.banner = "Usage: swift_lib_templater [options]"
	  opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
	    options[:verbose] = v
	  end
	  opts.on("-n", "--name=Name", "Project name") do |v|
	    options[:project_name] = v
	  end
	  opts.on("-t", "--template=TemplateName", "Template name [cli | framework]") do |v|
	    options[:template] = v
	  end
	  opts.on("-h", "--help", "Print this help") do
	    puts opts
	    exit
	  end
	end.parse!

	begin
		template = GetTemplateCommand.new(options[:template]).execute
		project_name = GetFrameworkNameCommand.new(options[:project_name]).execute

		project_dest = Dir.pwd
		project_folder = File.expand_path("#{project_dest}/#{project_name}")

		print "\nGenerating files... "
		CopyTemplateCommand.new(template, project_folder).execute
		RenameFilesCommand.new(project_folder, project_name).execute
		puts "✅"

		puts "\nProject #{project_name} successfully bootstraped ! 🎉"
	rescue  => e
		puts "\n\n🚨 Failed with error:"
		puts e.message
	end
end

