# Homebrew formula for mononi - Theme scheduler for macOS.

class Mononi < Formula
  desc "Theme scheduler for macOS — morning, noon, and night"
  homepage "https://github.com/bn-l/mononi"
  url "https://github.com/bn-l/mononi/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "7f18317d96c65461da90558455de62b1bd0e57cadeef8871231c18097f7e64fe"
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
