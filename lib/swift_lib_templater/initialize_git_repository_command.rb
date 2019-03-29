module SwiftLibTemplater
  class InitializeGitRepositoryCommand

    def initialize(dir)
      @dir = dir
    end

    def execute()
      Dir.chdir(@dir)
      systemWithoutOutput "git init ."
      systemWithoutOutput "git commit -m 'Initial commit' --allow-empty"
      systemWithoutOutput "git checkout -b develop"
      systemWithoutOutput "git add ."
      systemWithoutOutput "git commit -m 'Initial import'"
    end
  end
end