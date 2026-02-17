logs = [
  { level: "warn",  user: 12, msg: "rate limit" },
  { level: "info",  user: 12, msg: "ok" },
  { level: "error", user: 9,  msg: "oops" },
  { level: "error", user: 10,  msg: "oops" },
  { level: "error", user: 8,  msg: nil }
]

# def transform(logs)
#   logs.group_by{|log| log[:level]}
#   .transform_values do |group| 
#     {
#       users: group.map {|item| item[:user]}.uniq,
#       count: group.count
#     }
    
#   end
# end

# def transform(logs)
#   logs.group_by{|ele| ele[:user]}
#   .transform_values do |group|
#     group.map{|item| item[:msg]}.sort
#   end
# end

def transform(logs)
  logs
  .group_by{|ele| ele[:user]}
  .transform_values do |group|
    nested = Hash.new {|h, k| h[k] = []}
    group.each do |item|
      nested[item[:level]] << item[:msg] if item[:msg]
    end
    nested
  end
end

pp transform(logs)