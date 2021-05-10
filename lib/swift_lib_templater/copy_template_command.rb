module SwiftLibTemplater
  class CopyTemplateCommand

    def initialize(template, dest)
      @template = template
      @dest = dest
    end

    def execute()
      if File.exists?(@dest)
        raise "Path #{@dest} already exists"
      end
      Dir.chdir(File.dirname(__FILE__))
      case @template
      when LibraryTemplate::FRAMEWORK
        FileUtils.cp_r("../../lib/templates/framework", @dest)
      when LibraryTemplate::CLI
        FileUtils.cp_r("../../lib/templates/cli", @dest)
      end
    end
  end
end