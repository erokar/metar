require "metar"

raport = Metar::Station.find_by_cccc('ENVA')

airports = Metar::Station.find_all_by_country('Norway')

puts raport.report.to_s

#p airports.to_s

