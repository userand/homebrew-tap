cask "launchhome" do
  version "1.4.1"
  sha256 "b1ba58b6d4c6a0c6c9832b8c8d09e8575b604c9924d0cc62bc3c8f90d2557229"

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
