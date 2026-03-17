cask "dynio" do
  version "1.4.0"

  on_arm do
    sha256 "6676179434eb86fdb495a6bc71bdd6bff5ac777a3d4267afc43eb614106a324f"
    url "https://github.com/bn-l/dynio/releases/download/dynio-v#{version}/dynio_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
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
