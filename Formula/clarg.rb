# Homebrew formula for clarg - Claude Code PreToolUse hook handler.

class Clarg < Formula
  desc "Claude Code hook handler for blocking commands and file access"
  homepage "https://github.com/bn-l/clarg"
  url "https://github.com/bn-l/clarg/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "1db9fd045612314abf0948821d543c4a6a432782ddd818184d400f1394e42df2"
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
