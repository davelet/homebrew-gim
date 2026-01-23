class GitIntelligenceMessage < Formula
  desc "AI-powered Git commit message generator"
  homepage "https://github.com/davelet/git-intelligence-message"
  url "https://github.com/davelet/git-intelligence-message/archive/refs/tags/v1.8.2.tar.gz"
  sha256 "sha256:adcf922a74a7863d7918048fd3b2f47b4dce0742486a3cfca570cbc78a8b745f"
  license "MIT"
  version "1.8.2"
  head "https://github.com/davelet/git-intelligence-message.git", branch: "main"

  bottle do
    sha256 cellar: :any_skip_relocation, sequoia: "sha256:3677e06b4aaecb9f4fa6a2d0470166d206f374f41f1d6263b7b65a06f64a7885"
    root_url "https://github.com/davelet/git-intelligence-message/releases/download/v1.8.2"
  end

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/gim", "--version"
  end
end
