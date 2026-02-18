cask "clacal" do
  version "1.0"
  sha256 "1fef5aa5ab40c8a09dc697e61c150dc45fd958354c78f4fa28ce0902fc96c48f"
  url "https://github.com/bn-l/claude-code-usage/releases/download/v#{version}/Clacal_#{version}.dmg"

  name "Clackal"
  desc "Claude code usage calibrator"
  homepage "https://github.com/bn-l/claude-code-usage"

  depends_on macos: ">= :sequoia"

  app "Clacal.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-d", "com.apple.quarantine", "#{appdir}/Clacal.app"]
  end
end
