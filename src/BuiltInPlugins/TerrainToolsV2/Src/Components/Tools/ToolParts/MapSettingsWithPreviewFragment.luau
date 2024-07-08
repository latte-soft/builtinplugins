local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = require(l_Parent_0.Src.ContextItems);
local v7 = require(l_Parent_0.Src.TerrainWorldUI.LargeVoxelRegionPreview);
local v8 = require(script.Parent.MapSettingsFragment);
local v9 = v3.PureComponent:extend(script.Name);
v9.init = function(v10)
    v10.preview = nil;
    v10.warnings = {};
    local function v14(v11, v12, v13)
        v10.warnings = v2.Dictionary.join(v10.warnings, {
            [v11 .. v12] = v13
        });
        if v10.props.SetWarnings then
            v10.props.SetWarnings(v10.warnings);
        end;
    end;
    local function _(v15, v16)
        return function(v17, v18, v19, v20)
            if v20 then
                v14(v17, v18, false);
                v16(v2.Dictionary.join(v15(), {
                    [v18] = v19
                }));
                return ;
            else
                v14(v17, v18, true);
                return ;
            end;
        end;
    end;
    local function v22()
        return v10.props.Position;
    end;
    local l_OnPositionChanged_0 = v10.props.OnPositionChanged;
    local l_l_OnPositionChanged_0_0 = l_OnPositionChanged_0 --[[ copy: 5 -> 6 ]];
    local l_v22_0 = v22 --[[ copy: 4 -> 7 ]];
    v10.onPositionChanged = function(v26, v27, v28, v29)
        if v29 then
            v14(v26, v27, false);
            l_l_OnPositionChanged_0_0(v2.Dictionary.join(l_v22_0(), {
                [v27] = v28
            }));
            return ;
        else
            v14(v26, v27, true);
            return ;
        end;
    end;
    v22 = function()
        return v10.props.Size;
    end;
    l_OnPositionChanged_0 = v10.props.OnSizeChanged;
    v10.onSizeChanged = function(v30, v31, v32, v33)
        if v33 then
            v14(v30, v31, false);
            l_OnPositionChanged_0(v2.Dictionary.join(v22(), {
                [v31] = v32
            }));
            return ;
        else
            v14(v30, v31, true);
            return ;
        end;
    end;
end;
v9.updatePreview = function(v34)
    assert(v34.preview, "MapSettingsWithPreviewFragment preview is nil");
    local v35 = Vector3.new(v34.props.Position.X, v34.props.Position.Y, v34.props.Position.Z);
    local v36 = Vector3.new(v34.props.Size.X, v34.props.Size.Y, v34.props.Size.Z);
    if v34.props.PreviewOffset then
        v35 = v35 + v36 * v34.props.PreviewOffset;
    end;
    v34.preview:setSizeAndPosition(v36, v35);
end;
v9.didMount = function(v37)
    local v38 = v37.props.Mouse:get();
    assert(not v37.preview, "MapSettingsWithPreviewFragment preview already exists");
    v37.preview = v7.new(v38, game.Workspace.CurrentCamera);
    v37:updatePreview();
    v37.preview:updateVisibility(true);
    v37.onPreviewSizeChangeConnect = v37.preview:getOnSizeChanged():Connect(function(v39, v40)
        local l_v40_0 = v40;
        if v37.props.PreviewOffset then
            l_v40_0 = l_v40_0 - v39 * v37.props.PreviewOffset;
        end;
        v37.props.OnPositionChanged({
            X = l_v40_0.x, 
            Y = l_v40_0.y, 
            Z = l_v40_0.z
        });
        v37.props.OnSizeChanged({
            X = v39.x, 
            Y = v39.y, 
            Z = v39.z
        });
    end);
    local l_PluginActivationController_0 = v37.props.PluginActivationController;
    v37.onToolActivatedConnection = l_PluginActivationController_0:subscribeToToolActivated(function()
        if l_PluginActivationController_0:getActiveTool() == v37.props.toolName then
            v37:updatePreview();
            v37.preview:updateVisibility(true);
        end;
    end);
    v37.onToolDeactivatedConnection = l_PluginActivationController_0:subscribeToToolDeactivated(function(v43)
        if v43 == v37.props.toolName then
            v37.preview:updateVisibility(false);
        end;
    end);
end;
v9.didUpdate = function(v44)
    v44:updatePreview();
end;
v9.willUnmount = function(v45)
    if v45.onPreviewSizeChangeConnect then
        v45.onPreviewSizeChangeConnect:Disconnect();
        v45.onPreviewSizeChangeConnect = nil;
    end;
    if v45.onToolActivatedConnection then
        v45.onToolActivatedConnection:Disconnect();
        v45.onToolActivatedConnection = nil;
    end;
    if v45.onToolDeactivatedConnection then
        v45.onToolDeactivatedConnection:Disconnect();
        v45.onToolDeactivatedConnection = nil;
    end;
    if v45.preview then
        v45.preview:destroy();
        v45.preview = nil;
    end;
end;
v9.render = function(v46)
    return v3.createElement(v8, (v2.Dictionary.join(v46.props, {
        OnPositionChanged = v46.onPositionChanged, 
        OnSizeChanged = v46.onSizeChanged, 
        SetWarnings = v2.None, 
        toolName = v2.None
    })));
end;
return (l_withContext_0({
    Mouse = l_ContextServices_0.Mouse, 
    PluginActivationController = v6.PluginActivationController
})(v9));
