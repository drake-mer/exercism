class LogLineParser
  def initialize(line)
    @line = line
  end

  def message
    @line.strip().sub(/^\[.*\]\:\s+/, "")
  end

  def log_level
    /^\[(.*)\].*$/.match(@line)
    $1.downcase
  end

  def reformat
    "#{message} (#{log_level})"
  end
end
