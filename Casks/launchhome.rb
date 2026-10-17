cask "launchhome" do
  version "1.2.0"
  sha256 "26c317668d82c75a35637d21df5e40e8d1eadcaebd0884b157aa33d9ff7f7b42"

  url "https://dl.launchhome.app/releases/#{version}/LaunchHome-#{version}.dmg?r2"
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
