# Homebrew formula for devlogger - Append-only markdown devlog CLI.

class Devlogger < Formula
  desc "Append-only markdown devlog CLI"
  homepage "https://github.com/bn-l/devlogger"
  url "https://github.com/bn-l/devlogger/archive/refs/tags/v1.3.1.tar.gz"
  sha256 "813dd69e70813c1ae03b319cb24f4cda6e52b53e6e528d19ec23998f76780717"
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
