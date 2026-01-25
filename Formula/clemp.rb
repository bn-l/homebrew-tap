# Homebrew formula for clemp - Claude template CLI tool.

class Clemp < Formula
  desc "CLI tool to clone and configure claude-template for your project"
  homepage "https://github.com/bn-l/clemp"
  url "https://github.com/bn-l/clemp/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "7d604adfe65aed8dd8de9bd631de32ea189df39329bbf561f7236f59b35a0ddd"
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
