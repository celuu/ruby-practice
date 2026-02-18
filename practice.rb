users = [
  { "id" => "1", "name" => "Alice" },
  { "id" => 2,   "name" => "Bob" },
  { "id" => "3", "name" => "Carol" }
]

activities = [
  { user_id: 1,   action: "login" },
  { user_id: "1", action: "upload" },
  { user_id: 2,   action: "login" },
  { user_id: 2,   action: "login" },
  { user_id: 4,   action: "login" }
]

def summarize_activity(users, activities)
  normalize_users = users.map do |user|
  {
    id: user["id"].to_i,
    name: user["name"]
  }
  end
  normalize_activities = activities.map do |activity|
    activity.merge(user_id: activity[:user_id].to_i)
  end
  actions = normalize_activities.each_with_object(Hash.new{|h,k| h[k] = []}) do |activity, hash|
    hash[activity[:user_id]] << activity[:action]
  end

  normalize_users.map do |user|
    user.merge(actions: actions[user[:id]])
  end
end

pp summarize_activity(users, activities)

expected_output = [
  {
    id: 1,
    name: "Alice",
    total_actions: 2,
    actions: { "login" => 1, "upload" => 1 }
  },
  {
    id: 2,
    name: "Bob",
    total_actions: 2,
    actions: { "login" => 2 }
  },
  {
    id: 3,
    name: "Carol",
    total_actions: 0,
    actions: {}
  }
]
