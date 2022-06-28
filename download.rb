if ARGV.length == 0
    puts "ERROR: No IDs supplied."
    return
end

# Download audio for each valid argument.
ARGV.each do |rawArg|
    id = rawArg[/^[\w|-]{11}$|(?<=v=|v\\=)[\w|-]{11}|(?<=youtu\.be\/).{11}/]
    if id
        puts "■ Processing ID " + id
        $command = "yt-dlp --extract-audio --audio-format mp3 --audio-quality 0 --split-chapters https://www.youtube.com/watch?v=#{id}"
        puts "Command: " + $command
        system $command # Runs the command, piping in its output too.
    else
        puts "■ ERROR: A valid ID could not be parsed from '#{rawArg}'"
    end
end

puts "Downloading complete"
