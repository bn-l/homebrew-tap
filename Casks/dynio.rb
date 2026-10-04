cask "dynio" do
  version "1.9.0"

  on_arm do
    sha256 "23b68de343cae0eb8d5596c19973560cebd8709326fa2243cfc8bd687511a8ae"
    url "https://github.com/bn-l/dynio/releases/download/dynio-v#{version}/dynio_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "8145e09a0cd85303d9f2a682f4ff1cea8bcd5d0824959ca8f11006216c06fe26"
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
