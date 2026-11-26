class Openadapt < Formula
  include Language::Python::Virtualenv

  desc "Open-source, verified execution layer for computer-use agents"
  homepage "https://openadapt.ai"
  url "https://files.pythonhosted.org/packages/d1/5a/9a861fe5529aaaf326be56774bea5761c11c8ae0a12763eabdda56db0dd5/openadapt-1.24.1.tar.gz"
  sha256 "69d1bdf1759c7f062c68765cb4dceefbd2b2f784e0559432807097fc438456c2"
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
