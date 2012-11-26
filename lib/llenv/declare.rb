require "llenv"

class LLenv::Declare
  def initialize(dir)
    @root_dir = dir
  end

  def install(llenv)
    set_env(llenv)
    install_script = File.join(@declare_dir, "install")
    system(install_script)
  end

  def execute(llenv, argv)
    set_env(llenv)
    exec_script = File.join(@declare_dir, "exec")
    exec(exec_script, *argv)
  end

  def list
    Dir.entries(@root_dir).each do |f|
      next if f =~ /^\./
      next unless File.directory?(File.join(@root_dir, f))
      print f + "\n"
    end
  end

private

  def set_env(llenv)
    @declare_dir = File.join(@root_dir, llenv)
    raise "#{llenv} not declared in #{@root_dir}" unless File.directory?(@declare_dir)

    ENV.clear
    env = `. /etc/profile && env`
    env.split("\n").map do |e|
      k, v = e.split("=")
      ENV[k] = v
    end

    home = File.join(@declare_dir, ".home")
    Dir.mkdir(home) unless File.directory?(home)
    ENV["HOME"] = home
    ENV["SHELL"] = "/bin/bash"
  end

end
