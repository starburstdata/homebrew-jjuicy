class Jjuicy < Formula
  desc "GUI for Jujutsu version control"
  homepage "https://github.com/starburstdata/gg"
  license "Apache-2.0"
  url "https://github.com/starburstdata/jjuicy/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "9126b61f721118254726c41af55d530e1e47efa61e8a82934deb153232964922"
  version "1.0.2"

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
