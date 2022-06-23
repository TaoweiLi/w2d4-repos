def flatten(data)
  return [data] if !data.kind_of?(Array)

  flatten_arr = []
  data.each { |ele| flatten_arr += flatten(ele) }
  flatten_arr
end


p flatten([[["some data"]]])