cask "clacal" do
  version "1.9.0"
  sha256 "ef10fe0faa013f8e414bbb96a4508026c7b7505e0f03907944ebe1aef6f1f6ce"
  url "https://github.com/bn-l/cocal/releases/download/v#{version}/CodexSwitcher_#{version}.dmg"

  name "CodexSwitcher"
  desc "Claude code usage calibrator"
  homepage "https://github.com/bn-l/cocal"

  depends_on macos: ">= :sequoia"

  app "CodexSwitcher.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-d", "com.apple.quarantine", "#{appdir}/CodexSwitcher.app"]
  end
end
