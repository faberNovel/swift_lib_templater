module SwiftLibTemplater
    class RenameFilesCommand

      def initialize(dir, project_name)
        @dir = dir
        @project_name = project_name
      end

      def execute()
        Dir.chdir(@dir)
        # We need to list all the files before renaming the files because
        # Find.find doesn't like that we mess with the files that are being
        # enumerated
        paths = []
        Find.find(".") do |path|
          paths << path
        end
        paths.each do |path|
          base = File.basename(path)
          new_path = path.gsub('TEMPLATE', @project_name)
          new_dir, new_base = File.split(new_path)
          next unless base =~ /(TEMPLATE|TP)/
          File.rename(File.join(new_dir, base), new_path)
        end
        Find.find(".") do |path|
          next unless File.file?(path)
          next if File.extname(path) == ".png"
          next if File.extname(path) == ".mobileprovision"
          systemWithoutOutput("sed -i '' 's/TEMPLATE/#{@project_name}/g' '#{path}'")
        end
      end
    end
end