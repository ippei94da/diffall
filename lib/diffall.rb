#! /usr/bin/env ruby
# coding: utf-8

#
#
#
class DiffAll
  HASH_COMMAND = 'sha256sum'

  attr_reader :hashtags

  #
  def initialize(files)
    @hashtags = {}
    files.each do |file|
      command = "#{HASH_COMMAND} #{file.escape_zsh}"
      str = `#{command}` #.sub("  #{file}", '')
      add str
      #hash_groups[hash] ||= []
      #hash_groups[hash] << file
    end
  end

  #
  def self.read_io(io)
    result = self.class.new
    #io.readlines.each do |line|
    io.each_line do |line|
      result.add line
    end
    result
  end

  #Add {filename => hashtag } to @hashtags.
  #E.g.,
  # "4355a46b19d348dc2f57c046f8ef63d4538ebb936000f3c9ee954a27460dd865  file1"

  def add(line)
    hashtag  = str[0..63]
    filename = str[66..-1]
    @hashtags[filename] = hashtag
  end

  def show(options, io = $stdout)
    @hashtags.each do |key, files|
      next if files.size < 2
      unless OPTIONS[:filename]
        puts
        puts key
      end
      num = files.size
      num = num - 1 if OPTIONS[:last_hide]
      num.times do |i|
        indent = "  "
        indent = "" if OPTIONS[:filename]
        puts indent + files[i]
      end
    end
  end

end

