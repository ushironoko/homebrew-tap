cask "asuku" do
  version "0.4.3"
  sha256 "c68627031b238cfb1526520c0d1a37f92ef8533e53f3f7d2dc23da850a69652b"

  url "https://github.com/ushironoko/asuku/releases/download/v#{version}/asuku-#{version}.zip"
  name "asuku"
  desc "macOS menu bar app for managing Claude Code permission requests"
  homepage "https://github.com/ushironoko/asuku"

  depends_on macos: :sonoma

  app "asuku.app"

  zap trash: [
    "~/Library/Application Support/asuku",
    "~/Library/Preferences/com.asuku.app.plist",
  ]

  caveats <<~EOS
    asuku is ad-hoc signed (not notarized by Apple).

    If macOS Gatekeeper blocks the app on first launch:
      xattr -cr /Applications/asuku.app

    After launch:
      1. Click "Install Hook..." in the menu bar
      2. Go to System Settings → Notifications → asuku
      3. Set alert style to "Alerts" (not "Banners")
  EOS
end
