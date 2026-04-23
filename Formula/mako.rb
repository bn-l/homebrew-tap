# Homebrew formula for mako - Text-to-speech via Kokoro.

class Mako < Formula
  desc "Text-to-speech CLI via Kokoro — outputs M4A if ffmpeg is installed, else WAV"
  homepage "https://github.com/bn-l/mako"
  url "https://github.com/bn-l/mako/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "5c49e5a0c44f59daa7e67a7e28ea63b7f10f7da7ec2dbe744b62373bc999c64e"
  license "MIT"

  head "https://github.com/bn-l/mako.git", branch: "main"

  depends_on xcode: [">= 26.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    libexec.install ".build/release/mako"
    libexec.install Dir[".build/release/*.bundle"]
    (bin/"mako").write <<~SH
      #!/bin/bash
      exec "#{libexec}/mako" "$@"
    SH
    (bin/"mako").chmod 0755
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mako --version")
  end
end
