class PasteMarkdown < Formula
  desc "Convert clipboard HTML to Markdown"
  homepage "https://github.com/leighmcculloch/paste-markdown"
  head "https://github.com/leighmcculloch/paste-markdown.git", branch: "main"
  license "MIT"

  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"

    system "swift", "scripts/generate-icon.swift"

    app = prefix/"Paste Markdown.app"
    (app/"Contents/MacOS").mkpath
    (app/"Contents/Resources").mkpath
    cp ".build/release/PasteMarkdown", app/"Contents/MacOS/"
    cp "Info.plist", app/"Contents/"
    cp "build/AppIcon.icns", app/"Contents/Resources/"
  end

  def post_install
    ln_s prefix/"Paste Markdown.app", "/Applications/Paste Markdown.app"
  end

  def caveats
    <<~EOS
      Paste Markdown.app has been linked to /Applications.
    EOS
  end
end
