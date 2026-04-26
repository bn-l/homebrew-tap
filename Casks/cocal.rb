cask "cocal" do
  version "0.1.0"
  sha256 "31670fff9f3e8b7429fedb0a7d4f0be4a57d7e598141ae186fb2fe6bd5d322b0"
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
