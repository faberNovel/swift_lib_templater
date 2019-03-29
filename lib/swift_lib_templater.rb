require 'optparse'
require 'find'

require 'swift_lib_templater/copy_template_command.rb'
require 'swift_lib_templater/get_framework_name_command.rb'
require 'swift_lib_templater/rename_files_command.rb'
require 'swift_lib_templater/initialize_git_repository_command.rb'

module SwiftLibTemplater
	def systemWithoutOutput(command)
		system command, ">/dev/null 2>&1"
	end

	begin
		puts "Framework name ?"
		project_name = GetFrameworkNameCommand.new.execute

		project_dest = Dir.pwd
		project_folder = File.expand_path("#{project_dest}/#{project_name}")

		print "\nGenerating files... "
		CopyTemplateCommand.new(project_folder).execute
		RenameFilesCommand.new(project_folder, project_name).execute
		puts "✅"

		print "Initializing git... "
		InitializeGitRepositoryCommand.new(project_folder).execute
		puts "✅"

		puts "\nProject #{project_name} successfully bootstraped ! 🎉"
	rescue  => e
		puts "\n\n🚨 Failed with error:"
		puts e.message
	end
end

