nums = [1, nil, 2, 5]

def summarize_numbers(nums)
  valid_nums = nums.compact
    {
      count: valid_nums.count,
      sum: valid_nums.sum,
      average: valid_nums.sum.to_f / valid_nums.count
    }
end


pp summarize_numbers(nums)