require 'fileutils'

# TODO: Add error handling for IO operations.
def move(extension, target_directory_file)
    if File.exist?(target_directory_file)
        path = File.read(target_directory_file).chomp
        if Dir.exist?(path)
            file_count = Dir.glob('*.' + extension).count
            if (file_count == 0)
                puts "No #{extension.upcase} files to move were found. (Was there a download error?)"
                return
            end
            print "Will move #{file_count} #{extension.upcase} files to path '#{path}'... "
            FileUtils.mv Dir.glob('*.' + extension), path
            puts "done!"
        else
            puts "Path '#{path}' was not found, so no files were moved."
        end
    else
        puts "No files were moved because the file '#{target_directory_file}' was not found."
    end
end
