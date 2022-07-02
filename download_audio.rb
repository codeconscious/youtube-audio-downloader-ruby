def download_audio(args)
    success_count = 0
    failure_count = 0

    # Download audio for each valid ID.
    args.each do |arg|
        id = arg[/^[\w|-]{11}$|(?<=v=|v\\=)[\w|-]{11}|(?<=youtu\.be\/).{11}/]
        if id
            puts "■ Processing ID " + id
            $command = "yt-dlp --extract-audio --audio-format mp3 --audio-quality 0 --split-chapters https://www.youtube.com/watch?v=#{id}"
            puts "Command: " + $command
            was_success = system $command # Runs the command, piping in its output too.
            if was_success == true
                success_count += 1
            else
                failure_count += 1
            end
        else
            puts "■ ERROR: A valid ID could not be parsed from '#{arg}'."
            failure_count += 1
        end
    end

    # Print the results.
    success_label = success_count == 1 ? "success" : "successes"
    failure_label = failure_count == 1 ? "failure" : "failures"
    puts "Done with #{success_count} #{success_label} and #{failure_count} #{failure_label}."

    return success_count > 0
end
