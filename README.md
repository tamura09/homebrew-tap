# tamura09/homebrew-tap

Homebrew tap for tamura09's apps.

## Casks

- [TrackCut](https://github.com/tamura09/trackcut): splits a long FLAC / M4A / WAV recording into tagged per-track files while viewing the waveform. Apple silicon, macOS 15 or later

## Install

```sh
brew install --cask tamura09/tap/trackcut
```

Installing by the fully qualified name trusts only that cask ([Homebrew tap trust](https://docs.brew.sh/Tap-Trust)). To install by the short name instead, tap and trust the cask first:

```sh
brew tap tamura09/tap
brew trust --cask tamura09/tap/trackcut
brew install --cask trackcut
```

TrackCut is ad-hoc signed and not notarized, so macOS blocks it the first time. After the first attempt to open it, go to System Settings > Privacy & Security and choose "Open Anyway".

## Updating a cask

After publishing a new release, update `version` and `sha256` in `Casks/<name>.rb`, then check it:

```sh
brew style tamura09/tap
brew audit --cask --strict --online tamura09/tap/<name>
```

`brew audit --new` also fails on the GitHub notability and signature checks. Those are requirements for homebrew/cask, not for this tap.
