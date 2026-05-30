# Homebrew formula for clemp - Claude template CLI tool.

class Clemp < Formula
  desc "CLI tool to clone and configure claude-template for your project"
  homepage "https://github.com/bn-l/clemp"
  url "https://github.com/bn-l/clemp/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "71dc769f90b6816405f07fde1eec2efa92f780e6ae3648b2cc4049c26ca7a8ed"
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
