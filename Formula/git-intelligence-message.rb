class GitIntelligenceMessage < Formula
  desc "AI-powered Git commit message generator"
  homepage "https://github.com/davelet/git-intelligence-message"
  url "https://github.com/davelet/git-intelligence-message/archive/refs/tags/v1.2.1.tar.gz"
  sha256 "3ce3eef12f8332c670bdd232b6ce0acf8c248e29766d97e7a5b6d992a990e764"
  license "MIT"
  version "1.2.1"
  head "https://github.com/davelet/git-intelligence-message.git", branch: "main"

  bottle do
    rebuild 1
    sha256 cellar: :any_skip_relocation, sonoma: "512792dce52be0ec12caac009916ea17118af299b2e78169c21069e202d7264e"
  end

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/gim", "--version"
  end
end
