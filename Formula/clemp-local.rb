# Local development formula for clemp.
# Use this for testing before publishing to GitHub.

class ClempLocal < Formula
  desc "CLI tool to clone and configure claude-template for your project"
  homepage "https://github.com/bn-l/clemp"
  url "file:///Users/bml/projects/misc-projects/clemp", using: :git, branch: "master"
  version "0.1.0"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/clemp --version")
  end
end
