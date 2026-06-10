cask "days-until" do
  version "0.1.0"
  sha256 "d95c55459a96cb7250a853a2c5c9e0c9f2ffbc2b68b30511a080935faa6131c9"

  url "https://github.com/bn-l/DaysUntil/releases/download/v#{version}/DaysUntil_#{version}.dmg"
  name "DaysUntil"
  desc "Menubar countdown app showing days remaining as badge icons"
  homepage "https://github.com/bn-l/DaysUntil"

  depends_on macos: :sequoia

  app "DaysUntil.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-d", "com.apple.quarantine", "#{appdir}/DaysUntil.app"]
  end
end
