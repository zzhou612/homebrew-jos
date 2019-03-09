class I386JosElfGdb < Formula

  desc "GNU debugger"
  homepage "https://www.gnu.org/software/gdb/"
  url "http://ftpmirror.gnu.org/gdb/gdb-8.2.1.tar.xz"
  mirror "https://ftp.gnu.org/gnu/gdb/gdb-8.2.1.tar.xz"
  sha256 "0a6a432907a03c5c8eaad3c3cffd50c00a40c3a5e3c4039440624bae703f2202"

  def install
    args = %W[
      --prefix=#{prefix}
      --target=i386-jos-elf
      --disable-werror
      --with-gdb-datadir=#{pkgshare}
    ]

    system "./configure", *args
    system "make"
    system "make", "install"

    rm_rf include
    rm_rf lib
    rm_rf share/"locale"
    rm_rf share/"info"
  end
end
