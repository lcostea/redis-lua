-- small script to increment all scores of a zset 
-- I made it for http://stackoverflow.com/questions/31616886/redis-how-to-increase-all-scores-of-a-zset-with-zincrby


local zsetMembers = redis.call('ZRANGE', KEYS[1], '0', '-1') 
for _,member in pairs(zsetMembers) do 
  redis.call('ZINCRBY', KEYS[1], '1', member) 
end
