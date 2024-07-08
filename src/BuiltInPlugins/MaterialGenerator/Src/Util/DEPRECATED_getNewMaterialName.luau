local _ = script.Parent.Parent.Parent;
local function _(v1)
    return (v1:lower():gsub("[ _](%a)", string.upper):gsub("^%a", string.upper):gsub("%p", ""));
end;
local function v10(v3, v4)
    local v5 = {};
    if v4 then
        for _, v7 in pairs(v4:GetDescendants()) do
            if v7:IsA("MaterialVariant") then
                v5[string.lower(v7.Name)] = v7.Name;
            end;
        end;
    end;
    local v8 = string.lower(v3);
    if v5[v8] then
        local v9 = 0;
        while true do
            v9 = v9 + 1;
            if not v5[string.format("%s %0d", v8, v9)] then
                break;
            end;
        end;
        return string.format("%s %0d", v3, v9);
    else
        return v3;
    end;
end;
return function(v11, v12)
    return v10((v11 .. " Material"):lower():gsub("[ _](%a)", string.upper):gsub("^%a", string.upper):gsub("%p", ""), v12);
end;
