cask "boyamanager" do
  version "0.1.2"
  sha256 "9c21ff28c68fdfcb5ea6def33ecd23551e2b4b9b3d32df47637831445db72702"

  url "https://github.com/bn-l/boyamanager/releases/download/v#{version}/BoyaManager_#{version}.dmg"
  name "BoyaManager"
  desc "Menu bar app for the BOYA mini 2 wireless mic"
  homepage "https://github.com/bn-l/boyamanager"

  depends_on macos: :sequoia

  app "BoyaManager.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-d", "com.apple.quarantine", "{{appdir}}/BoyaManager.app"]
  end
end
