if ARGV.length == 0
    puts "ERROR: No IDs supplied."
    return
end

# Download audio for each valid argument.
ARGV.each do |arg|
    if arg =~ /^[\w|-]{11}$|(?<=v=)[\w|-]{11}|(?<=youtu\.be\/).{11}/
        puts "■ Processing ID " + arg
        $command = "yt-dlp --extract-audio --audio-format mp3 --audio-quality 0 --split-chapters https://www.youtube.com/watch?v=#{arg}"
        puts "Command: " + $command
        system $command # Runs the command, piping in its output too.
    else
        puts "■ ERROR: #{arg} is not a valid source ID"
    end
end

puts "Downloading complete"
