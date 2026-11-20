class Showem < Formula
  desc "Screen studio for your agent"
  homepage "https://github.com/artsiomshaitar/showem"
  version "0.2.0"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/artsiomshaitar/showem/releases/download/v0.2.0/showem-darwin-arm64.tar.gz"
    sha256 "ff3167ce42dc65919369bffae68ec40df0eae4428308d30d8b8de1bf4859d9da"
  end
  on_intel do
    url "https://github.com/artsiomshaitar/showem/releases/download/v0.2.0/showem-darwin-x64.tar.gz"
    sha256 "180fdbe820eaa86dade0b36741442864bc3d6a1088f247d3161cf8a71d15a4c3"
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
