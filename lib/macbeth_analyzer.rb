require 'nokogiri';
require 'open-uri'

url = "http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml"
xml_file = open(url).read
doc = Nokogiri::XML(xml_file) #grab file from internet

lines = Hash.new #create a hash to store the speaker names and the # of lines

doc.search('//SPEECH').each do |speech|
  name = speech.at('SPEAKER').text
  lines[name] = 0 if lines[name].nil? #create the key and set it to 0, won't override otherwise
  line_count = speech.xpath('LINE').count #grab the number of lines per speech of character
  lines[name] += line_count #add the number back to the hash
end
lines.delete('ALL') # delete the "all" value from the hash, don't need it.
lines.each do |speaker|
  puts "#{speaker[1]} #{speaker[0]}" #push to console.
end
