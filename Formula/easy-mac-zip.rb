# Homebrew formula for easy-mac-zip - friendly wrapper around 7zz for macOS.

class EasyMacZip < Formula
  desc "Friendly wrapper around 7zz for easy zipping and unzipping on macOS"
  homepage "https://github.com/bn-l/easy-mac-zip"
  url "https://github.com/bn-l/easy-mac-zip/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "6098d3d6dea470f246f9fcdbff32a8a65ad88f98891c8394d6d4ffccc30a9f64"
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
