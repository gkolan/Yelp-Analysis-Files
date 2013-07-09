require 'rubygems'
require 'json/pure'

#total = [["a", 5], ["b",7], ["c",17], ["d",12], ["e",11], ["d",111], ["e",1], ["f",12], ["g",7], ["h",18]]
total = ["a","a","a","b","b","b","b","b","b","b","b","c","c","c","d","d","d","d","d","d","d","d","b","b","e","e","e","e","e","f"]
#smart_total = total.group_by{|i| i}.map{|i,j| [i,j.length]}
smart_total = [["a", 3], ["b", 10], ["c", 3], ["d", 8], ["e", 5], ["f", 1]]

sample1 = ["a","f"]

#result_comment = answers.map{|i| i['qid']}.flatten.group_by{|i| i}.map{|i,j| [i,j.length]}

#print result_comment
print sample1.max_by{|c| total.count(c)}
puts


