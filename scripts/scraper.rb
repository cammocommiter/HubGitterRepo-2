h = {:a => 1, :b => 2.2}
h.each_with_index do |(k, v), i|
  p k, v, i
end

helper_method