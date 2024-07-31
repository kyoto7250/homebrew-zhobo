class Zhobo < Formula
    desc "A cross-platform TUI database viewer that remade gobang"
    homepage "https://crates.io/crates/zhobo"
    url "https://github.com/kyoto7250/zhobo/archive/refs/tags/v0.1.0.tar.gz"
    sha256 "3529f4da0da1d8b4919788c75670ac71ddae04c792acfac0274ec95dcc4f20e4"
    license "MIT"
    def install
      bin.install "zhobo"
    end  
  end
  