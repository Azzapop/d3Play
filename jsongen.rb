require 'rubygems'
require 'roo'
require 'json'

sheet = Roo::Spreadsheet.open("Report_5558.xlsx").sheet(0)

c2 = sheet.c2
d2 = sheet.d2
e2 = sheet.e2

hash = {}
hash["name"] = "that name"
hash[c2] = []
hash[d2] = []
hash[e2] = []
(4..29).each do |i|
  hash[c2] << {"name" => sheet.cell('A', i), "size" => sheet.cell('C', i)}
  hash[d2] << {"name" => sheet.cell('A', i), "size" => sheet.cell('D', i)}
  hash[e2] << {"name" => sheet.cell('A', i), "size" => sheet.cell('E', i)}
end

file = File.open("data.json", 'w')
file.write(JSON.pretty_generate(hash))
