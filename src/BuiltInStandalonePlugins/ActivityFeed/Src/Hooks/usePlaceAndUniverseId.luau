local v0 = require(script.Parent.Parent.Parent.Packages.React);
local v1 = false;
local v2 = nil;
return function(v3)
    if not v1 then
        v1 = true;
        v2 = Instance.new("BindableEvent");
        assert(v2);
        v3:OnInvoke("idsupdated", function()
            v2:Fire();
        end);
    end;
    assert(v2);
    local v4, v5 = v0.useState(0);
    local v6, v7 = v0.useState(0);
    local function _()
        local l_v3_Item_0 = v3:GetItem("placeid");
        local l_v3_Item_1 = v3:GetItem("universeid");
        v5(l_v3_Item_0);
        v7(l_v3_Item_1);
    end;
    v0.useEffect(function()
        local l_v3_Item_2 = v3:GetItem("placeid");
        local l_v3_Item_3 = v3:GetItem("universeid");
        v5(l_v3_Item_2);
        v7(l_v3_Item_3);
        l_v3_Item_2 = v2.Event:Connect(function()
            local l_v3_Item_4 = v3:GetItem("placeid");
            local l_v3_Item_5 = v3:GetItem("universeid");
            v5(l_v3_Item_4);
            v7(l_v3_Item_5);
        end);
        return function()
            l_v3_Item_2:Disconnect();
        end;
    end, {});
    return v4, v6;
end;
