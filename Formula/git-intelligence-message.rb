class GitIntelligenceMessage < Formula
  desc "AI-powered Git commit message generator"
  homepage "https://github.com/davelet/git-intelligence-message"
  url "https://github.com/davelet/git-intelligence-message/archive/refs/tags/v1.4.0.tar.gz"
  sha256 "c9490ceeae3f9aa7ef3b28b6ba8c39c3626d32d3c86424c8cc8631c160f8e7fa"
  license "MIT"
  version "1.4.0"
  head "https://github.com/davelet/git-intelligence-message.git", branch: "main"

  bottle do
    sha256 cellar: :any_skip_relocation, sonoma: "135b4bbd750c30cf8e39553d9176b977c8f788e7cfa2bd165a1a950d2bfce776"
    root_url "https://github.com/davelet/git-intelligence-message/releases/download/v1.4.0"
  end

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/gim", "--version"
  end
end
