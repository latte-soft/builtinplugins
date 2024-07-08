local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerAutoSetupDisablePublish);
local v4 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerAutoSetupTelemetryV2);
return function(v5, v6)
    local v7, v8 = v2.useState(if v5 == nil then nil else v5:GetAttribute(v6));
    v2.useEffect(function()
        if v5 == nil then
            return nil;
        else
            assert(v5 ~= nil, v1.LUAU_ANALYZE_ERROR);
            if not (not v3() and not v4()) then
                v8(v5:GetAttribute(v6));
            end;
            local v9 = v5:GetAttributeChangedSignal(v6):Connect(function()
                v8(v5:GetAttribute(v6));
            end);
            return function()
                v9:Disconnect();
            end;
        end;
    end, {
        v5, 
        v6
    });
    return v7;
end;
