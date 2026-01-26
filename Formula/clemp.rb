# Homebrew formula for clemp - Claude template CLI tool.

class Clemp < Formula
  desc "CLI tool to clone and configure claude-template for your project"
  homepage "https://github.com/bn-l/clemp"
  url "https://github.com/bn-l/clemp/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "1d320d24e8b753657afade5f053df7f66ec796630802a7370424e99c5e2f39a1"
  license "MIT"

  head "https://github.com/bn-l/clemp.git", branch: "master"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/clemp --version")
  end
end
