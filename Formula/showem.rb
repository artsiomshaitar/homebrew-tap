class Showem < Formula
  desc "Screen studio for your agent"
  homepage "https://github.com/artsiomshaitar/showem"
  version "0.1.2"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/artsiomshaitar/showem/releases/download/v0.1.2/showem-darwin-arm64.tar.gz"
    sha256 "dd1d94361f8baa238ebb6aa0f5b3554eb97611366848cac125efed563996a701"
  end
  on_intel do
    url "https://github.com/artsiomshaitar/showem/releases/download/v0.1.2/showem-darwin-x64.tar.gz"
    sha256 "473640db2bdae732d5696a081bd45382df30e4273c70a966a4d88f4ca4dcd711"
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
