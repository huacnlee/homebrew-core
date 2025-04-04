class Proto < Formula
  desc "Pluggable multi-language version manager"
  homepage "https://moonrepo.dev/proto"
  url "https://github.com/moonrepo/proto/archive/refs/tags/v0.47.7.tar.gz"
  sha256 "6326400606439053de5ec4ac376313f3bdc74c91d6723c4feea95afb27b194d6"
  license "MIT"
  head "https://github.com/moonrepo/proto.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "418c4427c4cb0acb99feed6e7e0fee86aa84a5a481f62db2734989660721bbb8"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "58fd375db8b21064566dd230213963ba26f176fafebfa87137931781400d891e"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "9c531d31305ffe13fa0865d6b05300f0416d144c1e5bf94ee1af58b47ae50fce"
    sha256 cellar: :any_skip_relocation, sonoma:        "3f1a2e738a9fb646b2c5a9e2ec4c355f2e02b300e5a65029832ace43dfa8f30c"
    sha256 cellar: :any_skip_relocation, ventura:       "d34d9242c6afc8b9396be40cdaea58030187b63ae243541b4aa6b4f5c903fbb1"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "fb15f902d5925c7b2361d3f0d6d797e79b791c09820103d96fcf4dd307d1d36d"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "3ffc7a84db0f6c6cf6f756cdb7abeb83a67222d82eca7599ab36639ed48c2e11"
  end

  depends_on "pkgconf" => :build
  depends_on "rust" => :build

  uses_from_macos "bzip2"

  on_linux do
    depends_on "xz"
  end

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/cli")
    generate_completions_from_executable(bin/"proto", "completions", "--shell")

    bin.each_child do |f|
      basename = f.basename

      # shimming proto-shim would break any shims proto itself creates,
      # it luckily works fine without PROTO_LOOKUP_DIR
      next if basename.to_s == "proto-shim"

      (libexec/"bin").install f
      # PROTO_LOOKUP_DIR is necessary for proto to find its proto-shim binary
      (bin/basename).write_env_script libexec/"bin"/basename, PROTO_LOOKUP_DIR: opt_prefix/"bin"
    end
  end

  def caveats
    <<~EOS
      To finish the installation, run:
        proto setup
    EOS
  end

  test do
    system bin/"proto", "install", "node", "19.0.1"
    node = shell_output("#{bin}/proto bin node").chomp
    assert_match "19.0.1", shell_output("#{node} --version")

    path = testpath/"test.js"
    path.write "console.log('hello');"
    output = shell_output("#{testpath}/.proto/shims/node #{path}").strip
    assert_equal "hello", output
  end
end
