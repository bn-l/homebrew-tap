# Homebrew formula for devlogger - Append-only markdown devlog CLI.

class Devlogger < Formula
  desc "Append-only markdown devlog CLI"
  homepage "https://github.com/bn-l/devlogger"
  url "https://github.com/bn-l/devlogger/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "43473d595648a91b2d7daff19cb46fc95fbbd5867fd77db7f8111c8ff65c2850"
  license "MIT"

  head "https://github.com/bn-l/devlogger.git", branch: "master"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/devlogger --version")
  end
end
