realgame = game;
game = newproxy(true);
Game = game;
mtgame = getmetatable(game);

mtgame.__index = function(s, name)
    if (name == "HttpGet" or name == "HttpGetAsync") then
        return function(_,k)
            return httpget(k);
        end
    elseif (name == "GetObjects") then
        return function(_,k)
            return { realgame:GetService("InsertService"):LoadLocalAsset(k) }
        end
    end
    local member = realgame[name];
    if type(member) == "function" then
        return function(s, ...)
            return member(realgame, ...)
        end
    else
        return member;
    end
end

mtgame.__newindex = function(a,b,c)
    realgame[b] = c;
end

mtgame.__tostring = function()
    return "Game";
end

mtgame.__metatable = "The metatable is locked";