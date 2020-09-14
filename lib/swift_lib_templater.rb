require 'optparse'
require 'find'
require 'fileutils'

require_relative 'swift_lib_templater/copy_template_command.rb'
require_relative 'swift_lib_templater/get_framework_name_command.rb'
require_relative 'swift_lib_templater/rename_files_command.rb'
require_relative 'swift_lib_templater/initialize_git_repository_command.rb'

def systemWithoutOutput(command)
	system command
end

module SwiftLibTemplater
	begin
		puts "Framework name ?"
		project_name = GetFrameworkNameCommand.new.execute

		project_dest = Dir.pwd
		project_folder = File.expand_path("#{project_dest}/#{project_name}")

		print "\nGenerating files... "
		CopyTemplateCommand.new(project_folder).execute
		RenameFilesCommand.new(project_folder, project_name).execute
		puts "✅"

		puts "\nProject #{project_name} successfully bootstraped ! 🎉"
	rescue  => e
		puts "\n\n🚨 Failed with error:"
		puts e.message
	end
end

