class Coconut < Formula
  include Language::Python::Virtualenv

  desc "Simple, elegant, Pythonic functional programming"
  homepage "https://coconut-lang.org/"
  url "https://files.pythonhosted.org/packages/93/75/414f33186846444da53b4e834d5ccfb0577d0e09b997819c183fa509f70a/coconut-3.1.2.tar.gz"
  sha256 "ef0656ee2df4594007f998f4a9c2a1b9bfbc40541a400cbaa00ccbbac50e5414"
  license "Apache-2.0"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sequoia:  "f40d1201b9b52e5ef52b03102febee1add7119a7091bd9313b068ffe4ff62556"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "caf2ac1e1c6f0aed297ef0b9af1c49a8968c0cf4cfd8230e0b7e2cc618ae3090"
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "e31ea818db43d09baa443fe2af11f981a1b2e625c88b629e1eef957bf05663a7"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "f97665b22bc5843e14c962ab685060b8eefb776ebfa14cfb01ff573ee5d8cf09"
    sha256 cellar: :any_skip_relocation, sonoma:         "02c14e4de3171dcb73d5308375a2dd5b23f2edbf435685033235c8ba5e5a8b69"
    sha256 cellar: :any_skip_relocation, ventura:        "2f950454d298751f88015943d97e7dd4bc504c254aa3d70946c9e8a3e31f94c4"
    sha256 cellar: :any_skip_relocation, monterey:       "0ed68359bcf643eb9a67817660a59e2fbcf0c0b56ad9b0f072f6484a6ead0f02"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "3bb84dd30519e83e8af41fd21ca1e4ec7df8562bee1e45a08575fa85e5b907b7"
  end

  depends_on "python@3.13"

  resource "anyio" do
    url "https://files.pythonhosted.org/packages/78/49/f3f17ec11c4a91fe79275c426658e509b07547f874b14c1a526d86a83fc8/anyio-4.6.0.tar.gz"
    sha256 "137b4559cbb034c477165047febb6ff83f390fc3b20bf181c1fc0a728cb8beeb"
  end

  resource "async-generator" do
    url "https://files.pythonhosted.org/packages/ce/b6/6fa6b3b598a03cba5e80f829e0dadbb49d7645f523d209b2fb7ea0bbb02a/async_generator-1.10.tar.gz"
    sha256 "6ebb3d106c12920aaae42ccb6f787ef5eefdcdd166ea3d628fa8476abe712144"
  end

  resource "cpyparsing" do
    url "https://files.pythonhosted.org/packages/74/fe/7d45fc7fb67dd3cdaef4430c882b0b655e18ca45cf792d5feefb15f18ca2/cpyparsing-2.4.7.2.4.0.tar.gz"
    sha256 "ee3d2f262712ad252a640131687d1b25985127a5d9ba2e1200f3017165f2ee7d"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/f1/70/7703c29685631f5a7590aa73f1f1d3fa9a380e654b86af429e0934a32f7d/idna-3.10.tar.gz"
    sha256 "12f65c9b470abda6dc35cf8e63cc574b1c52b11df2c86030af0ac09b01b13ea9"
  end

  resource "prompt-toolkit" do
    url "https://files.pythonhosted.org/packages/2d/4f/feb5e137aff82f7c7f3248267b97451da3644f6cdc218edfe549fb354127/prompt_toolkit-3.0.48.tar.gz"
    sha256 "d6623ab0477a80df74e646bdbc93621143f5caf104206aa29294d53de1a03d90"
  end

  resource "psutil" do
    url "https://files.pythonhosted.org/packages/18/c7/8c6872f7372eb6a6b2e4708b88419fb46b857f7a2e1892966b851cc79fc9/psutil-6.0.0.tar.gz"
    sha256 "8faae4f310b6d969fa26ca0545338b21f73c6b15db7c4a8d934a5482faa818f2"
  end

  resource "pygments" do
    url "https://files.pythonhosted.org/packages/8e/62/8336eff65bcbc8e4cb5d05b55faf041285951b6e80f33e2bff2024788f31/pygments-2.18.0.tar.gz"
    sha256 "786ff802f32e91311bff3889f6e9a86e81505fe99f2735bb6d60ae0c5004f199"
  end

  resource "setuptools" do
    url "https://files.pythonhosted.org/packages/27/b8/f21073fde99492b33ca357876430822e4800cdf522011f18041351dfa74b/setuptools-75.1.0.tar.gz"
    sha256 "d59a21b17a275fb872a9c3dae73963160ae079f1049ed956880cd7c09b120538"
  end

  resource "sniffio" do
    url "https://files.pythonhosted.org/packages/a2/87/a6771e1546d97e7e041b6ae58d80074f81b7d5121207425c964ddf5cfdbd/sniffio-1.3.1.tar.gz"
    sha256 "f4324edc670a0f49750a81b895f35c3adb843cca46f0530f79fc1babb23789dc"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/df/db/f35a00659bc03fec321ba8bce9420de607a1d37f8342eee1863174c69557/typing_extensions-4.12.2.tar.gz"
    sha256 "1a7ead55c7e559dd4dee8856e3a88b41225abfe1ce8df57b7c13915fe121ffb8"
  end

  resource "wcwidth" do
    url "https://files.pythonhosted.org/packages/6c/63/53559446a878410fc5a5974feb13d31d78d752eb18aeba59c7fef1af7598/wcwidth-0.2.13.tar.gz"
    sha256 "72ea0c06399eb286d978fdedb6923a9eb47e1c486ce63e9b4e64fc18303972b5"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    (testpath/"hello.coco").write <<~EOS
      "hello, world!" |> print
    EOS
    assert_match "hello, world!", shell_output("#{bin}/coconut -r hello.coco")
  end
end
