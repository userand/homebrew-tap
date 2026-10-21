cask "launchhome" do
  version "1.3.1"
  sha256 "5f875497d16fb9018e84f167c1f62e2950f5f028bcd5dc454cdaf36455d538bf"

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
