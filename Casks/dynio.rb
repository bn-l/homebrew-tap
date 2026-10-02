cask "dynio" do
  version "1.6.1"

  on_arm do
    sha256 "8f01f04eb993370ea6fab19be3048eb87073734a62815e42a4484fa1c458679b"
    url "https://github.com/bn-l/dynio/releases/download/dynio-v#{version}/dynio_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "38bb88a06fe171eba39a1413dd33dc582a63f733caf22c10769985c32efb1e1b"
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
