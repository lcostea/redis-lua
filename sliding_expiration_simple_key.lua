-- redis only provides a time to live for a specific key
-- so if you want a sliding expiration for such a key, then you need to use a small and simple ua script
-- for http://stackoverflow.com/questions/31556999/migrating-from-ehcache-to-redis-equivalent-of-ehcache-settimetoidle-in-redis

local redisValue = redis.call('GET', KEYS[1])
if redisValue then 
    redis.call('EXPIRE', KEYS[1], '10')
    return redisValue
end
return nil
