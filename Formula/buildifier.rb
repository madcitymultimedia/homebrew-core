class Buildifier < Formula
  desc "Format bazel BUILD files with a standard convention"
  homepage "https://github.com/bazelbuild/buildtools"
  url "https://github.com/bazelbuild/buildtools.git",
      :tag      => "3.0.0",
      :revision => "dbd4ef8997abb3a7bef0ba4867caaf206db86b6e"

  bottle do
    cellar :any_skip_relocation
    sha256 "89399cb878ff42751f4d7da1e8c11a8b74f262ec8c0635ec9b9c975ca3b984a5" => :catalina
    sha256 "89399cb878ff42751f4d7da1e8c11a8b74f262ec8c0635ec9b9c975ca3b984a5" => :mojave
    sha256 "89399cb878ff42751f4d7da1e8c11a8b74f262ec8c0635ec9b9c975ca3b984a5" => :high_sierra
  end

  depends_on "bazelisk" => :build

  def install
    system "bazelisk", "build", "--config=release", "buildifier:buildifier"
    bin.install "bazel-bin/buildifier/darwin_amd64_stripped/buildifier"
  end

  test do
    touch testpath/"BUILD"
    system "#{bin}/buildifier", "-mode=check", "BUILD"
  end
end
