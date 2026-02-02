class GitIntelligenceMessage < Formula
  desc "AI-powered Git commit message generator"
  homepage "https://github.com/davelet/git-intelligence-message"
  url "https://github.com/davelet/git-intelligence-message/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "adcf922a74a7863d7918048fd3b2f47b4dce0742486a3cfca570cbc78a8b745f"
  license "MIT"
  version "2.0.0"
  head "https://github.com/davelet/git-intelligence-message.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/gim", "--version"
  end
end
