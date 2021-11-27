bit = {}

for i, v in next, bit32 do
    bit[i] = v
end

bit.ror = bit.rrotate
bit.rol = bit.lrotate
bit.rrotate = nil
bit.lrotate = nil

bit.tobit = function(x)
    x = x % (2^32)
    if x >= 0x80000000 then x = x - (2^32) end
    return x
end

bit.tohex = function(x, n)
    n = n or 8
    local up
    if n <= 0 then
        if n == 0 then return '' end
        up = true
        n = -n
    end
    x = bit.band(x, 16^n-1)
    return ('%0'..n..(up and 'X' or 'x')):format(x)
end

bit.bswap = function(x)
    local a = bit.band(x, 0xff)
    x = bit.rshift(x, 8)
    local b = bit.band(x, 0xff)
    x = bit.rshift(x, 8)
    local c = bit.band(x, 0xff)
    x = bit.rshift(x, 8)
    local d = bit.band(x, 0xff)
    return bit.lshift(bit.lshift(bit.lshift(a, 8) + b, 8) + c, 8) + d
end