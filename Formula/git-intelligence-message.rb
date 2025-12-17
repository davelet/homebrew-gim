class GitIntelligenceMessage < Formula
  desc "AI-powered Git commit message generator"
  homepage "https://github.com/davelet/git-intelligence-message"
  url "https://github.com/davelet/git-intelligence-message/archive/refs/tags/v1.8.1.tar.gz"
  sha256 "e26cba7cba44da7b1336a55da4965fd2a0d72280e00e505085baaee657fba4f3"
  license "MIT"
  version "1.8.1"
  head "https://github.com/davelet/git-intelligence-message.git", branch: "main"

  bottle do
    sha256 cellar: :any_skip_relocation, sequoia: "9ec1dc5c221e5f98bb7b22677feac5d31cb7c38fe9bf4736b1d704fad1ad4eaf"
    root_url "https://github.com/davelet/git-intelligence-message/releases/download/v1.8.1"
  end

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/gim", "--version"
  end
end
