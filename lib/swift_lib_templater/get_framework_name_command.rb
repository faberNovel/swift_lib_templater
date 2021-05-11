module SwiftLibTemplater
  class GetFrameworkNameCommand

    def initialize(name)
      @name = name
    end

    def execute()
      @name
    end
  end
end