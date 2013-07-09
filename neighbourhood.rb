require 'rubygems'
require 'json/pure'
require 'geocoder'
require 'easystats'

#get the complete list
total_businesses = []
File.open("yelp_academic_dataset_business.json", "r") do |infile|
	while (line = infile.gets)
        parsed = JSON.parse(line)
        total_businesses << parsed
    end
end

count = 1   #count to console. Save me from curiosity!

File.open("business_full_neighbourhood_full_smart.csv", 'a') do |f|
File.open("yelp_academic_dataset_business.json", "r") do |infile|
	while (line = infile.gets)
        parsed = JSON.parse(line)
        
        business_id = parsed['business_id']
        stars = parsed['stars']
        review_count = parsed['review_count']
        latitude = parsed['latitude']
        longitude = parsed['longitude']
        city = parsed['city']
        categories = parsed['categories']
        open = parsed['open']
        
        parsed_coordinates = [parsed['latitude'],parsed['longitude']]

        neighbourhood_in_dime_mile =  total_businesses.select{ |i| Geocoder::Calculations.distance_between(parsed_coordinates,[i['latitude'],parsed['longitude']]) < 0.1 }
        
        neighbourhood_in_quarter_mile =  total_businesses.select{ |i| Geocoder::Calculations.distance_between(parsed_coordinates,[i['latitude'],parsed['longitude']]) < 0.25 }

        neighbourhood_in_half_mile =  total_businesses.select{ |i| Geocoder::Calculations.distance_between(parsed_coordinates,[i['latitude'],parsed['longitude']]) < 0.5 }

        neighbourhood_in_three_quarter_mile =  total_businesses.select{ |i| Geocoder::Calculations.distance_between(parsed_coordinates,[i['latitude'],parsed['longitude']]) < 0.75 }

        neighbourhood_in_one_mile =  total_businesses.select{ |i| Geocoder::Calculations.distance_between(parsed_coordinates,[i['latitude'],parsed['longitude']]) < 1 }

        neighbourhood_in_two_mile =  total_businesses.select{ |i| Geocoder::Calculations.distance_between(parsed_coordinates,[i['latitude'],parsed['longitude']]) < 2.5 }

        neighbourhood_in_five_mile =  total_businesses.select{ |i| Geocoder::Calculations.distance_between(parsed_coordinates,[i['latitude'],parsed['longitude']]) < 5 }

        neighbourhood_in_ten_mile =  total_businesses.select{ |i| Geocoder::Calculations.distance_between(parsed_coordinates,[i['latitude'],parsed['longitude']]) < 10 }
        

        neighbourhood_in_dime_mile_stars = neighbourhood_in_dime_mile.map{|i| i['stars']}
        
        n01m_s_size = neighbourhood_in_dime_mile_stars.size
        n01m_s_avg = neighbourhood_in_dime_mile_stars.average
        n01m_s_median = neighbourhood_in_dime_mile_stars.median
        n01m_s_std_dev = neighbourhood_in_dime_mile_stars.standard_deviation
        n01m_s_wgt_mv_avg = neighbourhood_in_dime_mile_stars.weighted_moving_average

        # n01m_s_size, n01m_s_avg, n01m_s_median, n01m_s_std_dev, n01m_s_wgt_mv_avg
        
        neighbourhood_in_dime_mile_review_count = neighbourhood_in_dime_mile.map{|i| i['review_count']}
        
        n01m_rc_size = neighbourhood_in_dime_mile_review_count.size
        n01m_rc_avg = neighbourhood_in_dime_mile_review_count.average
        n01m_rc_median = neighbourhood_in_dime_mile_review_count.median
        n01m_rc_std_dev = neighbourhood_in_dime_mile_review_count.standard_deviation
        n01m_rc_wgt_mv_avg = neighbourhood_in_dime_mile_review_count.weighted_moving_average

        # n01m_rc_size, n01m_rc_avg, n01m_rc_median, n01m_rc_std_dev, n01m_rc_wgt_mv_avg
        
        neighbourhood_in_quarter_mile_stars = neighbourhood_in_quarter_mile.map{|i| i['stars']}
        
        n025m_s_size = neighbourhood_in_quarter_mile_stars.size
        n025m_s_avg = neighbourhood_in_quarter_mile_stars.average
        n025m_s_median = neighbourhood_in_quarter_mile_stars.median
        n025m_s_std_dev = neighbourhood_in_quarter_mile_stars.standard_deviation
        n025m_s_wgt_mv_avg = neighbourhood_in_quarter_mile_stars.weighted_moving_average

        # n025m_s_size, n025m_s_avg, n025m_s_median, n025m_s_std_dev, n025m_s_wgt_mv_avg
        
        neighbourhood_in_quarter_mile_review_count = neighbourhood_in_quarter_mile.map{|i| i['review_count']}

        n025m_rc_size = neighbourhood_in_quarter_mile_review_count.size
        n025m_rc_avg = neighbourhood_in_quarter_mile_review_count.average
        n025m_rc_median = neighbourhood_in_quarter_mile_review_count.median
        n025m_rc_std_dev = neighbourhood_in_quarter_mile_review_count.standard_deviation
        n025m_rc_wgt_mv_avg = neighbourhood_in_quarter_mile_review_count.weighted_moving_average

        # n025m_rc_size, n025m_rc_avg, n025m_rc_median, n025m_rc_std_dev, n025m_rc_wgt_mv_avg
        
        neighbourhood_in_half_mile_stars = neighbourhood_in_half_mile.map{|i| i['stars']}
        
        n05m_s_size = neighbourhood_in_half_mile_stars.size
        n05m_s_avg = neighbourhood_in_half_mile_stars.average
        n05m_s_median = neighbourhood_in_half_mile_stars.median
        n05m_s_std_dev = neighbourhood_in_half_mile_stars.standard_deviation
        n05m_s_wgt_mv_avg = neighbourhood_in_half_mile_stars.weighted_moving_average

        # n05m_s_size, n05m_s_avg, n05m_s_median, n05m_s_std_dev, n05m_s_wgt_mv_avg
        
        neighbourhood_in_half_mile_review_count = neighbourhood_in_half_mile.map{|i| i['review_count']}

        n05m_rc_size = neighbourhood_in_half_mile_review_count.size
        n05m_rc_avg = neighbourhood_in_half_mile_review_count.average
        n05m_rc_median = neighbourhood_in_half_mile_review_count.median
        n05m_rc_std_dev = neighbourhood_in_half_mile_review_count.standard_deviation
        n05m_rc_wgt_mv_avg = neighbourhood_in_half_mile_review_count.weighted_moving_average

        # n05m_rc_size, n05m_rc_avg, n05m_rc_median, n05m_rc_std_dev, n05m_rc_wgt_mv_avg
        
        neighbourhood_in_three_quarter_mile_stars = neighbourhood_in_three_quarter_mile.map{|i| i['stars']}
        
        n075m_s_size = neighbourhood_in_three_quarter_mile_stars.size
        n075m_s_avg = neighbourhood_in_three_quarter_mile_stars.average
        n075m_s_median = neighbourhood_in_three_quarter_mile_stars.median
        n075m_s_std_dev = neighbourhood_in_three_quarter_mile_stars.standard_deviation
        n075m_s_wgt_mv_avg = neighbourhood_in_three_quarter_mile_stars.weighted_moving_average

        # n75m_s_size, n75m_s_avg, n75m_s_median, n75m_s_std_dev, n75m_s_wgt_mv_avg
        
        neighbourhood_in_three_quarter_mile_review_count = neighbourhood_in_three_quarter_mile.map{|i| i['review_count']}

        n075m_rc_size = neighbourhood_in_three_quarter_mile_review_count.size
        n075m_rc_avg = neighbourhood_in_three_quarter_mile_review_count.average
        n075m_rc_median = neighbourhood_in_three_quarter_mile_review_count.median
        n075m_rc_std_dev = neighbourhood_in_three_quarter_mile_review_count.standard_deviation
        n075m_rc_wgt_mv_avg = neighbourhood_in_three_quarter_mile_review_count.weighted_moving_average

        # n75m_rc_size, n75m_rc_avg, n75m_rc_median, n75m_rc_std_dev, n75m_rc_wgt_mv_avg
        
        neighbourhood_in_one_mile_stars = neighbourhood_in_one_mile.map{|i| i['stars']}
        
        n1m_s_size = neighbourhood_in_one_mile_stars.size
        n1m_s_avg = neighbourhood_in_one_mile_stars.average
        n1m_s_median = neighbourhood_in_one_mile_stars.median
        n1m_s_std_dev = neighbourhood_in_one_mile_stars.standard_deviation
        n1m_s_wgt_mv_avg = neighbourhood_in_one_mile_stars.weighted_moving_average

        # n1m_s_size, n1m_s_avg, n1m_s_median, n1m_s_std_dev, n1m_s_wgt_mv_avg

        neighbourhood_in_one_mile_review_count = neighbourhood_in_one_mile.map{|i| i['review_count']}

        n1m_rc_size = neighbourhood_in_one_mile_review_count.size
        n1m_rc_avg = neighbourhood_in_one_mile_review_count.average
        n1m_rc_median = neighbourhood_in_one_mile_review_count.median
        n1m_rc_std_dev = neighbourhood_in_one_mile_review_count.standard_deviation
        n1m_rc_wgt_mv_avg = neighbourhood_in_one_mile_review_count.weighted_moving_average

        # n1m_rc_size, n1m_rc_avg, n1m_rc_median, n1m_rc_std_dev, n1m_rc_wgt_mv_avg
        
        neighbourhood_in_two_mile_stars = neighbourhood_in_two_mile.map{|i| i['stars']}
        
        n2m_s_size = neighbourhood_in_two_mile_stars.size
        n2m_s_avg = neighbourhood_in_two_mile_stars.average
        n2m_s_median = neighbourhood_in_two_mile_stars.median
        n2m_s_std_dev = neighbourhood_in_two_mile_stars.standard_deviation
        n2m_s_wgt_mv_avg = neighbourhood_in_two_mile_stars.weighted_moving_average

        # n2m_s_size, n2m_s_avg, n2m_s_median, n2m_s_std_dev, n2m_s_wgt_mv_avg

        neighbourhood_in_two_mile_review_count = neighbourhood_in_two_mile.map{|i| i['review_count']}

        n2m_rc_size = neighbourhood_in_two_mile_review_count.size
        n2m_rc_avg = neighbourhood_in_two_mile_review_count.average
        n2m_rc_median = neighbourhood_in_two_mile_review_count.median
        n2m_rc_std_dev = neighbourhood_in_two_mile_review_count.standard_deviation
        n2m_rc_wgt_mv_avg = neighbourhood_in_two_mile_review_count.weighted_moving_average

        # n2m_rc_size, n2m_rc_avg, n2m_rc_median, n2m_rc_std_dev, n2m_rc_wgt_mv_avg
        
        neighbourhood_in_five_mile_stars = neighbourhood_in_five_mile.map{|i| i['stars']}
        
        n5m_s_size = neighbourhood_in_five_mile_stars.size
        n5m_s_avg = neighbourhood_in_five_mile_stars.average
        n5m_s_median = neighbourhood_in_five_mile_stars.median
        n5m_s_std_dev = neighbourhood_in_five_mile_stars.standard_deviation
        n5m_s_wgt_mv_avg = neighbourhood_in_five_mile_stars.weighted_moving_average

        # n5m_s_size, n5m_s_avg, n5m_s_median, n5m_s_std_dev, n5m_s_wgt_mv_avg
        
        neighbourhood_in_five_mile_review_count = neighbourhood_in_five_mile.map{|i| i['review_count']}

        n5m_rc_size = neighbourhood_in_five_mile_review_count.size
        n5m_rc_avg = neighbourhood_in_five_mile_review_count.average
        n5m_rc_median = neighbourhood_in_five_mile_review_count.median
        n5m_rc_std_dev = neighbourhood_in_five_mile_review_count.standard_deviation
        n5m_rc_wgt_mv_avg = neighbourhood_in_five_mile_review_count.weighted_moving_average

        # n5m_rc_size, n5m_rc_avg, n5m_rc_median, n5m_rc_std_dev, n5m_rc_wgt_mv_avg
        
        neighbourhood_in_ten_mile_stars = neighbourhood_in_ten_mile.map{|i| i['stars']}
        
        n10m_s_size = neighbourhood_in_ten_mile_stars.size
        n10m_s_avg = neighbourhood_in_ten_mile_stars.average
        n10m_s_median = neighbourhood_in_ten_mile_stars.median
        n10m_s_std_dev = neighbourhood_in_ten_mile_stars.standard_deviation
        n10m_s_wgt_mv_avg = neighbourhood_in_ten_mile_stars.weighted_moving_average
        
        # n10m_s_size, n10m_s_avg, n10m_s_median, n10m_s_std_dev, n10m_s_wgt_mv_avg
        
        neighbourhood_in_ten_mile_review_count = neighbourhood_in_ten_mile.map{|i| i['review_count']}

        n10m_rc_size = neighbourhood_in_ten_mile_review_count.size
        n10m_rc_avg = neighbourhood_in_ten_mile_review_count.average
        n10m_rc_median = neighbourhood_in_ten_mile_review_count.median
        n10m_rc_std_dev = neighbourhood_in_ten_mile_review_count.standard_deviation
        n10m_rc_wgt_mv_avg = neighbourhood_in_ten_mile_review_count.weighted_moving_average

        # n10m_rc_size, n10m_rc_avg, n10m_rc_median, n10m_rc_std_dev, n10m_rc_wgt_mv_avg
        

        # n01m_s_size, n01m_s_avg, n01m_s_median, n01m_s_std_dev, n01m_s_wgt_mv_avg, n01m_rc_size, n01m_rc_avg, n01m_rc_median, n01m_rc_std_dev, n01m_rc_wgt_mv_avg, n025m_s_size, n025m_s_avg, n025m_s_median, n025m_s_std_dev, n025m_s_wgt_mv_avg, n025m_rc_size, n025m_rc_avg, n025m_rc_median, n025m_rc_std_dev, n025m_rc_wgt_mv_avg, n05m_s_size, n05m_s_avg, n05m_s_median, n05m_s_std_dev, n05m_s_wgt_mv_avg, n05m_rc_size, n05m_rc_avg, n05m_rc_median, n05m_rc_std_dev, n05m_rc_wgt_mv_avg, n75m_s_size, n75m_s_avg, n75m_s_median, n75m_s_std_dev, n75m_s_wgt_mv_avg, n75m_rc_size, n75m_rc_avg, n75m_rc_median, n75m_rc_std_dev, n75m_rc_wgt_mv_avg, n1m_s_size, n1m_s_avg, n1m_s_median, n1m_s_std_dev, n1m_s_wgt_mv_avg, n1m_rc_size, n1m_rc_avg, n1m_rc_median, n1m_rc_std_dev, n1m_rc_wgt_mv_avg, n2m_s_size, n2m_s_avg, n2m_s_median, n2m_s_std_dev, n2m_s_wgt_mv_avg, n2m_rc_size, n2m_rc_avg, n2m_rc_median, n2m_rc_std_dev, n2m_rc_wgt_mv_avg, n5m_s_size, n5m_s_avg, n5m_s_median, n5m_s_std_dev, n5m_s_wgt_mv_avg, n5m_rc_size, n5m_rc_avg, n5m_rc_median, n5m_rc_std_dev, n5m_rc_wgt_mv_avg, n10m_s_size, n10m_s_avg, n10m_s_median, n10m_s_std_dev, n10m_s_wgt_mv_avg, n10m_rc_size, n10m_rc_avg, n10m_rc_median, n10m_rc_std_dev, n10m_rc_wgt_mv_avg

        # n01m_s_size}, #{n01m_s_avg}, #{n01m_s_median}, #{n01m_s_std_dev}, #{n01m_s_wgt_mv_avg}, #{n01m_rc_size}, #{n01m_rc_avg}, #{n01m_rc_median}, #{n01m_rc_std_dev}, #{n01m_rc_wgt_mv_avg}, #{n025m_s_size}, #{n025m_s_avg}, #{n025m_s_median}, #{n025m_s_std_dev}, #{n025m_s_wgt_mv_avg}, #{n025m_rc_size}, #{n025m_rc_avg}, #{n025m_rc_median}, #{n025m_rc_std_dev}, #{n025m_rc_wgt_mv_avg}, #{n05m_s_size}, #{n05m_s_avg}, #{n05m_s_median}, #{n05m_s_std_dev}, #{n05m_s_wgt_mv_avg}, #{n05m_rc_size}, #{n05m_rc_avg}, #{n05m_rc_median}, #{n05m_rc_std_dev}, #{n05m_rc_wgt_mv_avg}, #{n75m_s_size}, #{n75m_s_avg}, #{n75m_s_median}, #{n75m_s_std_dev}, #{n75m_s_wgt_mv_avg}, #{n75m_rc_size}, #{n75m_rc_avg}, #{n75m_rc_median}, #{n75m_rc_std_dev}, #{n75m_rc_wgt_mv_avg}, #{n1m_s_size}, #{n1m_s_avg}, #{n1m_s_median}, #{n1m_s_std_dev}, #{n1m_s_wgt_mv_avg}, #{n1m_rc_size}, #{n1m_rc_avg}, #{n1m_rc_median}, #{n1m_rc_std_dev}, #{n1m_rc_wgt_mv_avg}, #{n2m_s_size}, #{n2m_s_avg}, #{n2m_s_median}, #{n2m_s_std_dev}, #{n2m_s_wgt_mv_avg}, #{n2m_rc_size}, #{n2m_rc_avg}, #{n2m_rc_median}, #{n2m_rc_std_dev}, #{n2m_rc_wgt_mv_avg}, #{n5m_s_size}, #{n5m_s_avg}, #{n5m_s_median}, #{n5m_s_std_dev}, #{n5m_s_wgt_mv_avg}, #{n5m_rc_size}, #{n5m_rc_avg}, #{n5m_rc_median}, #{n5m_rc_std_dev}, #{n5m_rc_wgt_mv_avg}, #{n10m_s_size}, #{n10m_s_avg}, #{n10m_s_median}, #{n10m_s_std_dev}, #{n10m_s_wgt_mv_avg}, #{n10m_rc_size}, #{n10m_rc_avg}, #{n10m_rc_median}, #{n10m_rc_std_dev}, #{n10m_rc_wgt_mv_avg}
        f.write("#{business_id}, #{stars}, #{review_count}, #{latitude}, #{longitude}, #{open}, #{n01m_s_size}, #{n01m_s_avg}, #{n01m_s_median}, #{n01m_s_std_dev}, #{n01m_s_wgt_mv_avg}, #{n01m_rc_size}, #{n01m_rc_avg}, #{n01m_rc_median}, #{n01m_rc_std_dev}, #{n01m_rc_wgt_mv_avg}, #{n025m_s_size}, #{n025m_s_avg}, #{n025m_s_median}, #{n025m_s_std_dev}, #{n025m_s_wgt_mv_avg}, #{n025m_rc_size}, #{n025m_rc_avg}, #{n025m_rc_median}, #{n025m_rc_std_dev}, #{n025m_rc_wgt_mv_avg}, #{n05m_s_size}, #{n05m_s_avg}, #{n05m_s_median}, #{n05m_s_std_dev}, #{n05m_s_wgt_mv_avg}, #{n05m_rc_size}, #{n05m_rc_avg}, #{n05m_rc_median}, #{n05m_rc_std_dev}, #{n05m_rc_wgt_mv_avg}, #{n075m_s_size}, #{n075m_s_avg}, #{n075m_s_median}, #{n075m_s_std_dev}, #{n075m_s_wgt_mv_avg}, #{n075m_rc_size}, #{n075m_rc_avg}, #{n075m_rc_median}, #{n075m_rc_std_dev}, #{n075m_rc_wgt_mv_avg}, #{n1m_s_size}, #{n1m_s_avg}, #{n1m_s_median}, #{n1m_s_std_dev}, #{n1m_s_wgt_mv_avg}, #{n1m_rc_size}, #{n1m_rc_avg}, #{n1m_rc_median}, #{n1m_rc_std_dev}, #{n1m_rc_wgt_mv_avg}, #{n2m_s_size}, #{n2m_s_avg}, #{n2m_s_median}, #{n2m_s_std_dev}, #{n2m_s_wgt_mv_avg}, #{n2m_rc_size}, #{n2m_rc_avg}, #{n2m_rc_median}, #{n2m_rc_std_dev}, #{n2m_rc_wgt_mv_avg}, #{n5m_s_size}, #{n5m_s_avg}, #{n5m_s_median}, #{n5m_s_std_dev}, #{n5m_s_wgt_mv_avg}, #{n5m_rc_size}, #{n5m_rc_avg}, #{n5m_rc_median}, #{n5m_rc_std_dev}, #{n5m_rc_wgt_mv_avg}, #{n10m_s_size}, #{n10m_s_avg}, #{n10m_s_median}, #{n10m_s_std_dev}, #{n10m_s_wgt_mv_avg}, #{n10m_rc_size}, #{n10m_rc_avg}, #{n10m_rc_median}, #{n10m_rc_std_dev}, #{n10m_rc_wgt_mv_avg}\n")
        puts count
        count = count + 1
    end
end
end

