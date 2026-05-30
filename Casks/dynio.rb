cask "dynio" do
  version "1.5.0"

  on_arm do
    sha256 "450de7f8a37194c05256e315abf45fd1b22408c3a4e3dd1eaf853a61c75dc184"
    url "https://github.com/bn-l/dynio/releases/download/dynio-v#{version}/dynio_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "60409e0c3874c21a856cf8053dc08bbfa312cb81b4626a3c67b2bce11157cce5"
    url "https://github.com/bn-l/dynio/releases/download/dynio-v#{version}/dynio_#{version}_x64.dmg"
  end

  name "Dynio"
  desc "Wrap any CLI command in a spotlight-like omnibar"
  homepage "https://github.com/bn-l/dynio"

  app "dynio.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-d", "com.apple.quarantine", "#{appdir}/dynio.app"]
  end
end
