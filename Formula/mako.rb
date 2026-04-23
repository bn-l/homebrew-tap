# Homebrew formula for mako - Text-to-speech via Kokoro.

class Mako < Formula
  desc "Text-to-speech CLI via Kokoro — outputs M4A if ffmpeg is installed, else WAV"
  homepage "https://github.com/bn-l/mako"
  url "https://github.com/bn-l/mako/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "53ffa8bfca853da874b652f1d896b031f579088a9fe79de9187c98cbd326c9a3"
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
