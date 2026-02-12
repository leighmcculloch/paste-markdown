class PasteMarkdown < Formula
  desc "Convert clipboard HTML to Markdown"
  homepage "https://github.com/leighmcculloch/paste-markdown"
  head "https://github.com/leighmcculloch/paste-markdown.git", branch: "main"
  license "MIT"

  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"

    app = prefix/"Paste Markdown.app"
    (app/"Contents/MacOS").mkpath
    cp ".build/release/PasteMarkdown", app/"Contents/MacOS/"
    cp "Info.plist", app/"Contents/"
  end

  def caveats
    <<~EOS
      To start Paste Markdown:
        open "#{opt_prefix}/Paste Markdown.app"
    EOS
  end
end
