>> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12].each_slice(4) {|a| p a}
[1, 2, 3, 4]
[5, 6, 7, 8]
[9, 10, 11, 12]

GoogleChart::PieChart.new('320x200', "Things I Like To Eat", false) do |pc| 
  pc.data "Broccoli", 30
  pc.data "Pizza", 20
  pc.data "PB&J", 40 
  pc.data "Turnips", 10 
  puts pc.to_url 
end
