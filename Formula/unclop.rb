# Homebrew formula for unclop - Inventory comments, identifiers and strings for an agent.

class Unclop < Formula
  desc "Inventory comments, identifiers and strings with tree-sitter for an agent"
  homepage "https://github.com/bn-l/unclop"
  url "https://github.com/bn-l/unclop/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "05e4a89ead785f619634008455c28eda0c75a0ea1b4d2e8b049661d18cc883f5"
  license "MIT"

  head "https://github.com/bn-l/unclop.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/unclop --version")
  end
end
