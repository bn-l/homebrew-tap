# Homebrew formula for mononi - Theme scheduler for macOS.

class Mononi < Formula
  desc "Theme scheduler for macOS — morning, noon, and night"
  homepage "https://github.com/bn-l/mononi"
  url "https://github.com/bn-l/mononi/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "65978b10581192d493f8443ca62b5a39af815a7b20a7b2cbe86dc6dfba1b1229"
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
