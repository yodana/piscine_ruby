#!/usr/bin/ruby -w

def my_var()
    a = 10
    b = "10"
    c = nil
    d = 10.0
    # La variable Fixnum est devenu obsolete c'est Integer maintenant
    puts "a contient: #{a} et est de type #{a.class}"
    puts "b contient: #{b} et est de type #{b.class}"
    # .inspect retourne une valeur visible
    puts "c contient: #{c.inspect} et est de type #{c.class}"
    puts "d contient: #{d} et est de type #{d.class}"
end

my_var
