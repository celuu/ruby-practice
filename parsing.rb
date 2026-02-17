lines = [
  "level=warn user=12 msg='rate limit'",
  "level=info user=12 msg='ok'",
  "level=error user=9 msg='oops'"
]


def parse(lines)
  hash = {}
  lines.map do |line|
    parts = line.split(" ")
    level = parts[0].split("=", 2)[1]
    user = parts[1].split("=", 2)[1]
    message = parts[2..].join(" ").split("=", 2)[1].delete_prefix("'").delete_suffix("'")
   
    {
      level: level,
      user: user,
      message: message
    }
  end
end


pp parse(lines)
