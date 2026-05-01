class Jjuicy < Formula
  desc "GUI for Jujutsu version control"
  homepage "https://github.com/starburstdata/gg"
  license "Apache-2.0"
  head "https://github.com/starburstdata/gg.git", branch: "pachu/rename"

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
