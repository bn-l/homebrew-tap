cask "boyamanager" do
  version "0.1.1"
  sha256 "4985a3d017a3943910024e8024b02f9bfefb73b6385f00ce96a9b1293460ba48"

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
