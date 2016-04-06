#!/usr/bin/env ruby

puts "Foobar"
r = 2.0
rs = [
# 32.0,
#  16.0, 
  8.0, 
  4.0, 
  2.0, 
  1.0, 
#  0.5,
#  0.25,
#  0.125,
  ]
rn = rs.length
values = []
prev = 1023
(1 << rn).times do |i|
  a = 0.0
  b = 0.0
  j = i
  rn.times do |ri|
    bit = (j & (1 << ri)) >> ri
    if bit == 1
      a += 1.0 / rs[ri]
    else
      b += rs[ri]
    end
  end
  if (a > 0)
    rt = 1.0 / a
    val = (rt / ( r + rt ) * 1023).round
  else
    val = 1023
  end
  vab = (b/(b+r)*1023).round
  values.push vab
  puts "%8b %010b %4i %3i %010b %i"%[i,val,val,prev - val, vab, vab ]
  prev = val
end

values.sort!
puts values.join(' ')
prev = 0
values.each do |v|
  print v - prev
  prev = v
  print " "
end

