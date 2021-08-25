function scan(x)
pcall(function()
for _,v in pairs(x:children()) do
if (v.ClassName:find("Function") or v.ClassName:find("Event")) then
print(v.Name .. " - " .. v.Parent.Name);
end
if (#v:children()) then scan(v) end
end
end)
end
scan(game);