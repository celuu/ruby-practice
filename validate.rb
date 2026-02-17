records = [
  { id: 1, email: "a@test.com" },
  { id: nil, email: "b@test.com" },
  { id: 2, email: nil },
  { id: 3, email: "c@test.com" }
]

def valid(records)
  valid_records = []
  invalid_records = []
  records.each do |record|
    if record[:id] && record[:email]
      valid_records << record
    else
      invalid_records << record
    end
  end

  {
    valid: valid_records,
    invalid: invalid_records
  }

end

pp valid(records)