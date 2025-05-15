class Zhobo < Formula
  desc "A cross-platform TUI database viewer that remade gobang"
  homepage "https://crates.io/crates/zhobo"
  url "https://github.com/kyoto7250/zhobo/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  license "MIT"

  on_macos do
    url "https://github.com/kyoto7250/zhobo/releases/download/v0.1.1/zhobo-0.1.1-x86_64-apple-darwin.tar.gz"
    sha256 "15b0f13026a14b15ee2de294cdb20e1a6fc36d1d536e6eefeb17024dae89071e"
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/kyoto7250/zhobo/releases/download/v0.1.1/zhobo-0.1.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "7ff9bc80fa08315a6f4998793c402048155a11a06ed4a963765e4d67dc69fae8"
    elsif Hardware::CPU.arm?
      url "https://github.com/kyoto7250/zhobo/releases/download/v0.1.1/zhobo-0.1.1-arm-unknown-linux-gnueabihf.tar.gz"
      sha256 "7c813120c5f845b90583f6d7cc5601350ea68290705a997023e8f2ea88a159e3"
    end
  end

  def install
    bin.install "zhobo"
  end

  test do
    system "#{bin}/zhobo", "--version"
  end
end