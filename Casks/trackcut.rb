cask "trackcut" do
  version "0.2.0"
  sha256 "bc75657f8930beb6c3bc362f3ab89993d44349d4efd453a4e4381e86d78db459"

  url "https://github.com/tamura09/trackcut/releases/download/v#{version}/TrackCut-#{version}-arm64.zip"
  name "TrackCut"
  desc "Split recordings into tagged per-track files while viewing the waveform"
  homepage "https://github.com/tamura09/trackcut"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "TrackCut.app"

  zap trash: [
    "~/Library/Caches/com.9tmr.TrackCut",
    "~/Library/HTTPStorages/com.9tmr.TrackCut",
    "~/Library/Preferences/com.9tmr.TrackCut.plist",
    "~/Library/Preferences/wtf.tmrh.TrackCut.plist",
  ]

  caveats <<~EOS
    TrackCut is ad-hoc signed and not notarized, so macOS blocks it the first time.
    After the first attempt to open it, go to System Settings > Privacy & Security
    and choose "Open Anyway".
  EOS
end
