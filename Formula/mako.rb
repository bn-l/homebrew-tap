# Homebrew formula for mako - Text-to-speech via Kokoro.

class Mako < Formula
  desc "Text-to-speech CLI via Kokoro — outputs M4A if ffmpeg is installed, else WAV"
  homepage "https://github.com/bn-l/mako"
  url "https://github.com/bn-l/mako/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "b44afffa46ff637dc1d16dd1c53325f0d18f6f0acbc8c8eac9af058a46f89b00"
  license "MIT"

  head "https://github.com/bn-l/mako.git", branch: "main"

  depends_on xcode: [">= 26.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/mako"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mako --version")
  end
end
