class Showem < Formula
  desc "Screen studio for your agent"
  homepage "https://github.com/artsiomshaitar/showem"
  version "0.1.4"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/artsiomshaitar/showem/releases/download/v0.1.4/showem-darwin-arm64.tar.gz"
    sha256 "853a8669d8f41df78b4bf6683e3299feee09ebc0e0f4900ff54fe6262cf7a904"
  end
  on_intel do
    url "https://github.com/artsiomshaitar/showem/releases/download/v0.1.4/showem-darwin-x64.tar.gz"
    sha256 "b4dbecb120bf435a653ccfd6c64fa3e0f91f7f4ee703bbfa181cb1e6028d936f"
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
