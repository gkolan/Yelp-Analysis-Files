require 'rubygems'
require 'json/pure'
require 'geocoder'
require 'easystats'

#get the complete list
total_businesses = []
File.open("yelp_academic_dataset_business.json", "r") do |infile|
	while (line = infile.gets)
        parsed = JSON.parse(line)
        total_businesses << parsed['categories']
    end
end
total_categories = total_businesses.flatten!

count = 1   #count to console. Save me from curiosity!

File.open("business_simple_category_all_list_may26_full.csv", 'a') do |f|
File.open("yelp_academic_dataset_business.json", "r") do |infile|
    while (line = infile.gets)
        parsed = JSON.parse(line)
        #{"business_id": "rncjoVoEFUJGCUoC1JgnUA", "full_address": "8466 W Peoria Ave\nSte 6\nPeoria, AZ 85345", "open": true, "categories": ["Accountants", "Professional Services", "Tax Services", "Financial Services"], "city": "Peoria", "review_count": 3, "name": "Peoria Income Tax Service", "neighborhoods": [], "longitude": -112.241596, "state": "AZ", "stars": 5.0, "latitude": 33.581867000000003, "type": "business"}
        
        business_id = parsed['business_id']
        open = parsed['open']
        stars = parsed['stars']
        review_count = parsed['review_count']
        city = parsed['city']
            categories = parsed['categories']
        category = categories.max_by{|c| total_categories.count(c)}
        category = category.to_s.gsub(/[^0-9a-z ]/i, '')

        f.write("#{business_id}, #{open}, #{category}, #{stars}, #{review_count}\n")
        puts count
        count = count + 1
    end
end
end

