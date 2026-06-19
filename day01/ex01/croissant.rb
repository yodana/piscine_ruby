#!/usr/bin/ruby -w

def read_file()
    tab = []
    File.open("numbers.txt", "r") do |file|
        file.each_line do |line|
            elem = line.delete(",")
            tab = tab + [elem.to_i]
        end
    end
    puts tab.sort
end

read_file