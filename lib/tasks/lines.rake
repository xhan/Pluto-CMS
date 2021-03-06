desc "Count Lines on Project"
task :lines => :environment do
  CheckLines.new(Rails.root.to_s)
end

##
##  this is design for calculate the totals line of code in your project
##  version 1 @october 8th,2008 
##
 

module Enumerable
  # function to get total lines for file
  def total_lines
    lines = 0
    each_with_index {|content,lines|}
    return lines+1
  end
end


class CheckLines
  require 'find'

  CheckType = %w{txt rb erb yml html css xml js}.freeze
 
  def initialize(directory)
    @total_lines = 0
    if  File.directory?(directory)
          @directory = directory 
          @contents = {}
          @content_type ={}
          CheckType.each {|ext| @content_type[ext.to_sym]=0}
          self.go
    else puts "#{directory} is not a directory! check it out!" and return
    end
  end
  
  def go
    if @directory
      Find.find @directory do |path|
        pathlite = path.gsub(@directory,'')
        if File.file?(path)  && is_check_file(path)
          File.open path do |f|
              tmp_line = f.total_lines  
             @contents.store(pathlite,tmp_line)
             @content_type[(path.sub(/.*\./,'').to_sym)] += tmp_line
             @total_lines += tmp_line
          end
        end
      end
      puts "Total Code Lines:#{@total_lines}"
      puts "Total Files #{@contents.keys.size}"
      @content_type.each_pair {|key,value| puts "#{key} : #{value}"}
    end
  end
  
  def is_check_file file_name
    CheckType.any? do |ext|
      !file_name.scan(/\.#{ext}$/).empty?
    end
  end                        
  
  def details
    @contents.each do |key,value|
      puts "#{key} file has lines of #{value}"
    end
  end
end

# s=CheckLines.new("/Users/xhan/Codes/plutocms")