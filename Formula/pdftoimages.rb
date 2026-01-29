# Homebrew formula for pdftoimages - PDF to WebP image converter.

class Pdftoimages < Formula
  desc "Convert PDF pages to WebP images"
  homepage "https://github.com/bn-l/pdftoimages"
  url "https://github.com/bn-l/pdftoimages/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "0a614ae3e376fe368325238dd146394cccb2d2990ab3d4531bb3168c57fd07f2"
  license "MIT"

  head "https://github.com/bn-l/pdftoimages.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args

    # Place the pdfium dynamic library next to the binary so it can be found at runtime
    target = if Hardware::CPU.arm?
              "aarch64-apple-darwin"
            else
              "x86_64-apple-darwin"
            end
    bin.install "assets/#{target}/libpdfium.dylib"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pdftoimages --version")
  end
end