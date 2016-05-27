puts "Between source1.txt and source2.txt, what is the source file?"
source_file = gets.chomp
puts "Write a name for your destination file?"
destination_file = gets.chomp

source_file_contents = IO.read(source_file)
IO.write(destination_file, source_file_contents)