class Showem < Formula
  desc "Screen studio for your agent"
  homepage "https://github.com/artsiomshaitar/showem"
  version "0.1.0"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/artsiomshaitar/showem/releases/download/v0.1.0/showem-darwin-arm64.tar.gz"
    sha256 "f2d9cb70c0cb40d3697474a71fdba3745133053ac684aa9b4bff40e3dadcdebd"
  end
  on_intel do
    url "https://github.com/artsiomshaitar/showem/releases/download/v0.1.0/showem-darwin-x64.tar.gz"
    sha256 "4442d659be9677dc471e44f7590df41b035a14e6587b6b262aa28295dbd29225"
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
