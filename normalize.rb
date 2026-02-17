users = [
  { id: "1", name: "Alice" },
  { id: 2,   name: "Bob" }
]

events = [
  { user_id: 1, type: "click" },
  { user_id: "1", type: "view" },
  { user_id: 2, type: "click" }
]


def merge_users(users, events)
  normalized_users = users.map do |user|
    user.merge(id: user[:id].to_i)
  end

  normalized_events = events.map do |event|
    event.merge(user_id: event[:user_id].to_i)
  end

  events_by_user = normalized_events.each_with_object(Hash.new{|h,k| h[k] = []}) do |event, hash|
    hash[event[:user_id]] << event[:type]
  end

  normalized_users.map do |user|
    user.merge(events: events_by_user[user[:id]])
  end
end


pp merge_users(users, events)
