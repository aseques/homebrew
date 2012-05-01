require 'formula'

class Calligra < Formula
  homepage 'http://www.calligra.org/'
  url 'http://anongit.kde.org/calligra/calligra-latest.tar.gz'
  md5 '5635a8d7bc3e8fdbfa3fa51b94d03201'

  depends_on 'cmake' => :build
  depends_on 'kdelibs' => :build
  depends_on 'eigen' => :build
  depends_on 'lcms2' => :build

  def install
    system "sh initrepo.sh"
    mkdir '../build'
    cd '../build'

    #We only build creative tools (krita and karbon)
    system "cmake ../calligra #{std_cmake_parameters} -DCREATIVEONLY=ON -DEIGEN2_INCLUDE_DIR='/usr/local/Cellar/eigen/3.0.5/include/eigen3/'"
    system "make install" # if this fails, try separate make/make install steps
  end

  def test
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test calligra`.
    system "false"
  end
end
