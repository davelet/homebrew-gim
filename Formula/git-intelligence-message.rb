class GitIntelligenceMessage < Formula
  desc "An advanced Git commit message generation utility with AI assistance"
  homepage "https://git-intelligence-message.pages.dev/"
  version "2.1.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/davelet/git-intelligence-message/releases/download/v2.1.0/git-intelligence-message-aarch64-apple-darwin.tar.xz"
      sha256 "0824327cc04a702b3ebe6fec1245296d8baaaf05a469e507ae4300c82b3f3aac"
    end
    if Hardware::CPU.intel?
      url "https://github.com/davelet/git-intelligence-message/releases/download/v2.1.0/git-intelligence-message-x86_64-apple-darwin.tar.xz"
      sha256 "26b5b0f56c00738f297f1fc02dd7f752e4149d98e6c5f026e84e7fa09f52b5a6"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/davelet/git-intelligence-message/releases/download/v2.1.0/git-intelligence-message-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "fe95e70ed6959670dfb3d935f80689aa76ba6a57b09654c0cecb76dac57e258a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/davelet/git-intelligence-message/releases/download/v2.1.0/git-intelligence-message-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "5ab3caa1b2f9797292a0fa7351628a3ff4efba1311325cb0e00dd87933b2a0c9"
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
