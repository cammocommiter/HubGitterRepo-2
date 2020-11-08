require 'time'
s = "11/23/10 23:29:57"
Time.parse(s) # => Tue Nov 23 23:29:57 -0800 2010
s += " UTC"
Time.parse(s) # => Tue Nov 23 23:29:57 UTC 2010

https://www.example.com:443/path/