cask "clacal" do
  version "1.9.0"
  sha256 "3057e7fd9064cf1ca5b355744ae7fb124e8c9cc0ed9e4955ba4aaf524edb223b"
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
