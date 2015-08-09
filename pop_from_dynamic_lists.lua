-- script was made for 
-- http://stackoverflow.com/questions/31795818/redis-pop-from-list-of-not-empty-return-random-element-of-other-list-otherwise

local redis_list_member = redis.call('lpop', KEYS[1])
if not redis_list_member then 
    redis_list_member = redis.call('lpop', KEYS[2])
end
return redis_list_member 



--generic version provided by Itamar Haber
for _, redis_list_key in pairs(KEYS) do
  local redis_list_member = redis.call('LPOP', redis_list_key)
  if redis_list_member then
    return redis_list_member
  end
end
