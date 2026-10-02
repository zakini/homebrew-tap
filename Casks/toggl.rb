cask "toggl" do
  arch arm: "arm64", intel: "x64"

  version "1.6.1"
  sha256 arm:   "4fe3b1f0e483da03d8ec75684c16cf0a5cf5637075ee998dbe5ec1e658285aac",
         intel: "d41e6747d914a7017bca8f53010ca0ecf404e7c1b1f80e506b17608e28865ccc"

  url "https://toggl.com/toggl/desktop/downloads/Toggl-#{version}-#{arch}.dmg"
  name "Toggl"
  desc "Time tracking and capacity planning tool"
  homepage "https://toggl.com/"

  livecheck do
    url "https://toggl.com/toggl/desktop/downloads/latest-mac.yml"
    strategy :electron_builder
  end

  auto_updates true
  depends_on macos: :ventura

  app "Toggl 2.0.app"

  zap trash: [
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.toggl.focus.desktop.sfl*",
    "~/Library/Application Support/Toggl",
    "~/Library/Logs/Toggl 2.0",
    "~/Library/Preferences/com.toggl.focus.desktop.plist",
  ]
end
