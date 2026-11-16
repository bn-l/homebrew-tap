cask "dynio" do
  version "1.10.1"

  on_arm do
    sha256 "b25e794385ed12c47c25fbab19e4389d2a1b55038d73a4701c8acfe5f0c6aa4b"
    url "https://github.com/bn-l/dynio/releases/download/dynio-v#{version}/dynio_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "28e8067d0dad0b46db30461692c7f8b745d7ca6b66dd322bf62a49a586400366"
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
