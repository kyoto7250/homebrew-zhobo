class Zhobo < Formula
    desc "A cross-platform TUI database viewer that remade gobang"
    homepage "https://crates.io/crates/zhobo"
    url "https://github.com/kyoto7250/zhobo/archive/refs/tags/v0.1.0.tar.gz"
    sha256 "3529f4da0da1d8b4919788c75670ac71ddae04c792acfac0274ec95dcc4f20e4"
    license "MIT"

    on_macos do
      url "https://github.com/kyoto7250/zhobo/releases/download/v0.1.0/zhobo-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
    end
  
    on_linux do
      if Hardware::CPU.intel?
        url "https://github.com/kyoto7250/zhobo/releases/download/v0.1.0/zhobo-0.1.0-x86_64-unknown-linux-musl.tar.gz"
        sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
      elsif Hardware::CPU.arm?
        url "https://github.com/kyoto7250/zhobo/releases/download/v0.1.0/zhobo-0.1.0-arm-unknown-linux-gnueabihf.tar.gz"
        sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
      end
    end
  
    on_windows do
      if Hardware::CPU.intel?
        if Hardware::CPU.is_64_bit?
          url "https://github.com/kyoto7250/zhobo/releases/download/v0.1.0/zhobo-0.1.0-x86_64-pc-windows-msvc.tar.gz"
          sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
        else
          url "https://github.com/kyoto7250/zhobo/releases/download/v0.1.0/zhobo-0.1.0-i686-pc-windows-msvc.tar.gz"
          sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
        end
      end
    end
  
    test do
      system "#{bin}/zhobo", "--version"
    end
  end
  