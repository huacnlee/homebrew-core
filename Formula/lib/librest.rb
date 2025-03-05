class Librest < Formula
  desc "Library to access RESTful web services"
  homepage "https://wiki.gnome.org/Projects/Librest"
  url "https://download.gnome.org/sources/rest/0.9/rest-0.9.1.tar.xz"
  sha256 "9266a5c10ece383e193dfb7ffb07b509cc1f51521ab8dad76af96ed14212c2e3"
  license all_of: ["LGPL-2.1-or-later", "LGPL-3.0-or-later"]

  # librest doesn't seem to follow the typical GNOME version scheme, so we
  # provide a regex to disable the `Gnome` strategy's version filtering.
  livecheck do
    url :stable
    regex(/rest[._-]v?(\d+(?:\.\d+)+)\.t/i)
  end

  bottle do
    rebuild 1
    sha256                               arm64_sequoia:  "b495dc3f46d8a9540285976f91890822b26bb33455aa22aad0d0c1eedbd542fc"
    sha256                               arm64_sonoma:   "83899cbb34ed5f7f1015a92854e0593d720bdbe31d1f44a0b29e24823e26503d"
    sha256                               arm64_ventura:  "5b9577e9c171c879a9fe98ed60239ac2997732b0d3d23be936ec4c8b51e660d7"
    sha256                               arm64_monterey: "b82cb89cd5181ce20e2bce9f9255bd7878a13d9badb6c0c8fe633be3c1fe748a"
    sha256                               arm64_big_sur:  "ce82e6e380a02285f90307b8609e63cba7dfa52a3d1fae7092296f49e67f624f"
    sha256                               sonoma:         "d1addd9b604b10a54daecd910eeb9eb739349d9e46d2c9fe4c58d3c7d8e64def"
    sha256                               ventura:        "0d09e17ff17368fce86679192c085e87cb17d48dc71e95cc27caa653b5ea614f"
    sha256                               monterey:       "fc839b0cce9619c5489fe51408792ada7ab2a5569419cd38569ca13fa6ef356b"
    sha256                               big_sur:        "83313f7234d69f6801104ba55c1b60933d8db57d8b8f818b336b8a498043b067"
    sha256                               catalina:       "7616a630b4f286a28c6520917353196f29e5ddbc488bf6880d14cb518271ff26"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "8ea0c9d41ed04199de23e8cc5cc1b0dc8ea45e24f437b0b78dc823ce0dea0018"
  end

  depends_on "gobject-introspection" => :build
  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkgconf" => [:build, :test]

  depends_on "glib"
  depends_on "json-glib"
  depends_on "libsoup"

  uses_from_macos "libxml2"

  # Backport fix to avoid gnome-online-accounts crash
  patch do
    url "https://gitlab.gnome.org/GNOME/librest/-/commit/dc860c817c311f07b489cd00c6c8dea4ad1999ca.diff"
    sha256 "af856766a93efa65e8ac619ab2be1f974a6fdd522dc38296aaa76b0359dbad65"
  end

  def install
    system "meson", "setup", "build", "-Dexamples=false", "-Dgtk_doc=false", "-Dtests=false", *std_meson_args
    system "meson", "compile", "-C", "build", "--verbose"
    system "meson", "install", "-C", "build"
  end

  test do
    (testpath/"test.c").write <<~C
      #include <stdlib.h>
      #include <rest/rest-proxy.h>

      int main(int argc, char *argv[]) {
        RestProxy *proxy = rest_proxy_new("http://localhost", FALSE);

        g_object_unref(proxy);

        return EXIT_SUCCESS;
      }
    C

    flags = shell_output("pkgconf --cflags --libs rest-1.0").chomp.split
    system ENV.cc, "test.c", "-o", "test", *flags
    system "./test"
  end
end
