cask "boyamanager" do
  version "0.1.0"
  sha256 "f4d3d8e17335a891ccfc94354e0db0d5551697f010342cca8f688f938338670a"

  url "https://github.com/bn-l/boyamanager/releases/download/v#{version}/BoyaManager_#{version}.dmg"
  name "BoyaManager"
  desc "Menu bar app for the BOYA mini 2 wireless mic"
  homepage "https://github.com/bn-l/boyamanager"

  depends_on macos: :sequoia

  app "BoyaManager.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-d", "com.apple.quarantine", "#{appdir}/BoyaManager.app"]
  end
end
