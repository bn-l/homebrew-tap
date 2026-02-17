cask "dynio" do
  version "1.2.0"

  on_arm do
    sha256 "f40817cff813ecd9e52866786599dbe3b6d01fe6c13c4dd1f1a44f267420e7c3"
    url "https://github.com/bn-l/dynio/releases/download/dynio-v#{version}/dynio_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "abb4ac8f6fcf2db7141be9ae89c6140d0e23c8c3a1837428aa8719ac58198319"
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
