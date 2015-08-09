-- small script to concatenate a dynamic number of lists passed to the script and return it  
-- redis lists are transformed into lua as tables
-- this can be better accomplished with pipelining commands in redis, so take it only for teaching purposes
-- but it can come handy when you need additional logic where pipelining can't help

local redis_all_lists_members = {}
function redis_all_lists_members.concat(table)
    for i=1,#table do
        redis_all_lists_members[#redis_all_lists_members + 1] = table[i]
    end
end

for _, redis_list_key in pairs(KEYS) do
  local redis_list_members = redis.call('LRANGE', redis_list_key, 0, -1)
  if redis_list_members then
    redis_all_lists_members.concat(redis_list_members)
  end
end
return redis_all_lists_members 
