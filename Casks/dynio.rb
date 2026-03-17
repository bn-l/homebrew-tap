cask "dynio" do
  version "1.3.0"

  on_arm do
    sha256 "cd7809b0fb9ecd70180b02eaca6e377841e7bf5297c12b7822694553f8d9362e"
    url "https://github.com/bn-l/dynio/releases/download/dynio-v#{version}/dynio_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "e2d2ba2f9a9e0c38a63cb0857facf8e648d41607192cd5717e3b72be66f24a66"
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
