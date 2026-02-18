cask "clacal" do
  version "1.1"
  sha256 "c8d18e721e022bc9aa4875a42fc0584e650c78e4733ff38fc47f018d44c953c1"
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
