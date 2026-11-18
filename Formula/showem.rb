class Showem < Formula
  desc "Screen studio for your agent"
  homepage "https://github.com/artsiomshaitar/showem"
  version "0.1.3"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/artsiomshaitar/showem/releases/download/v0.1.3/showem-darwin-arm64.tar.gz"
    sha256 "41ed15fffd3bf311932259a6e6f7bff4316b44654a8abe25fd99e8602fed4afa"
  end
  on_intel do
    url "https://github.com/artsiomshaitar/showem/releases/download/v0.1.3/showem-darwin-x64.tar.gz"
    sha256 "eabd05deb8ffc0343f35b50022cdea76f0fb898f206da6d82e0ea32ba9174b8f"
  end

  def install
    bin.install "showem"
    generate_completions_from_executable(bin/"showem", "completion", shells: [:bash, :zsh])
  end

  def caveats
    "showem downloads Chromium and ffmpeg into ~/.showem the first time it needs them. Run `showem setup` to do it now."
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/showem --version")
  end
end
