class Jjuicy < Formula
  desc "GUI for Jujutsu version control"
  homepage "https://github.com/starburstdata/gg"
  license "Apache-2.0"
  url "https://github.com/starburstdata/jjuicy/archive/refs/tags/v1.0.2-1.tar.gz"
  sha256 "a22e903a9c08460eb4fec3e267130d1a2af88c1cb2062bb596cf3b97076886ee"
  version "1.0.2-1"

  depends_on "node" => :build
  depends_on "rust" => :build

  def install
    system "npm", "install"
    system "npm", "run", "build"
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ju --version")
  end
end
