begin
  require caller.last.split(':').first
  exit
rescue SystemExit
  raise
rescue Exception => e
  context = 3

  file, line = e.backtrace.first.split(':')
  line = line.to_i - 1
  code = File.open(file).read.split("\n")

  puts
  puts "~~~~~~~~~~~~~~~~"
  puts
  puts "The bolded code raised a#{['a', 'e', 'i', 'o', 'u'].include?(e.class.to_s[-1]) ? 'n' : ''} #{e.class}:"
  puts

  ret = [
          *code[(line - context), context],
          "\e[1m#{code[line]}\e[22m",
          *code[(line + 1), context]
        ].join("\n")

  puts ret.rstrip # Avoids the problem of a bunch of blank lines showing up.
  puts

  puts "Backtrace:"
  puts

  raise
end

