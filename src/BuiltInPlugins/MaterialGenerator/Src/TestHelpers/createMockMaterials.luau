local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Src.TestHelpers.createMockSessionData);
local v3 = require(l_Parent_0.Src.Util.generatedMaterialFromColorMap);
return function()
    local v4, v5, v6 = v2();
    local v7 = {};
    for _, v9 in v5, nil, nil do
        table.insert(v7, (v3(v6, v9, v9, v4)));
    end;
    return v7;
end;
