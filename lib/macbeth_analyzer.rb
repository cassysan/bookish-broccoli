require 'nokogiri';
require 'open-uri'

url = "http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml"
xml_file = open(url).read
# file = File.open()
doc = Nokogiri::XML(xml_file)



doc.search('//SPEECH').each do |speech|
  name = speech.at('SPEAKER').text
  puts "name = #{name}"
  # name = speech.xpath('speaker').text.strip
  # p name
  # line = speech.xpath('line')
  # origin = speech.xpath('origin').text
  # puts "#{name}, a #{line.count}"
end


