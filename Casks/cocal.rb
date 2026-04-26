cask "cocal" do
  version "1.9.0"
  sha256 "2f311508234b3ead3a1f477bae69e36ecb3e43e7ad2bd9237c9a3b788806647f"
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
