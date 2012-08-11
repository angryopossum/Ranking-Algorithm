class String
# colorization
  def colorize(text, color_code)
 #    "\e[#{color_code}m#{text}\e[0m"
     "\x1b[38;5;#{color_code}m#{text}\e[0m"
  end

  def red
     colorize(self, 196)
  end
  def green
     colorize(self, 46)
  end
  def yellow
     colorize(self, 226)
 end
 def green42
    colorize(self, 42)
  end
end
