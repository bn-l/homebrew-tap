cask "dynio" do
  version "1.10.0"

  on_arm do
    sha256 "d7001bcb03e8dddbce69a8ae3797b1401603b7c5d1e9083d4e98817595430da2"
    url "https://github.com/bn-l/dynio/releases/download/dynio-v#{version}/dynio_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "91dc2988c182ea778e301095b14674cbaccb3bdcdc458fe46cea14df77a7bc92"
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
