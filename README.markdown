ruby-backtrace-code-finder
==========================

Needs a better name. On all exceptions, prints a message explaining what code caused said exception.

```
$ ./test.rb
7
8
/home/marie/dev/ruby/duckinator/ruby-backtrace-code-finder/test.rb:9:in `x'

    def x
      p 7
      p 8
>     boom
      p 10
      p 11
    end

Backtrace:

/home/marie/dev/ruby/duckinator/ruby-backtrace-code-finder/test.rb:9:in `x': undefined local variable or method `boom' for #<Meep:0x007f011c3d90b8> (NameError)
        from /home/marie/dev/ruby/duckinator/ruby-backtrace-code-finder/test.rb:15:in `<top (required)>'
        from /home/marie/.rubies/ruby-2.1.3/lib/ruby/2.1.0/rubygems/core_ext/kernel_require.rb:55:in `require'
        from /home/marie/.rubies/ruby-2.1.3/lib/ruby/2.1.0/rubygems/core_ext/kernel_require.rb:55:in `require'
        from /home/marie/dev/ruby/duckinator/ruby-backtrace-code-finder/backtrace-code-finder.rb:37:in `<top (required)>'
        from /home/marie/.rubies/ruby-2.1.3/lib/ruby/2.1.0/rubygems/core_ext/kernel_require.rb:55:in `require'
        from /home/marie/.rubies/ruby-2.1.3/lib/ruby/2.1.0/rubygems/core_ext/kernel_require.rb:55:in `require'
        from ./test.rb:3:in `<main>'
$
```

