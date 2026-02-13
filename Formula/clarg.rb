# Homebrew formula for clarg - Claude Code PreToolUse hook handler.

class Clarg < Formula
  desc "Claude Code hook handler for blocking commands and file access"
  homepage "https://github.com/bn-l/clarg"
  url "https://github.com/bn-l/clarg/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "5f0993fadaa6fb12d7f829860907228343669c2827d377916df62986e4805e56"
  license "MIT"

  head "https://github.com/bn-l/clarg.git", branch: "master"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/clarg --version")
  end
end
