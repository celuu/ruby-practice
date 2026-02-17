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
  users.map do |user|
    user.merge(id: user[:id].to_i)
  end

  events.map do |event|
    event.merge(id: event[:user_id].to_i)
  end
  

end


pp merge_users(users, events)
