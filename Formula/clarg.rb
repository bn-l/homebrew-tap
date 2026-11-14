# Homebrew formula for clarg - Claude Code PreToolUse hook handler.

class Clarg < Formula
  desc "Claude Code hook handler for blocking commands and file access"
  homepage "https://github.com/bn-l/clarg"
  url "https://github.com/bn-l/clarg/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "0efcab7cc33d7cad89fcf5ea14111e1c60bcda7fdf827d63b7d9c9c073fee967"
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
