cask "launchhome" do
  version "1.3.2"
  sha256 "e915a9ac10586440457e1edcfd5db187938928b60e2a9f3bd5b58970af335e2f"

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
