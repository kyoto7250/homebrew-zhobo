class Zhobo < Formula
    desc "A cross-platform TUI database viewer that remade gobang"
    homepage "https://crates.io/crates/zhobo"
    url "https://github.com/kyoto7250/zhobo/archive/refs/tags/v0.1.0.tar.gz"
    sha256 "3529f4da0da1d8b4919788c75670ac71ddae04c792acfac0274ec95dcc4f20e4"
    license "MIT"

    on_macos do
      url "https://github.com/kyoto7250/zhobo/releases/download/v0.1.0/zhobo-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "3c1d552e253ccb32c616e808c9fd72ed6903a4009a166b3878eb8f898dd1764a"
    end
  
    on_linux do
      if Hardware::CPU.intel?
        url "https://github.com/kyoto7250/zhobo/releases/download/v0.1.0/zhobo-0.1.0-x86_64-unknown-linux-musl.tar.gz"
        sha256 "665fe18a217e750aeb0725c53bbaa0e21bab12fced358ea91b6b6d137a79a4e6"
      elsif Hardware::CPU.arm?
        url "https://github.com/kyoto7250/zhobo/releases/download/v0.1.0/zhobo-0.1.0-arm-unknown-linux-gnueabihf.tar.gz"
        sha256 "352b073bdc73b6b111f5cff43900c7a52fea563ca45c4652c152c95a37a3e6fe"
      end
    end

    test do
      system "#{bin}/zhobo", "--version"
    end
  end