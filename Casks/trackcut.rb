cask "trackcut" do
  version "0.4.0"
  sha256 "68b162be8c9a1c210d5776cac42e3835e8f93bc15f50e718bbbf37d3c8565734"

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
