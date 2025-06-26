class GitIntelligenceMessage < Formula
  desc "AI-powered Git commit message generator"
  homepage "https://github.com/davelet/git-intelligence-message"
  url "https://github.com/davelet/git-intelligence-message/archive/refs/tags/v1.4.0.tar.gz"
  sha256 "c9490ceeae3f9aa7ef3b28b6ba8c39c3626d32d3c86424c8cc8631c160f8e7fa"
  license "MIT"
  version "1.4.0"
  head "https://github.com/davelet/git-intelligence-message.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/gim", "--version"
  end
end
