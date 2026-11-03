cask "cmux" do
  version "2.1.0"
  sha256 "70ead4c1191153515e7bc414f515500a81e28061fa2079907bb04fe3f86afc24"
  url "https://github.com/bn-l/cmux/releases/download/v#{version}/cmux-macos.dmg"

  name "cmux"
  desc "Lightweight native macOS terminal with vertical tabs"
  homepage "https://github.com/bn-l/cmux"

  depends_on macos: :ventura

  app "cmux.app"
  binary "#{appdir}/cmux.app/Contents/Resources/bin/cmux"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-d", "com.apple.quarantine", "#{appdir}/cmux.app"]
  end
end
