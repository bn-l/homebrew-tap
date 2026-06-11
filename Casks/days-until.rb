cask "days-until" do
  version "0.2.0"
  sha256 "78b7672309191653f57605dba4b468b9a336d57b7984d80227b8d3c1f8f41f6d"

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
