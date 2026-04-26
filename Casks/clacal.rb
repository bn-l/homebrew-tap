cask "clacal" do
  version "1.9.0"
  sha256 "57128be2c4bb1d3746508691cf95dceb9e9d5ad80bd6265db1aa499b0a29f9f3"
  url "https://github.com/bn-l/clacal/releases/download/v#{version}/CodexSwitcher_#{version}.dmg"

  name "CodexSwitcher"
  desc "Claude code usage calibrator"
  homepage "https://github.com/bn-l/clacal"

  depends_on macos: ">= :sequoia"

  app "CodexSwitcher.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-d", "com.apple.quarantine", "#{appdir}/CodexSwitcher.app"]
  end
end
