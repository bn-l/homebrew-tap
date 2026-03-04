cask "dynio" do
  version "1.2.2"

  on_arm do
    sha256 "e58fba7041effd9cd24aa7933aff5f054dfadb0c99024f9bc91b792fe3e14649"
    url "https://github.com/bn-l/dynio/releases/download/dynio-v#{version}/dynio_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "6a4f9f7f9fddae4d2396c114b0270735ef396ccc2ab0e53e836fe06f8e8f335d"
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
