# Homebrew formula for unclop - Inventory comments, identifiers and strings for an agent.

class Unclop < Formula
  desc "Inventory comments, identifiers and strings with tree-sitter for an agent"
  homepage "https://github.com/bn-l/unclop"
  url "https://github.com/bn-l/unclop/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "9d3dd7e49becfef97f95f268c4d39c5c3314b460e7ad866990631b5d45f46b9b"
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
