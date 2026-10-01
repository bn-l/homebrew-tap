cask "dynio" do
  version "1.6.0"

  on_arm do
    sha256 "156071e49cab5292ebc0b8730c1f5e9e371e9db2008cb4c89463148740711633"
    url "https://github.com/bn-l/dynio/releases/download/dynio-v#{version}/dynio_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "a0d96235c7aff63c62263e4bf26fec728c95c35eb2f85c56df7a171b75f0d3e0"
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
