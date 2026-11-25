# OpenAdapt Homebrew Tap

Official [Homebrew](https://brew.sh) tap for [OpenAdapt](https://github.com/OpenAdaptAI/OpenAdapt), the open-source, verified execution layer for computer-use agents.

## Install

```bash
brew tap OpenAdaptAI/tap
brew install openadapt
```

Or in a single command:

```bash
brew install OpenAdaptAI/tap/openadapt
```

## Verify

```bash
openadapt --version
openadapt quickstart
```

`openadapt quickstart` runs a local synthetic clinic task without an API key: it records once, compiles a deterministic program, replays with zero model calls while verifying the saved record, and catches a silent failed save.

## Upgrade

```bash
brew update
brew upgrade openadapt
```

## Links

- Repository: https://github.com/OpenAdaptAI/OpenAdapt
- Documentation: https://docs.openadapt.ai
- PyPI: https://pypi.org/project/openadapt/
