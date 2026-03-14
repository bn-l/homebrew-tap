# Homebrew formula for repoad - Turn any GitHub repo into a single markdown file.

class Repoad < Formula
  desc "Turn any GitHub repository into a single, LLM-friendly markdown file"
  homepage "https://github.com/bn-l/repoad"
  url "https://github.com/bn-l/repoad/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "cc6c1f69ce1e28b912d1aeb6cf84b10560066f805037d169615eec63c055148f"
  license "MIT"

  head "https://github.com/bn-l/repoad.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/repoad --version")
  end
end
