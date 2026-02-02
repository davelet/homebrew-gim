class GitIntelligenceMessage < Formula
  desc "AI-powered Git commit message generator"
  homepage "https://github.com/davelet/git-intelligence-message"
  url "https://github.com/davelet/git-intelligence-message/archive/refs/tags/v2.0.0.tar.gz"
  sha256 ""
  license "MIT"
  version "2.0.0"
  head "https://github.com/davelet/git-intelligence-message.git", branch: "main"

  bottle do
    sha256 cellar: :any_skip_relocation, sequoia: "9f1e1a4ca093b2feec6b326214b1f45ba8dbb9e3abca95a2fcba725d5630878b"
    root_url "https://github.com/davelet/git-intelligence-message/releases/download/v2.0.0"
  end

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/gim", "--version"
  end
end
