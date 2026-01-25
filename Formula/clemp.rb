# Homebrew formula for clemp - Claude template CLI tool.
# Once clemp is published to GitHub, update `url` and `sha256` for versioned releases.

class Clemp < Formula
  desc "CLI tool to clone and configure claude-template for your project"
  homepage "https://github.com/bn-l/clemp"
  license "MIT"

  # TODO: Uncomment and update when you create a GitHub release:
  # url "https://github.com/bn-l/clemp/archive/refs/tags/v0.1.0.tar.gz"
  # sha256 "CHECKSUM_HERE"

  head "https://github.com/bn-l/clemp.git", branch: "master"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/clemp --version")
  end
end
