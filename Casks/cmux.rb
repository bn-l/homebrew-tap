cask "cmux" do
  version "2.1.2"
  sha256 "e7739d47f6a668b8d61081a4a589ca067e385c9acf74fb5ca04f6acf68e22519"
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
