cask "cmux" do
  version "1.42.1"
  sha256 "206f73e4597651999bb64cc5a178bccad37995400226b6288d2859363fac3b2b"
  url "https://github.com/bn-l/cmux/releases/download/v#{version}/cmux-macos.dmg"

  name "cmux"
  desc "Lightweight native macOS terminal with vertical tabs"
  homepage "https://github.com/bn-l/cmux"

  depends_on macos: ">= :ventura"

  app "cmux.app"
  binary "#{appdir}/cmux.app/Contents/Resources/bin/cmux"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-d", "com.apple.quarantine", "#{appdir}/cmux.app"]
  end
end
