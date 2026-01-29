# Release Guide

Generic steps to release a new version of any formula in this tap.

## 1. Commit pending changes

Ensure all feature/fix commits are done before bumping version.

## 2. Bump version in the manifest file

## 3. Build to update the lockfile

## 4. Commit version bump

```bash
git add -A && git commit -m "hk: bump version to <VERSION>"
```

## 5. Push and tag

```bash
git push origin main
git tag v<VERSION> && git push origin v<VERSION>
```

## 6. Get SHA256 of release tarball

```bash
curl -sL https://github.com/bn-l/<REPO>/archive/refs/tags/v<VERSION>.tar.gz | shasum -a 256
```

## 7. Update Homebrew formula

Edit `Formula/<name>.rb`:
- Update `url` to new tag
- Update `sha256` to value from step 6

## 8. Push tap update

```bash
git add Formula/<name>.rb && git commit -m "<name> <VERSION>" && git push origin main
```

## 9. Verify installation

```bash
brew update
brew upgrade <name>
<name> --version  # Should show new version
```

## If you amend a tagged commit

If a commit that has already been tagged is amended, the tag still points to the old commit. You must:

1. Re-tag: `git tag -f v<VERSION> && git push --force origin v<VERSION>`
2. Recompute the SHA: `curl -sL https://github.com/bn-l/<REPO>/archive/refs/tags/v<VERSION>.tar.gz | shasum -a 256`
3. Update the formula with the new `sha256` and push the tap