require 'fileutils'

def move(extension, target_directory_file)
    # Move the downloaded file(s), if possible.
    if File.exist?(target_directory_file)
        path = File.read(target_directory_file).chomp
        if Dir.exist?(path)
            print "Will move all #{extension.upcase} files to path '#{path}'... "
            FileUtils.mv Dir.glob('*.' + extension), path
            puts "Done!"
        else
            puts "ERROR: Path '#{path}' not found."
        end
    else
        puts "No files moved."
    end
end
