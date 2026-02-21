cask "asuku" do
  version "0.1.0"
  sha256 "a9f1adb13387febbfbf9ee376016fc228dc1f2c7a24f763a275de7a40e53c27b"

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

    If macOS blocks the app on first launch:
      brew reinstall --no-quarantine --cask asuku
    Or manually:
      xattr -cr /Applications/asuku.app

    After launch:
      1. Click "Install Hook..." in the menu bar
      2. Go to System Settings → Notifications → asuku
      3. Set alert style to "Alerts" (not "Banners")
  EOS
end
