require 'nokogiri';
require 'open-uri'

url = "http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml"
xml_file = open(url).read
# file = File.open()
doc = Nokogiri::XML(xml_file)

lines = Hash.new

doc.search('//SPEECH').each do |speech|
  name = speech.at('SPEAKER').text
  lines[name] = 0 if lines[name].nil?
  line_count = speech.xpath('LINE').count
  lines[name] += line_count
  # name = speech.xpath('speaker').text.strip
  # p name
  # line = speech.xpath('line')
  # origin = speech.xpath('origin').text
  # puts "#{name}, a #{line.count}"
end
lines.delete('ALL')
lines.each do |speaker|
  puts "#{speaker[1]} #{speaker[0]}"
end
