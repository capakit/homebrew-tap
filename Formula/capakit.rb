class Capakit < Formula
  desc "Runtime and CLI toolkit for building AI app Kits"
  homepage "https://capakit.com"
  version "0.1.11"
  license :cannot_represent

  depends_on :macos

  on_arm do
    url "https://github.com/capakit/cli/releases/download/v0.1.11/capakit-aarch64-apple-darwin.tar.gz"
    sha256 "439f093e67649cbaf6131f8b4eb989a1ce26177a88051ba9b23a2f2285fb220d"
  end

  on_intel do
    url "https://github.com/capakit/cli/releases/download/v0.1.11/capakit-x86_64-apple-darwin.tar.gz"
    sha256 "0c91a433f3df11c3eac39506bc9d5af105e075a44b3701b2ebf06f4acb28fe65"
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
