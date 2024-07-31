# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Zhobo < Formula
    desc "A cross-platform TUI database viewer that remade gobang"
    homepage "https://crates.io/crates/zhobo"
    url "https://github.com/kyoto7250/zhobo/archive/refs/tags/v0.1.0.tar.gz"
    sha256 "3529f4da0da1d8b4919788c75670ac71ddae04c792acfac0274ec95dcc4f20e4"
    license "MIT"
  
    # depends_on "cmake" => :build
  
    def install
      # Remove unrecognized options if they cause configure to fail
      # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
      system "./configure", "--disable-silent-rules", *std_configure_args
      # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    end
  
    test do
      # `test do` will create, run in and delete a temporary directory.
      #
      # This test will fail and we won't accept that! For Homebrew/homebrew-core
      # this will need to be a test that verifies the functionality of the
      # software. Run the test with `brew test zhobo`. Options passed
      # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
      #
      # The installed folder is not in the path, so use the entire path to any
      # executables being tested: `system "#{bin}/program", "do", "something"`.
      system "false"
    end
  end
  