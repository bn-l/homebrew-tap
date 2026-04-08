# Homebrew formula for easy-mac-zip - friendly wrapper around 7zz for macOS.

class EasyMacZip < Formula
  desc "Friendly wrapper around 7zz for easy zipping and unzipping on macOS"
  homepage "https://github.com/bn-l/easy-mac-zip"
  url "https://github.com/bn-l/easy-mac-zip/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "222c22f935e2f5cf88caa0138a7c411d211644d29a656b9f4498d364b3f57482"
  license "MIT"

  head "https://github.com/bn-l/easy-mac-zip.git", branch: "main"

  depends_on "sevenzip"

  def install
    bin.install "emz"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/emz --version")
  end
end
