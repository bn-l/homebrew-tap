cask "dynio" do
  version "1.7.0"

  on_arm do
    sha256 "08dbdb00187028663ea96340528adb617e6fdc1b96fd5752bb5a7a4af3053ced"
    url "https://github.com/bn-l/dynio/releases/download/dynio-v#{version}/dynio_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "e1caaf4472f5040774d3660100ac79a71f3114f6e891ff649c8eee4ceb333b11"
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
