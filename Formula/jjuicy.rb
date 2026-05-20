class Jjuicy < Formula
  desc "GUI for Jujutsu version control"
  homepage "https://github.com/starburstdata/gg"
  license "Apache-2.0"
  url "https://github.com/starburstdata/jjuicy/archive/refs/tags/v1.0.3.tar.gz"
  sha256 "78a23b3bdda3d448b10096f9358dc91c9f8401c48ade88ce834ca92c22bb79d9"
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
