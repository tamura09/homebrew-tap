cask "trackcut" do
  version "0.3.0"
  sha256 "50dedcc117ddacb2d5e2ac268e79e719ac4b1c787a16d94171bf15cdcdd88892"

  url "https://github.com/tamura09/trackcut/releases/download/v#{version}/TrackCut-#{version}-arm64.zip"
  name "TrackCut"
  desc "Split recordings into tagged per-track files while viewing the waveform"
  homepage "https://github.com/tamura09/trackcut"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
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
