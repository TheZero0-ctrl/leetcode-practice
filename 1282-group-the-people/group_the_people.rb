def group_the_people(group_sizes)
  group = {}
  result = []
  group_sizes.each_with_index do |group_size, i|
    group[group_size] ||= []
    group[group_size] << i
    if group[group_size].length == group_size
      result << group[group_size]
      group[group_size] = []
    end
  end
  result
end
