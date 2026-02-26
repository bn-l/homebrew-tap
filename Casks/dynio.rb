cask "dynio" do
  version "1.2.1"

  on_arm do
    sha256 "e2c69c263d60afbeb12bee906c3f25f4f8f63262a8718c0731e0a3e83d222631"
    url "https://github.com/bn-l/dynio/releases/download/dynio-v#{version}/dynio_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "9ebfc9d2b4a661d5cdd477a8a8263185b16fb87346ece20bca9111cb080b1982"
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
