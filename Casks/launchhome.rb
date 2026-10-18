cask "launchhome" do
  version "1.2.1"
  sha256 "af051f025c6c9435451e75d0ca9a99a60c4d7aaea27ee116acac67b9d253afae"

  url "https://dl.launchhome.app/releases/#{version}/LaunchHome-#{version}.dmg"
  name "LaunchHome"
  desc "Launchpad replacement with pages, folders and drag-and-drop"
  homepage "https://launchhome.app/"

  livecheck do
    url "https://dl.launchhome.app/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :ventura

  app "LaunchHome.app"

  uninstall quit: "com.wlh.launchpad"

  zap trash: [
    "~/Library/Application Support/com.wlh.launchpad",
    "~/Library/Caches/com.wlh.launchpad",
    "~/Library/Preferences/com.wlh.launchpad.plist",
  ]
end
