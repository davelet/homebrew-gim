class GitIntelligenceMessage < Formula
  desc "AI-powered Git commit message generator"
  homepage "https://github.com/davelet/git-intelligence-message"
  url "https://github.com/davelet/git-intelligence-message/archive/refs/tags/v1.2.2.tar.gz"
  sha256 "ac78bfd2c9f4e715d163e0bf341796cf5027d93fac58f00de2fb6732afa67998"
  license "MIT"
  version "1.2.2"
  head "https://github.com/davelet/git-intelligence-message.git", branch: "main"

  bottle do
    rebuild 1
    sha256 cellar: :any_skip_relocation, sonoma: "b478f239a65b704c85cc59b1a50fcde797bbbf9c142972c08f529e5bea3f5b7a"
    root_url "https://github.com/davelet/git-intelligence-message/releases/download/v1.2.2"
  end

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/gim", "--version"
  end
end
