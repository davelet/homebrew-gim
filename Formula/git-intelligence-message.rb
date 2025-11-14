class GitIntelligenceMessage < Formula
  desc "AI-powered Git commit message generator"
  homepage "https://github.com/davelet/git-intelligence-message"
  url "https://github.com/davelet/git-intelligence-message/archive/refs/tags/v1.8.0.tar.gz"
  sha256 "6f2eb736b515586590f60b6cb805f87499431c2123466fa915199fea8020af1b"
  license "MIT"
  version "1.8.0"
  head "https://github.com/davelet/git-intelligence-message.git", branch: "main"

  bottle do
    sha256 cellar: :any_skip_relocation, sequoia: "7a8eea725d0da3aed58d3a53916a081b33e4e6d2e144d5c7404af173677f586e"
    root_url "https://github.com/davelet/git-intelligence-message/releases/download/v1.8.0"
  end

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/gim", "--version"
  end
end
