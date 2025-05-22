class GitIntelligenceMessage < Formula
  desc "AI-powered Git commit message generator"
  homepage "https://github.com/davelet/git-intelligence-message"
  url "https://github.com/davelet/git-intelligence-message/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "f76ab30b21080afb93729f43060e23572930c68515c81e09c56c94d9b66b8de7"
  license "MIT"
  version "1.3.0"
  head "https://github.com/davelet/git-intelligence-message.git", branch: "main"

  bottle do
    sha256 cellar: :any_skip_relocation, sonoma: "279306c2dd61355916935a7765a8ba88c7c6e0dcdc8c7ecb0350519cb2fb852d"
    root_url "https://github.com/davelet/git-intelligence-message/releases/download/v1.3.0"
  end

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/gim", "--version"
  end
end
