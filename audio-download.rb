$videoId = "5B1rB894B1U" # Tiny test video

$command = "yt-dlp --extract-audio --audio-format mp3 --audio-quality 0 --split-chapters https://www.youtube.com/watch?v=#{$videoId}"
puts $command
system $command # Runs the command, showing its output.

puts "Download (hopefully) complete."
