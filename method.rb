logs = [
  { user: 12, level: "warn",  msg: "rate limit" },
  { user: 12, level: "info",  msg: "ok" },
  { user: 9,  level: "error", msg: "oops" },
  { user: 12, level: "warn",  msg: nil }
]

def summarize(logs)
  logs
  .group_by{|ele| ele[:user]}
  .transform_values do |group|
    by_level = group.group_by{|ele| ele[:level]}.transform_values do |level|
      level.count
    end
    
    {
      total: group.count,
      by_level: by_level,
      messages: group.map{|item| item[:msg]}.compact.sort
    }
  end
end

pp summarize(logs)