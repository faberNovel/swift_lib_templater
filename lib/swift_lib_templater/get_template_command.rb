module SwiftLibTemplater
  class GetTemplateCommand

    def initialize(name)
      @name = name
    end

    def execute()
        case @name.downcase
        when "cli"
          return LibraryTemplate::CLI
        when "framework"
          return LibraryTemplate::FRAMEWORK
        else
            raise("unknown template")
        end
    end
  end
end