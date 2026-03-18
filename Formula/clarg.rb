# Homebrew formula for clarg - Claude Code PreToolUse hook handler.

class Clarg < Formula
  desc "Claude Code hook handler for blocking commands and file access"
  homepage "https://github.com/bn-l/clarg"
  url "https://github.com/bn-l/clarg/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "d2de6931ad0004de10d978c1841e52ad0a2319991a93d1ea6f076846aac2c1bb"
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
