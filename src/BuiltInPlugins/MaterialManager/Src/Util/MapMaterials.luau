local _ = require(script.Parent.Parent.Parent.Src.Types);
local function v1(v2, v3, v4)
    for _, v6 in ipairs(v2.Materials) do
        table.insert(v3, if not v4 then v6 else v4(v6));
    end;
    for _, v8 in ipairs(v2.CategoryNames) do
        v1(v2.Categories[v8], v3, v4);
    end;
end;
return v1;
