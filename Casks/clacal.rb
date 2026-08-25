cask "clacal" do
  version "1.9.1"
  sha256 "6b973483917e69697d49ed069916d22d00a3394b7874cb3223fe3c8ea6318e80"
  url "https://github.com/bn-l/clacal/releases/download/v#{version}/Clacal_#{version}.dmg"

  name "Clackal"
  desc "Claude code usage calibrator"
  homepage "https://github.com/bn-l/clacal"

  depends_on macos: :sequoia

  app "Clacal.app"
  binary "#{appdir}/Clacal.app/Contents/MacOS/clacal-cli", target: "clacal"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-d", "com.apple.quarantine", "#{appdir}/Clacal.app"]
  end
end
