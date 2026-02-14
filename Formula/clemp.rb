# Homebrew formula for clemp - Claude template CLI tool.

class Clemp < Formula
  desc "CLI tool to clone and configure claude-template for your project"
  homepage "https://github.com/bn-l/clemp"
  url "https://github.com/bn-l/clemp/archive/refs/tags/v0.1.13.tar.gz"
  sha256 "9af7c5f8def0a08d86ee1df14fa4496a6c915a8dae65c74d3ea1be80c66f5f70"
  license "MIT"

  head "https://github.com/bn-l/clemp.git", branch: "master"

  depends_on "rust" => :build
  depends_on "bn-l/tap/clarg" => :recommended

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/clemp --version")
  end
end
