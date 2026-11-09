class Showem < Formula
  desc "Screen studio for your agent"
  homepage "https://github.com/artsiomshaitar/showem"
  version "0.1.1"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/artsiomshaitar/showem/releases/download/v0.1.1/showem-darwin-arm64.tar.gz"
    sha256 "cd38b7b6fe20608b23847c61c5cb61751ecbe6afda88ba01f1fd5bbef394cf2a"
  end
  on_intel do
    url "https://github.com/artsiomshaitar/showem/releases/download/v0.1.1/showem-darwin-x64.tar.gz"
    sha256 "adab3f34be198a8bd171849e9f942b4aff2cc2603953517d1b4ec42401e8fc46"
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
