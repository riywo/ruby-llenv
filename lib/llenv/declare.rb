require "llenv"

class LLenv::Declare
  def initialize(dir, llhome)
    @install_sh = File.join(dir, "install.sh")
    @exec_sh    = File.join(dir, "exec.sh")
    @llhome     = llhome
  end

  def install
    set_env
    system(@install_sh)
  end

  def execute(argv)
    set_env
    exec(@exec_sh, *argv)
  end

private

  def set_env
    ENV.clear
    env = `. /etc/profile && env`
    env.split("\n").map do |e|
      k, v = e.split("=")
      ENV[k] = v
    end
    ENV["HOME"] = @llhome
    ENV["SHELL"] = "/bin/bash"
  end

end
