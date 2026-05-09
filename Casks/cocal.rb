cask "cocal" do
  version "1.10.0"
  sha256 "c93dc2923593a1e017d9ba1bdb289d6808b39e0a2f2ace0600ffceb9f799762f"
  url "https://github.com/bn-l/cocal/releases/download/v#{version}/Cocal_#{version}.dmg"

  name "Cocal"
  desc "Claude code usage calibrator"
  homepage "https://github.com/bn-l/cocal"

  depends_on macos: ">= :sequoia"

  app "Cocal.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-d", "com.apple.quarantine", "#{appdir}/Cocal.app"]
  end
end
