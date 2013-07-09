require 'rubygems'
require 'csv'
require 'json/pure'
require 'simple_stats'

count = 0
File.open("yelp_academic_dataset_review_minus_text.csv", 'a') do |f|
File.open("yelp_academic_dataset_review.json", "r") do |infile|
    while (line = infile.gets)
    	parsed2 = JSON.parse(line)
        parsed_reviewid = parsed2["review_id"]
        parsed_userid = parsed2["user_id"]
        parsed_business_id = parsed2["business_id"]
        
        parsed_funny = parsed2["votes"]["funny"]
    	parsed_useful = parsed2["votes"]["useful"]
    	parsed_cool = parsed2["votes"]["cool"]
    	
        parsed_stars = parsed2["stars"]
        parsed_text = parsed2["text"].gsub(/[^0-9A-Za-z]/, ' ')
        parsed_text = parsed_text.gsub /(?<!\n)\n(?!\n)/, ' '
        parsed_date = parsed2["date"]
        parsed_type = parsed2["type"]

        f.write("#{parsed_reviewid}, #{parsed_userid}, #{parsed_business_id}, #{parsed_date}, #{parsed_type}, #{parsed_stars}, #{parsed_funny}, #{parsed_useful}, #{parsed_cool}\n")
        puts count
        count = count+1
        end
    end
end



