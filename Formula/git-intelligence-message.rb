class GitIntelligenceMessage < Formula
  desc "AI-powered Git commit message generator"
  homepage "https://github.com/davelet/git-intelligence-message"
  url "https://github.com/davelet/git-intelligence-message/archive/refs/tags/v1.3.2.tar.gz"
  sha256 "97021fca191fb2bc78f026ba1333f74e54a1e1d0f678021ffb8fb7fdd9b96915"
  license "MIT"
  version "1.3.2"
  head "https://github.com/davelet/git-intelligence-message.git", branch: "main"

  bottle do
    sha256 cellar: :any_skip_relocation, sonoma: "e5e3e1918eaab9ef8204f5c50db4c24c606ac579ac03cdbf14867825b62d8b05"
    root_url "https://github.com/davelet/git-intelligence-message/releases/download/v1.3.2"
  end

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/gim", "--version"
  end
end
