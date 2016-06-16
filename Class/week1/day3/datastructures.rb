hash = {:wat =>["something", "something", {:wut=>["something", [[0, 1, 2, 3, 4, 5, 6, 7, 8, {:bbq => "Yummy!"}],"something"]]}]}

arr = [[0, 1, 2, 3, 4, {:secret => {:unlock => [0, 1, 2]}}], "something"]

puts hash[:wat][2][:wut][1][0][9][:bbq]

puts arr[0][5][:secret][:unlock][1]
