events = [
  { user_id: 1, action: "click", ts: "2026-02-16T10:00:00Z" },
  { user_id: 1, action: "view",  ts: "2026-02-16T10:05:00Z" },
  { user_id: 2, action: "click", ts: "2026-02-16T09:00:00Z" },
  { user_id: 1, action: "click", ts: "2026-02-16T10:10:00Z" },
  { user_id: 2, action: "view",  ts: "2026-02-16T11:00:00Z" }
]

def summarize_events(events)
  events.group_by{|ele| ele[:user_id]}
  .each_with_object({}) do |(user_id, events), result|
    result[user_id] = {
      counts: events.group_by {|ele| ele[:action]}
    .transform_values(&:count),
    latest_ts: events.map{|ele| ele[:ts]}.max
    } 
    
  end
end

# pp summarize_events(events)

enu1 = [10, 17, 9, 10, 100, 34]
pp enu1.max(3)