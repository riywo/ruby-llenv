require "llenv"
require "llenv/declare"
require "thor"
require "tapp"

class LLenv::CLI < Thor

  class_option :declare, :type => :string, :aliases => "-d", :desc => "Specify a user declare directory"

  desc "install", "Install declared LL"
  def install
    load_llenv_file!
    load_declare!
    @declare.install
  end

  desc "exec", "Execute command with declared LL"
  def exec
    load_llenv_file!
    load_declare!
    @declare.execute
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
    @llenv = File.read(default_env).split("\n")[0]
  end

  def load_declare!
    declare_dirs = []
    declare_dirs << File.join(options[:declare], @llenv) if options[:declare]
    declare_dirs << File.expand_path("../../../declare/#{@llenv}", __FILE__)
    dir = declare_dirs.detect { |d| Dir.exists?(d) } or error("Declare of '#{@llenv}' does not exist.")
    @declare = LLenv::Declare.new(dir)
  end

end
