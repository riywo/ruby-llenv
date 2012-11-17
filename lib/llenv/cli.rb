require "llenv"
require "llenv/env"
require "thor"
require "tapp"

class LLenv::CLI < Thor

  desc "debug", "Debug"
  def debug
    load_llenv_file!
    @env.tapp
  end

  desc "version", "Display LLenv gem version"

  map ["-v", "--version"] => :version
  def version
    puts LLenv::VERSION
  end

private ######################################################################

  def error(message)
    puts "ERROR: #{message}"
    exit 1
  end

  def load_llenv_file!
    root = File.expand_path(Dir.pwd)
    default_env = File.join(root, ".llenv")
    error("#{default_env} does not exist.") unless File.exist?(default_env)
    @env = LLenv::Env.new(default_env)
  end

end
