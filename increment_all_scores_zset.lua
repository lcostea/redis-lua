-- small script to increment all scores of a zset 
-- I made it for http://stackoverflow.com/questions/31616886/redis-how-to-increase-all-scores-of-a-zset-with-zincrby


local zsetMembers = redis.call('zrange', 'myzset', '0', '-1') 
for k,member in pairs(zsetMembers) do 
  redis.call('zincrby', 'myzset', '1', member) 
end
