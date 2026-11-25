class Openadapt < Formula
  include Language::Python::Virtualenv

  desc "Open-source, verified execution layer for computer-use agents"
  homepage "https://openadapt.ai"
  url "https://files.pythonhosted.org/packages/e3/c4/22b3e6ca8c1f1b3307c26981ce390609db4e49c456d738463b5d05329f8a/openadapt-1.24.0.tar.gz"
  sha256 "5ef787aff0178b1f2031d9fc684d1021ada618bb9579c09c09cd079ee7570b2a"
  license "MIT"

  depends_on "python@3.12"
  depends_on "uv"

  def install
    virtualenv_create(libexec, "python3.12")
    system formula_opt_bin("uv")/"uv", "pip", "install",
           "--python", libexec/"bin/python",
           "--no-cache",
           buildpath
    bin.install_symlink libexec/"bin/openadapt"
  end

  def caveats
    <<~EOS
      To install the Chromium browser used by OpenAdapt's web workflows, run:
        #{libexec}/bin/playwright install chromium

      Try the bundled demo without an API key:
        openadapt quickstart
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/openadapt --version")
  end
end
