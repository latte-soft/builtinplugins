local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Src.Hooks.useToggleState);
local l_Focus_0 = v1.ContextServices.Focus;
local l_UserInputService_0 = game:GetService("UserInputService");
local function _(v6, v7)
    local l_AbsolutePosition_0 = v7.AbsolutePosition;
    local v9 = l_AbsolutePosition_0 + v7.AbsoluteSize;
    local v10 = false;
    if l_AbsolutePosition_0.X <= v6.X then
        v10 = false;
        if v6.X <= v9.X then
            v10 = false;
            if l_AbsolutePosition_0.Y <= v6.Y then
                v10 = v6.Y <= v9.Y;
            end;
        end;
    end;
    return v10;
end;
return function(v12)
    local v13 = l_Focus_0:use():get();
    local v14 = v3(false);
    v2.useEffect(function()
        if v14.enabled then
            local v20 = task.spawn(function()
                while true do
                    local v15 = if not v13:IsA("PluginGui") then l_UserInputService_0:GetMouseLocation() else v13:GetRelativeMousePosition();
                    if v12.current ~= nil then
                        local l_current_0 = v12.current;
                        local l_AbsolutePosition_1 = l_current_0.AbsolutePosition;
                        local v18 = l_AbsolutePosition_1 + l_current_0.AbsoluteSize;
                        local v19 = false;
                        if l_AbsolutePosition_1.X <= v15.X then
                            v19 = false;
                            if v15.X <= v18.X then
                                v19 = false;
                                if l_AbsolutePosition_1.Y <= v15.Y then
                                    v19 = v15.Y <= v18.Y;
                                end;
                            end;
                        end;
                        if v19 then
                            task.wait();
                        else
                            break;
                        end;
                    else
                        break;
                    end;
                end;
                v14.disable();
            end);
            return function()
                task.cancel(v20);
            end;
        else
            return nil;
        end;
    end, {
        v14.enabled
    });
    return {
        hover = v14.enable, 
        isHovered = v14.enabled
    };
end;
