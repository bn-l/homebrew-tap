cask "cmux" do
  version "2.1.1"
  sha256 "626b6d1b5a63c137fd2c928163b54bcf24cbb88e0ce14422ca6f08a1be7c7ad3"
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
