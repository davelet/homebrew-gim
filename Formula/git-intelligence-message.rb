class GitIntelligenceMessage < Formula
  desc "An advanced Git commit message generation utility with AI assistance"
  homepage "https://git-intelligence-message.pages.dev/"
  version "2.1.3"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/davelet/git-intelligence-message/releases/download/v2.1.3/git-intelligence-message-aarch64-apple-darwin.tar.xz"
      sha256 "ac7c20bddd8bbb62b3154a0d25b7d151ae506f39d37165351d55f407402a2de6"
    end
    if Hardware::CPU.intel?
      url "https://github.com/davelet/git-intelligence-message/releases/download/v2.1.3/git-intelligence-message-x86_64-apple-darwin.tar.xz"
      sha256 "843c74dcc5b69a62f2d8a6f76fa74d064dff9b4a60fb3601aa17f8ab4e961429"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/davelet/git-intelligence-message/releases/download/v2.1.3/git-intelligence-message-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "374949656eba92e19fec2ec1df38e0b2be93cf47563ce944eb74e750ac77d5b2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/davelet/git-intelligence-message/releases/download/v2.1.3/git-intelligence-message-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "f684e49a01fcb99bc739804c01323a87620f8f01d925c5e00f1b21a56d77cff5"
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
