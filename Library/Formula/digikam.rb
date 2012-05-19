require 'formula'

class Digikam < Formula
  homepage 'http://www.digikam.org/'
  url 'http://sourceforge.net/projects/digikam/files/digikam/2.6.0-rc/digikam-software-compilation-2.6.0-rc.tar.bz2'
  md5 "271892857156464617a0513b5ec108d8"

  depends_on 'cmake' => :build
  depends_on 'kdelibs' => :build
  depends_on 'qjson' => :build

  def install
    #mkdir '../build'
    #cd '../build'

    #We only build creative tools (krita and karbon)
    system "cmake #{std_cmake_parameters}"
    system "make install" # if this fails, try separate make/make install steps
  end

  def test
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test calligra`.
    system "false"
  end
end
