if ARGV.length == 0
    puts "Please supply one or more video URLs or IDs to use this tool."
    puts "(Depending on your OS, you might need to enclose URLs in quotation marks.)"
    return
end

successCount = 0
failureCount = 0

# Download audio for each valid argument.
ARGV.each do |rawArg|
    id = rawArg[/^[\w|-]{11}$|(?<=v=|v\\=)[\w|-]{11}|(?<=youtu\.be\/).{11}/]
    if id
        puts "■ Processing ID " + id
        $command = "yt-dlp --extract-audio --audio-format mp3 --audio-quality 0 --split-chapters https://www.youtube.com/watch?v=#{id}"
        puts "Command: " + $command
        wasSuccess = system $command # Runs the command, piping in its output too.
        if wasSuccess == true
            successCount += 1
        else
            failureCount += 1
        end
    else
        puts "■ ERROR: A valid ID could not be parsed from '#{rawArg}'"
        failureCount += 1
    end
end

# Print the results.
successLabel = successCount == 1 ? "success" : "successes"
failureLabel = failureCount == 1 ? "failure" : "failures"
puts "Done with #{successCount} #{successLabel} and #{failureCount} #{failureLabel}"
