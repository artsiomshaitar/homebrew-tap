class Showem < Formula
  desc "Screen studio for your agent"
  homepage "https://github.com/artsiomshaitar/showem"
  version "0.2.1"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/artsiomshaitar/showem/releases/download/v0.2.1/showem-darwin-arm64.tar.gz"
    sha256 "3f13440896187e20ad6933a4213b0e1d0fb549b36a873363c1f9e9fc61c854d8"
  end
  on_intel do
    url "https://github.com/artsiomshaitar/showem/releases/download/v0.2.1/showem-darwin-x64.tar.gz"
    sha256 "ae67b1aa1f981bd170ca376d08646e106b70de794b41f45f98bc7790cd5ce257"
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
