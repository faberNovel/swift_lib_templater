module SwiftLibTemplater
  class CopyTemplateCommand

    def initialize(dir)
      @dir = dir
    end

    def execute()
      systemWithoutOutput("open '#{@dir}'")
    end
  end
end