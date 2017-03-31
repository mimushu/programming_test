require 'csv'
require 'pp'

file_name = Subscription_Event_86335385_20170222.txt
CSV.foreach(file_name, :col_sep => "\t") do |row|
  pp row
end
