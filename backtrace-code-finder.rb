class PrettyBacktrace
  CONTEXT = 3

  class << self
    def print(exception)
      file, line = exception.backtrace.first.split(':')
      line = line.to_i - 1 # Zero indexed.

      code = File.open(file).read.split("\n")

      ret_ary = realign(code, line)
      ret = ret_ary[(line - CONTEXT) .. (line + CONTEXT)].join("\n")

      puts exception.backtrace.first
      puts
      puts ret.rstrip # Avoids the problem of a bunch of blank lines showing up.
      puts

      puts "Backtrace:"
      puts
    end

    private
    def realign(lines, error_line)
      prefix_length = lines.length.to_s.length

      lines.each_with_index.map do |line, i|
        prefix = i == error_line ? '> ' : '  '

        "#{prefix}#{line}"
      end
    end
  end
end

begin
  require caller.last.split(':').first
  exit
rescue SystemExit
  raise
rescue Exception => e
  PrettyBacktrace.print(e)

  raise
end

