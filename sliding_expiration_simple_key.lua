-- redis only provides a time to live for a specific key
-- so if you want a sliding expiration for such a key, then you need to use a small and simple ua script
-- for http://stackoverflow.com/questions/31556999/migrating-from-ehcache-to-redis-equivalent-of-ehcache-settimetoidle-in-redis

local redis_key = redis.call('get', 'key')
if redis_key then 
    redis.call('expire', 'key', '10')
    return redis_key
end
return -1
