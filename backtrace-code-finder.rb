begin
  require caller.last.split(':').first
rescue => e
  context = 3

  file, line = e.backtrace.first.split(':')
  line = line.to_i - 1
  code = File.open(file).read.split("\n")

  puts "Code (~ indicates the line triggering the exception):"
  puts

  ret = "    #{code[(line - context), context].join("\n    ")}\n" +
        "~   #{code[line]}\n" +
        "    #{code[(line + 1), context].join("\n    ")}"

  puts ret.rstrip # Avoids the problem of a bunch of blank lines showing up.

  puts
  puts "#{e.class.name}: #{e.message}"
  puts e.backtrace
end

