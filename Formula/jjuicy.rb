class Jjuicy < Formula
  desc "GUI for Jujutsu version control"
  homepage "https://github.com/starburstdata/gg"
  license "Apache-2.0"
  url "https://github.com/starburstdata/jjuicy/archive/refs/tags/v1.0.4.tar.gz"
  sha256 "fe398274c01eb1943758e7dc65b15eb3c46eb66f92b65733e126fe61e1ea988e"
  version "1.0.3"

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
