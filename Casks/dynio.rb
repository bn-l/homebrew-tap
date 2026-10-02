cask "dynio" do
  version "1.8.0"

  on_arm do
    sha256 "b55b043ef942dcfbd17000ae2768262e18c949f51a66e5d0566a9e23ddd6a4b4"
    url "https://github.com/bn-l/dynio/releases/download/dynio-v#{version}/dynio_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "0c7ac74be2beec1cc5493ef4739c98d07c9dee2a1cc6a2993c7ba5dfff62a417"
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
