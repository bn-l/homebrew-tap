class Glow < Formula
  desc "Render markdown on the CLI, with pizzazz (with smart reflow)"
  homepage "https://github.com/bn-l/glow"
  url "https://github.com/bn-l/glow/archive/refs/heads/feat/smart-reflow.tar.gz"
  version "2.0.0-smart-reflow"
  sha256 "05d3fb1c5c3ff5d58cefff6749fc601578a2abd8239fb78703e8b188d141e428"
  license "MIT"

  depends_on "go" => :build

  conflicts_with "glow", because: "both install a `glow` binary"

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "glow", shell_output("#{bin}/glow --help")
  end
end
