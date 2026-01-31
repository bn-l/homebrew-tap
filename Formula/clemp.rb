# Homebrew formula for clemp - Claude template CLI tool.

class Clemp < Formula
  desc "CLI tool to clone and configure claude-template for your project"
  homepage "https://github.com/bn-l/clemp"
  url "https://github.com/bn-l/clemp/archive/refs/tags/v0.1.6.tar.gz"
  sha256 "6d0be80e89f61e4ef487ac075763763668bc85f7dc81531be5af6787ccb274e7"
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
