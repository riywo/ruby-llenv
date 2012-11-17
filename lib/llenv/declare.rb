require "llenv"

class LLenv::Declare
  def initialize(dir)
    @install_sh = File.join(dir, "install.sh")
    @exec_sh    = File.join(dir, "exec.sh")
  end

  def install
    system(@install_sh)
  end

  def execute
    exec(@exec_sh)
  end
end
