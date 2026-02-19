cask "clacal" do
  version "1.2"
  sha256 "78d8a1c3c2a49c8f5adebc4e1fd737665e236b07e60f2929d9fe708a8d6af0f8"
  url "https://github.com/bn-l/clacal/releases/download/v#{version}/Clacal_#{version}.dmg"

  name "Clackal"
  desc "Claude code usage calibrator"
  homepage "https://github.com/bn-l/clacal"

  depends_on macos: ">= :sequoia"

  app "Clacal.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-d", "com.apple.quarantine", "#{appdir}/Clacal.app"]
  end
end
