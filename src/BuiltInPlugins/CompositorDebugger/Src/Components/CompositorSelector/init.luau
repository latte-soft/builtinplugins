local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local v7 = require(l_script_FirstAncestor_0.Src.Components.AvatarToolsShared.InstanceSelector);
local l_Thunks_0 = l_script_FirstAncestor_0.Src.Thunks;
local v9 = require(l_Thunks_0.AttachCompositor);
local v10 = require(l_Thunks_0.DetachCompositor);
local v11 = require(script.PlayerListener);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v13 = v2.PureComponent:extend("CompositorSelector");
local function v16(v14)
    if v14 then
        assert(v14);
        local v15 = if v14:IsA("Actor") or v14:IsA("Model") then v14 else if v14:IsA("Player") then v14.Character else nil;
        if not v15 or not v15:GetAttribute("HasCompositor") then
            return nil;
        else
            return v15;
        end;
    else
        return nil;
    end;
end;
v13.init = function(v17)
    v17.isSelectedInstanceValid = function(v18)
        return v16(v18) ~= nil;
    end;
    v17.onValidSelection = function(v19, v20)
        local l_props_0 = v17.props;
        if not v20 or not l_props_0.DebugDataConnection then
            local v22 = v16(v19);
            if v22 then
                l_props_0.AttachCompositor(v22, l_props_0.Analytics);
            end;
            return ;
        else
            return ;
        end;
    end;
end;
v13.willUnmount = function(v23)
    v23.props.DetachCompositor();
end;
v13.render = function(v24)
    return v2.createElement("Folder", {}, {
        InstanceSelector = v2.createElement(v7, {
            IsSelectedInstanceValid = v24.isSelectedInstanceValid, 
            OnValidSelection = function(v25)
                v24.onValidSelection(v25, false);
            end, 
            OnInvalidSelection = function()
            end
        }), 
        PlayerListener = v2.createElement(v11, {
            IsSelectedInstanceValid = v24.isSelectedInstanceValid, 
            OnValidSelection = function(v26)
                v24.onValidSelection(v26, true);
            end, 
            OnInvalidSelection = function()
            end
        })
    });
end;
return (v3.connect(function(v27)
    return {
        DebugDataConnection = v27.Status.DebugDataConnection
    };
end, function(v28)
    return {
        AttachCompositor = function(v29, v30)
            v28(v9(v29, v30));
        end, 
        DetachCompositor = function()
            v28(v10());
        end
    };
end)((l_withContext_0({
    Analytics = l_Analytics_0
})(v13))));
