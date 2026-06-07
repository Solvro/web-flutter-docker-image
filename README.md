# Flutter Web-Only Base Image

Standalone GHCR image for Flutter web-only builds.

Our custom version after discontinuation of the CirrusLabs image.

## Image tags

After pushing this directory as a repository, the publish workflow creates:

- `ghcr.io/solvro/flutter-web-only:<flutter-version>`

For this app, use for example:

```dockerfile
FROM ghcr.io/solvro/flutter-web-only:3.44.1 AS build
```

## Versioning

The pinned Flutter stable version lives in `versions.env` as `FLUTTER_STABLE_VERSION`.

The scheduled updater checks the latest Flutter stable release and opens a PR that updates `versions.env`. Merging that PR triggers the publish workflow and pushes a new specific version tag.

## Contents

This image installs Flutter from the official Flutter git tag and pre-caches only web artifacts. It does not include the Android SDK, Java runtime, or Android command-line tools.
