class Jjuicy < Formula
  desc "GUI for Jujutsu version control"
  homepage "https://github.com/starburstdata/gg"
  license "Apache-2.0"
  url "https://github.com/starburstdata/jjuicy/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "31fa84bbe541a3e4db513ecc084dc3db4c1724e6570c3bf0bad96e2a33e85a75"
  version "2.0.0"

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
