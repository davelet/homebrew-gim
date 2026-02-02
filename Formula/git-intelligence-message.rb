class GitIntelligenceMessage < Formula
  desc "AI-powered Git commit message generator"
  homepage "https://github.com/davelet/git-intelligence-message"
  url "https://github.com/davelet/git-intelligence-message/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "bedfb595e3d73156656bed2a603e2a737f8d84d1e79c55a35c4aa84e4708d0e9"
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
