# Homebrew formula for mononi - Theme scheduler for macOS.

class Mononi < Formula
  desc "Theme scheduler for macOS — morning, noon, and night"
  homepage "https://github.com/bn-l/mononi"
  url "https://github.com/bn-l/mononi/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "83ca4c012892fe09aed45e7e202ef12bdeb86bc6ad3905c9e1a5d5c1534d7c16"
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
