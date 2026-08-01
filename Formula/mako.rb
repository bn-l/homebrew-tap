# Homebrew formula for mako - Text-to-speech via Kokoro, or fish S2 Pro with --hq.

class Mako < Formula
  desc "Text-to-speech CLI — Kokoro by default, fish S2 Pro with --hq"
  homepage "https://github.com/bn-l/mako"
  url "https://github.com/bn-l/mako/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "43ece1440815d1b2442a03fe3b96ff9d2b5b50dfa260fd2cff7327f77ff88bc3"
  license "MIT"

  head "https://github.com/bn-l/mako.git", branch: "main"

  depends_on xcode: [">= 26.0", :build]
  depends_on :macos
  # Both engines are Apple-silicon-only: Kokoro runs on CoreML, and --hq goes through
  # MLX, which has no Intel build at all.
  depends_on arch: :arm64
  # Runtime, for `mako say --hq`: uv runs the mlx-audio sidecar as a PEP 723 script and
  # provisions its own CPython, so nothing here needs a system Python.
  depends_on "uv"

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    # TTSHarnessCore declares `resources:`, so the build emits a sibling
    # mako_TTSHarnessCore.bundle that Bundle.module fatalErrors without. It has to sit in
    # the same real directory the kernel exec's — bin.install_symlink breaks that,
    # because Bundle.main.bundleURL does not resolve symlinks — hence the wrapper.
    libexec.install ".build/release/mako"
    libexec.install Dir[".build/release/*.bundle"]
    (bin/"mako").write <<~SH
      #!/bin/bash
      exec "#{libexec}/mako" "$@"
    SH
    (bin/"mako").chmod 0755
  end

  def caveats
    <<~EOS
      `mako say` works immediately; Kokoro's model downloads on first use.

      `mako say --hq` needs a one-off download of about 7 GB:

        mako hq install

      It renders at roughly 2.3x realtime and peaks near 14.5 GB of memory, so
      expect it to fail on a 16 GB machine. `mako doctor` reports what is missing.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mako --version")
  end
end
