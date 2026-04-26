# Homebrew formula for devlogger - Append-only markdown devlog CLI.

class Devlogger < Formula
  desc "Append-only markdown devlog CLI"
  homepage "https://github.com/bn-l/devlogger"
  url "https://github.com/bn-l/devlogger/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "56a1e5c19d9831270aa7b85d5dcad137ce6fedee4c27096ce923f8e072cec78b"
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
