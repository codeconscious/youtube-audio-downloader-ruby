require './download_audio.rb'
require './move_files.rb'

if ARGV.length == 0
    puts "Please supply one or more video URLs or IDs to use this tool."
    puts "(Depending on your OS, you might need to enclose URLs in quotation marks.)"
    return
end

# Download the audio to local files.
was_success = download_audio(ARGV)

# Move saved files to a directory in a text file.
if (was_success)
    move_files("mp3", "target_directory.txt")
end

puts "All operations complete."
