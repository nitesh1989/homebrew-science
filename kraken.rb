require "formula"

class Kraken < Formula
  homepage "http://ccb.jhu.edu/software/kraken/"
  url "https://ccb.jhu.edu/software/kraken/dl/kraken-0.10.5-beta.tgz"
  sha1 ""

  needs :openmp

  def install
    libexec.mkdir
    system "./install_kraken.sh", libexec
    libexec_bins = ["kraken", "kraken-build", "kraken-report"].map { |x| libexec + x }
    bin.install_symlink(libexec_bins)
  end

  test do
    system "kraken", "--version"
  end
end
