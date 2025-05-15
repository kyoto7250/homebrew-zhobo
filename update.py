from textwrap import dedent
import os
import sys
import hashlib
import glob

def check_tag():
    if len(sys.argv) < 2:
        print("Usage: python update.py <tag>")
        sys.exit(1)

    tag = sys.argv[1]
    return tag


def build_url(tag: str, basename: str):
    tag_url = "https://github.com/kyoto7250/zhobo/archive/refs/tags/"
    base_url = f"https://github.com/kyoto7250/zhobo/releases/download/{tag}"
    names = [
        ("apple-darwin", "mac"),
        ("x86_64-unknown-linux-musl", "linux_intel"),
        ("arm-unknown-linux-gnueabihf", "linux_arm")
    ]

    for partial, name in names:
        if partial in basename:
            return (name, os.path.join(base_url, basename))
    return ("tag", os.path.join(tag_url, basename))

def main(tag: str) -> None:
    # check the directory
    if not (os.path.exists("Formula/zhobo.rb") and os.path.exists("tmp/")):
        print("check your directory...")
        sys.exit(1)

    downloads = glob.glob("tmp/*.tar.gz", recursive=False)
    if len(downloads) != 6:
        print("Error: Expected 6 downloads in the 'tmp/' directory, but found", len(downloads))
        sys.exit(1)
    name_and_sha= {}

    for download in downloads:
        if "windows" in download:
            continue

        name, url = build_url(tag, os.path.basename(download))
        with open(download, "rb") as f:
            h = hashlib.sha256()
            for chunk in iter(lambda: f.read(8192), b''):
                h.update(chunk)
        name_and_sha[name]  = {
          "url": url,
          "sha": h.hexdigest()
        }

    content = build_formula_file(name_and_sha, tag)

    with open("Formula/zhobo.rb", "w") as f:
        f.write(content)



def build_formula_file(name_and_sha: dict, tag: str) -> str:
    return dedent(f"""
class Zhobo < Formula
  desc "A cross-platform TUI database viewer that remade gobang"
  homepage "https://crates.io/crates/zhobo"
  url "{name_and_sha['tag']['url']}"
  sha256 "{name_and_sha['tag']['sha']}"
  license "MIT"

  on_macos do
    url "{name_and_sha['mac']['url']}"
    sha256 "{name_and_sha['mac']['sha']}"
  end

  on_linux do
    if Hardware::CPU.intel?
      url "{name_and_sha['linux_intel']['url']}"
      sha256 "{name_and_sha['linux_intel']['sha']}"
    elsif Hardware::CPU.arm?
      url "{name_and_sha['linux_arm']['url']}"
      sha256 "{name_and_sha['linux_arm']['sha']}"
    end
  end

  def install
    bin.install "zhobo"
  end

  test do
    system "#{{bin}}/zhobo", "--version"
  end
end
    """).strip()



if __name__ == "__main__":
    main(check_tag())
