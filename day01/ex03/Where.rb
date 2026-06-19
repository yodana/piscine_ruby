#!/usr/bin/ruby -w

def read_state
    states = {
    "Oregon" => "OR",
    "Alabama" => "AL",
    "New Jersey" => "NJ",
    "Colorado" => "CO"
    }
    capitals_cities = {
    "OR" => "Salem",
    "AL" => "Montgomery",
    "NJ" => "Trenton",
    "CO" => "Denver"
    }
    if ARGV.length != 1
        return
    end
    state = states[ARGV[0]]
    if state == nil
        puts "Unknown state"
        return
    end
    puts capitals_cities[state]
end

read_state