cask "clacal" do
  version "1.8.4"
  sha256 "532d952f2aa81bbe8c54da39b3100b33b1b9b632951996aff0d8b79037cac664"
  url "https://github.com/bn-l/clacal/releases/download/v#{version}/Clacal_#{version}.dmg"

  name "Clackal"
  desc "Claude code usage calibrator"
  homepage "https://github.com/bn-l/clacal"

  depends_on macos: ">= :sequoia"

  app "Clacal.app"
  binary "#{appdir}/Clacal.app/Contents/MacOS/clacal-cli", target: "clacal"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-d", "com.apple.quarantine", "#{appdir}/Clacal.app"]
  end
end
