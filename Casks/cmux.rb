cask "cmux" do
  version "1.45.0"
  sha256 "fab8eb1edbef031bd904aa4a00209b49564aac56f8dac2ff97b88ca32f0856ab"
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
