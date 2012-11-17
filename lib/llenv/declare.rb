require "llenv"

class LLenv::Declare
  def initialize(dir, llhome)
    @install_sh = File.join(dir, "install.sh")
    @exec_sh    = File.join(dir, "exec.sh")
    @llhome     = llhome.tapp
  end

  def install
    ENV.clear
    ENV["HOME"] = @llhome
    system(@install_sh)
  end

  def execute(argv)
    ENV.clear
    ENV["HOME"] = @llhome
    exec(@exec_sh, *argv)
  end
end
