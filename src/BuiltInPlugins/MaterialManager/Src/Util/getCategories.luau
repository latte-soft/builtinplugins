local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Src.Util.CopyPath);
local function v3(v4, v5, v6)
    local v7 = {};
    for _, v9 in ipairs(v4.CategoryNames) do
        local v10 = v4.Categories[v9];
        local v11 = if not v10.Builtin then v9 else v6:getText("Categories", v9);
        local v12 = v2(v5);
        table.insert(v12, v9);
        if #v10.CategoryNames > 0 then
            table.insert(v7, {
                children = v3(v10, v12, v6), 
                path = v12, 
                text = v11
            });
        else
            table.insert(v7, {
                path = v12, 
                text = v11
            });
        end;
    end;
    return v7;
end;
return function(v13, v14)
    return (v3(v13, {}, v14));
end;
