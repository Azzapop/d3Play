require 'rubygems'
require 'roo'
require 'json'

sheet = Roo::Spreadsheet.open("Report_5558.xlsx").sheet(0)

hash = {}
hash["headers"] = [sheet.c2, sheet.d2, sheet.e2]

(3..146).each do |i|
  hash[sheet.cell('A', i)] = [sheet.cell('C', i), sheet.cell('D', i), sheet.cell('E', i)]
end

file = File.open("data.json", 'w')
file.write(hash.to_json)
