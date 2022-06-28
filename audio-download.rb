if ARGV.length == 0
    puts "ERROR: No IDs supplied."
    return
end

# Download audio for each argument.
ARGV.each do |a|
    if a.length == 11
        puts "■ Processing ID " + a
        $command = "yt-dlp --extract-audio --audio-format mp3 --audio-quality 0 --split-chapters https://www.youtube.com/watch?v=#{a}"
        puts "Command: " + $command
        system $command # Runs the command, piping in its output too.
    else
        puts "■ ERROR: #{a} is not a valid source ID."
    end
end

puts "Downloads (hopefully) complete."
