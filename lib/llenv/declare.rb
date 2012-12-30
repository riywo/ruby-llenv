require "llenv"

class LLenv::Declare

  def initialize(dir, env)
    @root_dir = dir
    @env = {}
    env.split(',').each do |str|
      k, v = str.split(/=|\\=/)
      @env[k] = v
    end
  end

  def run(llenv, command, argv = [])
    set_env(llenv)
    script = File.join(@declare_dir, "run")
    argv.unshift(command)
    exec(script, *argv)
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

    env = {}
    env["LLENV_ROOT"] = ENV["LLENV_ROOT"] if ENV.has_key? "LLENV_ROOT"
    env["LLENV_DECLARE_URL"] = ENV["LLENV_DECLARE_URL"] if ENV.has_key? "LLENV_DECLARE_URL"
    env.merge!(@env)

    ENV.clear
    path = `. /etc/profile && echo $PATH`.chomp
    home = File.join(@declare_dir, ".home")
    Dir.mkdir(home) unless File.exists?(home)

    ENV["PATH"] = path
    ENV["HOME"] = home
    ENV["SHELL"] = "/bin/bash"

    env.each do |k,v|
      ENV[k] = v
    end
  end

end
