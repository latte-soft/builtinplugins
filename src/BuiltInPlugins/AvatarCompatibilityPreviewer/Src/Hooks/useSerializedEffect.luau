local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Src.Util.Constants);
local _ = require(l_Parent_0.Src.Types);
local v4 = require(l_Parent_0.Src.Flags.getFFlagDebugAvatarPreviewerAvoidSerialization);
return function(v5, v6, v7, v8, v9)
    local v10 = v1.useMemo(function()
        return v7;
    end, {
        v6
    });
    local v11 = v2.ATTRIBUTE_PREFIX .. v6;
    local v12 = v1.useRef(v7);
    local v13 = v1.useRef(false);
    local v14 = v1.useCallback(function()
        if not v4() then
            v5:SetAttribute(v11, if not not v9 and v12.current ~= nil then v9.serialize(v12.current) else v12.current);
            return ;
        else
            return ;
        end;
    end, {
        v11, 
        v9, 
        v5
    });
    v1.useEffect(function()
        local v15 = if not v4() then v5:GetAttribute(v11) else nil;
        if v15 == nil then
            v8(v10);
        else
            v8(if not v9 then v15 else v9.deserialize(v15));
        end;
        v13.current = true;
        return v14;
    end, {
        v5, 
        v11, 
        v8, 
        v9, 
        v10, 
        v14
    });
    v1.useEffect(function()
        if v13.current then
            v12.current = v7;
            v14();
            return ;
        else
            return ;
        end;
    end, {
        v7
    });
end;
