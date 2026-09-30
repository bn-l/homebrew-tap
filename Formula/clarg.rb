# Homebrew formula for clarg - Claude Code PreToolUse hook handler.

class Clarg < Formula
  desc "Claude Code hook handler for blocking commands and file access"
  homepage "https://github.com/bn-l/clarg"
  url "https://github.com/bn-l/clarg/archive/refs/tags/v0.3.5.tar.gz"
  sha256 "43f5259e5db53a8b081bc90fb5249c4d272d2cf9e09f26a548bc8ee8f2d63697"
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
