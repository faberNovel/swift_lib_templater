module SwiftLibTemplater
  class GetFrameworkNameCommand
    def execute()
      name_regexp = /[A-Z][A-Za-z0-9]*/
      project_name = gets.chomp until project_name =~ name_regexp
      project_name
    end
  end
end