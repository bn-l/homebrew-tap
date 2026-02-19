cask "clacal" do
  version "1.3"
  sha256 "10de66df71c80aa98b264077cddd707201a1f10d9f2673ff43baccd0128f29ba"
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
