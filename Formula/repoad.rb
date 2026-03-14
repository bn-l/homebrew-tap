# Homebrew formula for repoad - Turn any GitHub repo into a single markdown file.

class Repoad < Formula
  desc "Turn any GitHub repository into a single, LLM-friendly markdown file"
  homepage "https://github.com/bn-l/repoad"
  url "https://github.com/bn-l/repoad/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "a3134e018ddea5c2bb4db971c71b4692ba7303750c65b9189dddead8fc182635"
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
