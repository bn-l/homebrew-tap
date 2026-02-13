cask "dynio" do
  version "1.1.1"

  on_arm do
    sha256 "4c870885770a149a44927d60bdf414ecad86a5a073c42577bd715b1c2370aec7"
    url "https://github.com/bn-l/dynio/releases/download/dynio-v#{version}/dynio_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "b9a58707a136b79713af61784c23dfc7116963317029de20017b6c5fc0f55fa9"
    url "https://github.com/bn-l/dynio/releases/download/dynio-v#{version}/dynio_#{version}_x64.dmg"
  end

  name "Dynio"
  desc "Wrap any CLI command in a spotlight-like omnibar"
  homepage "https://github.com/bn-l/dynio"

  app "dynio.app"
end
