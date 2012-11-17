require "llenv"
require "yaml"
require "thor"

class LLenv::CLI < Thor

  desc "version", "Display Foreman gem version"

  map ["-v", "--version"] => :version
  def version
    puts LLenv::VERSION
  end

end
