require 'rubygems'
require 'json/pure'

answers = [
    {"val"=>["6"], "comment"=>["super"], "qid"=>["2"]},
    {"val"=>["3"], "comment"=>[""], "qid"=>["1"]},
    {"val"=>["7"], "comment"=>[""], "qid"=>["4"]},
    {"val"=>["5", "6"], "comment"=>["supera", "hmm"], "qid"=>["1", "2"]},
    {"val"=>["5", "9"], "comment"=>["super", "asdf"], "qid"=>["1", "5"]}
]

result_comment = answers.map{|i| i['qid']}.flatten.group_by{|i| i}.map{|i,j| [i,j.length]}

print result_comment
puts


