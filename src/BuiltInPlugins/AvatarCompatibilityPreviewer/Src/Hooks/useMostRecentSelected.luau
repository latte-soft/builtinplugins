local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v3 = require(l_script_FirstAncestor_0.Src.Hooks.useSelectedAutoSetupTarget);
local v4 = require(l_script_FirstAncestor_0.Src.Hooks.useSelectedAvatar);
local v5 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerAutoSetup)();
local v6 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerFixMeshSwitching);
return function()
    local v7 = nil;
    local v8 = nil;
    if v5 then
        local v9, v10 = v3();
        v7 = v9;
        v8 = v10;
    end;
    local v11, v12 = v4();
    local v13 = v1.useRef(nil);
    local v14 = v1.useRef(nil);
    local v15 = v1.useRef(nil);
    if not v6() then
        if v14.current ~= v7 then
            if (v7 == nil and v15.current ~= nil) and v15.current.autoSetupTarget ~= nil then
                v15.current = nil;
            elseif v7 ~= nil then
                v15.current = {
                    avatar = nil, 
                    autoSetupTarget = v7
                };
            end;
            v14.current = v7;
        end;
        if v13.current ~= v11 then
            if (v11 == nil and v15.current ~= nil) and v15.current.avatar ~= nil then
                v15.current = nil;
            elseif v11 ~= nil then
                v15.current = {
                    avatar = v11, 
                    autoSetupTarget = nil
                };
            end;
            v13.current = v11;
        end;
    else
        if not (v14.current == v7 and not v8) then
            if (v7 == nil and v15.current ~= nil) and v15.current.autoSetupTarget ~= nil then
                v15.current = nil;
            elseif v7 ~= nil and (not (v15.current ~= nil) or v15.current.autoSetupTarget ~= v7) then
                v15.current = {
                    avatar = nil, 
                    autoSetupTarget = v7
                };
            end;
            v14.current = v7;
        end;
        if not (v13.current == v11 and not v12) then
            if (v11 == nil and v15.current ~= nil) and v15.current.avatar ~= nil then
                v15.current = nil;
            elseif v11 ~= nil and (not (v15.current ~= nil) or v15.current.avatar ~= v11) then
                v15.current = {
                    avatar = v11, 
                    autoSetupTarget = nil
                };
            end;
            v13.current = v11;
        end;
    end;
    return v15.current;
end;
