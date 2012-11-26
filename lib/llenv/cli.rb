require "llenv"
require "llenv/declare"
require "thor"

class LLenv::CLI < Thor

  def initialize(args = [], options = {}, config = {})
    @root_dir     = ENV["LLENV_ROOT"] || File.expand_path("~/.llenv")
    @declare_repo = ENV["LLENV_DECLARE_URL"] || "https://github.com/riywo/llenv-declare.git"
    @declare      = LLenv::Declare.new(@root_dir)
    super
  end

  desc "list", "List of declaring"
  def list
    check_root_dir!
    @declare.list
  end

  desc "install", "Install declared LL"
  def install
    check_root_dir!
    @declare.install(llenv)
  end

  desc "exec", "Execute command with declared LL"
  def exec(*argv)
    check_root_dir!
    @declare.execute(llenv, argv)
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

  def llenv
    pwd = File.expand_path(Dir.pwd)
    llenv_file = File.join(pwd, ".llenv")
    error("#{llenv_file} does not exist.") unless File.exist?(llenv_file)
    llenv = File.read(llenv_file).split("\n")[0]
    llenv
  end

  def check_root_dir!
    unless File.directory?(@root_dir)
      system("git clone #{@declare_repo} #{@root_dir} > /dev/null 2>&1") or error("git clone #{@declare_repo}")
    end
  end

end
