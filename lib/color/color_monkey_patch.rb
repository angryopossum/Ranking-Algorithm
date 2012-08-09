class String
# colorization
  def colorize(text, color_code)
     "\e[#{color_code}m#{text}\e[0m"
  end

  def red
     colorize(self, 31)
  end
  def green
     colorize(self, 32)
  end
  def yellow
     colorize(self, 33)
 end
 def pink
    colorize(self, 35)
  end
end
