require 'fileutils'

def move(extension, target_directory_file)
    if File.exist?(target_directory_file)
        path = File.read(target_directory_file).chomp
        if Dir.exist?(path)
            print "Will move all #{extension.upcase} files to path '#{path}'... "
            FileUtils.mv Dir.glob('*.' + extension), path
            puts "done!"
        else
            puts "ERROR: Path '#{path}' not found, so no files moved."
        end
    else
        puts "No files moved."
    end
end
