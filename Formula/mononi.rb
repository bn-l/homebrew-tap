# Homebrew formula for mononi - Theme scheduler for macOS.

class Mononi < Formula
  desc "Theme scheduler for macOS — morning, noon, and night"
  homepage "https://github.com/bn-l/mononi"
  url "https://github.com/bn-l/mononi/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "e6521ab071d4f1e977dfe4369bd59e51b45e8beb9e1bdd877913fd2a94144aec"
  license "MIT"

  head "https://github.com/bn-l/mononi.git", branch: "main"

  depends_on xcode: [">= 26.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/mononi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mononi --version")
  end
end
