cask "clacal" do
  version "1.8.3"
  sha256 "4c4e6a10be850ef8993717ac3a1a49a2f4fac94c119063e4f31d3a813309f8ef"
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
