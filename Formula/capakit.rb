class Capakit < Formula
  desc "Runtime and CLI toolkit for local-first AI apps"
  homepage "https://capakit.com"
  version "0.1.10"
  license :cannot_represent

  depends_on :macos

  on_arm do
    url "https://github.com/capakit/cli/releases/download/v0.1.10/capakit-aarch64-apple-darwin.tar.gz"
    sha256 "179b4c573e38f6ad732473d66d2dadf6a7efb5c64831bf5459ab5926e5761256"
  end

  on_intel do
    url "https://github.com/capakit/cli/releases/download/v0.1.10/capakit-x86_64-apple-darwin.tar.gz"
    sha256 "c0d0e30a2f7813bb24de530e388f665d1fac3429303a284e789e2c2e8dfe67f9"
  end

  def install
    bin.install "capakit"
    pkgshare.install "THIRD_PARTY_NOTICES.json" if File.exist?("THIRD_PARTY_NOTICES.json")
  end

  test do
    system "#{bin}/capakit", "--version"
    system "#{bin}/capakit", "licenses", "--output", "json"
  end
end
