class GitIntelligenceMessage < Formula
  desc "AI-powered Git commit message generator"
  homepage "https://github.com/davelet/git-intelligence-message"
  url "https://github.com/davelet/git-intelligence-message/archive/refs/tags/v1.4.0.tar.gz"
  sha256 "6f2eb736b515586590f60b6cb805f87499431c2123466fa915199fea8020af1b"
  license "MIT"
  version "1.4.0"
  head "https://github.com/davelet/git-intelligence-message.git", branch: "main"

  bottle do
    sha256 cellar: :any_skip_relocation, sequoia: "f8e620b0249e8abae0133074c140eea47212776ac424356c2f9a3bb7d03937f8"
    root_url "https://github.com/davelet/git-intelligence-message/releases/download/v1.7.0"
  end

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/gim", "--version"
  end
end
