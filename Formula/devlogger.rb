# Homebrew formula for devlogger - Append-only markdown devlog CLI.

class Devlogger < Formula
  desc "Append-only markdown devlog CLI"
  homepage "https://github.com/bn-l/devlogger"
  url "https://github.com/bn-l/devlogger/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "bdf678d96ba367545d323ec1ba0d020d28f99cabb2043b92ebfbb5e56cdd56dd"
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
