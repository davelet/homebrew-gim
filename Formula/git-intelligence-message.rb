class GitIntelligenceMessage < Formula
  desc "An advanced Git commit message generation utility with AI assistance"
  homepage "https://git-intelligence-message.pages.dev/"
  version "2.1.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/davelet/git-intelligence-message/releases/download/v2.1.1/git-intelligence-message-aarch64-apple-darwin.tar.xz"
      sha256 "e4aa9f3f8ee686ff020578bdeb819576e4673a404de019e6a34e69bdc4c2a556"
    end
    if Hardware::CPU.intel?
      url "https://github.com/davelet/git-intelligence-message/releases/download/v2.1.1/git-intelligence-message-x86_64-apple-darwin.tar.xz"
      sha256 "fbfa62e70109d9fe18984c1f6637a23d42a98ac265ee7032005ff500cd679836"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/davelet/git-intelligence-message/releases/download/v2.1.1/git-intelligence-message-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "a632e41c5dde337beee8dcccc2f4b76ee4cfe1ed44f14028ed92fc6391ef906b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/davelet/git-intelligence-message/releases/download/v2.1.1/git-intelligence-message-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "c0d0260a25a4e9b4c0754537cd762c6020f2abf6e4c92f7c60b641442d291f37"
    end
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":      {},
    "aarch64-pc-windows-gnu":    {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin":       {},
    "x86_64-pc-windows-gnu":     {},
    "x86_64-unknown-linux-gnu":  {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    bin.install "gim" if OS.mac? && Hardware::CPU.arm?
    bin.install "gim" if OS.mac? && Hardware::CPU.intel?
    bin.install "gim" if OS.linux? && Hardware::CPU.arm?
    bin.install "gim" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
