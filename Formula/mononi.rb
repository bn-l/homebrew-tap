# Homebrew formula for mononi - Theme scheduler for macOS.

class Mononi < Formula
  desc "Theme scheduler for macOS — morning, noon, and night"
  homepage "https://github.com/bn-l/mononi"
  url "https://github.com/bn-l/mononi/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "fcf003d61e350bf3ea9c95532f33d1da6e95664553cc546871c64e2524613fd2"
  license "MIT"

  head "https://github.com/bn-l/mononi.git", branch: "main"

  depends_on xcode: [">= 16.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/mononi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mononi --version")
  end
end
