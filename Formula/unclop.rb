# Homebrew formula for unclop - Inventory comments, identifiers and strings for an agent.

class Unclop < Formula
  desc "Inventory comments, identifiers and strings with tree-sitter for an agent"
  homepage "https://github.com/bn-l/unclop"
  url "https://github.com/bn-l/unclop/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "46d379e566995e45f04be00813b1df0c2af5343940c3b0b9ff8ac03697b95272"
  license "MIT"

  head "https://github.com/bn-l/unclop.git", branch: "master"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/unclop --version")
  end
end
