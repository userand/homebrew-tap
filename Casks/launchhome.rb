cask "launchhome" do
  version "1.1.5"
  sha256 "7df932f826e212926beeeb86c16313e66c9c321630192c89c56d727fa2e52b75"

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

  zap trash: [
    "~/Library/Application Support/com.wlh.launchpad",
    "~/Library/Caches/com.wlh.launchpad",
    "~/Library/Preferences/com.wlh.launchpad.plist",
  ]
end
