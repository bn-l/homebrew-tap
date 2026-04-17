# Homebrew formula for devlogger - Append-only markdown devlog CLI.

class Devlogger < Formula
  desc "Append-only markdown devlog CLI"
  homepage "https://github.com/bn-l/devlogger"
  url "https://github.com/bn-l/devlogger/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "081c7af4fe9f8e752a29b3e25a5c85c800c662e1e38151952af178c27ebc87e0"
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
