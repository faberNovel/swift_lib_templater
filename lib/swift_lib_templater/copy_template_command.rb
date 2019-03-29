module SwiftLibTemplater
  class CopyTemplateCommand
    def initialize(dest)
      @dest = dest
    end

    def execute()
      if File.exists?(@dest)
        raise "Path #{@dest} already exists"
      end
      Dir.chdir(File.dirname(__FILE__))
      FileUtils.cp_r("../../lib/templates/framework", @dest)
    end
  end
end