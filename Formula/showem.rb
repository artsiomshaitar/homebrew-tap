class Showem < Formula
  desc "Screen studio for your agent"
  homepage "https://github.com/artsiomshaitar/showem"
  version "0.1.0"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/artsiomshaitar/showem/releases/download/v0.1.0/showem-darwin-arm64.tar.gz"
    sha256 "12217517890dabc32a9510f12001c439c3147e779a69ed99b57f9e9aeb2e622b"
  end
  on_intel do
    url "https://github.com/artsiomshaitar/showem/releases/download/v0.1.0/showem-darwin-x64.tar.gz"
    sha256 "0170f6cb189b70aac9dd00f0dc571a5e406550b60c7edf0c16fa631671c30073"
  end

  def install
    bin.install "showem"
  end

  def caveats
    "showem downloads Chromium and ffmpeg into ~/.showem the first time it needs them. Run `showem setup` to do it now."
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/showem --version")
  end
end
