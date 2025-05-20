class GitIntelligenceMessage < Formula
  desc "AI-powered Git commit message generator"
  homepage "https://github.com/davelet/git-intelligence-message"
  url "https://github.com/davelet/git-intelligence-message/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "4beff5dc6617c7a828efc88c51ea2468b7505adfbb600206e4fac48821a2afa3"
  license "MIT"
  version "1.2.0"
  head "https://github.com/davelet/git-intelligence-message.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/gim", "--version"
  end
end
