# Homebrew formula for unclop - Inventory comments, identifiers and strings for an agent.

class Unclop < Formula
  desc "Inventory comments, identifiers and strings with tree-sitter for an agent"
  homepage "https://github.com/bn-l/unclop"
  url "https://github.com/bn-l/unclop/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "6d4609d75b21633461fdc45aafcc7d1fd7f9a8758066a5fded9a2d4acac37087"
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
