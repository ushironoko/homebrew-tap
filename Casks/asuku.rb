cask "asuku" do
  version "0.4.0"
  sha256 "3a9bfefea828e2ce59bcb76fb4646d60ebccb645a2bc8d7969d53a31b823bd57"

  url "https://github.com/ushironoko/asuku/releases/download/v#{version}/asuku-#{version}.zip"
  name "asuku"
  desc "macOS menu bar app for managing Claude Code permission requests"
  homepage "https://github.com/ushironoko/asuku"

  depends_on macos: ">= :sonoma"

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
