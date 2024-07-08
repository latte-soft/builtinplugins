local l_Selection_0 = game:GetService("Selection");
local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v3 = require(l_Parent_0.Packages.Framework);
local v4 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v3.UI;
local l_PluginButton_0 = l_UI_0.PluginButton;
local l_PluginToolbar_0 = l_UI_0.PluginToolbar;
local v10 = require(l_Parent_0.Packages.DraggerFramework.Utility.Analytics);
local v11 = require(l_Parent_0.Src.RoduxComponents.EditPivotSession);
local v12 = require(l_Parent_0.Src.Utility.setWorldPivot);
local v13 = require(l_Parent_0.Src.Utility.getDefaultModelPivot);
local v14 = v4.PureComponent:extend("EditPivotPlugin");
local v15 = require(l_Parent_0.Src.Flags.getFFlagImprovePluginSpeedPivotEditor);
v14.init = function(v16)
    v16:setState({
        active = false
    });
    v16.toggleActive = function()
        v16:setState({
            active = not v16.state.active
        });
    end;
    if v15() then
        v16.props.pluginLoaderContext.mainButtonClickedSignal:Connect(v16.toggleActive);
    end;
end;
v14.didMount = function(v17)
    v17._deactivatedConnection = v17.props.Plugin:get().Deactivation:Connect(function()
        v17:setState({
            active = false
        });
    end);
    if v17.state.active then
        v17.props.Plugin:get():Activate(true);
    end;
end;
v14.willUnmount = function(v18)
    v18._deactivatedConnection:Disconnect();
end;
v14.willUpdate = function(v19, _, v21)
    if not (not v21.active or v19.state.active) then
        v19.props.Plugin:get():Activate(true);
    end;
end;
if v15() then
    v14.didUpdate = function(v22)
        v22.props.pluginLoaderContext.mainButton:SetActive(v22.state.active);
    end;
end;
v14._onClearPivot = function(_)
    local v24 = false;
    local v25 = 0;
    for _, v27 in ipairs(l_Selection_0:Get()) do
        if not v27:IsA("BasePart") then
            if v27:IsA("Model") then
                v25 = v25 + 1;
                if not v27.PrimaryPart then
                    local v28 = v13(v27);
                    if v28 ~= v27.WorldPivot then
                        v12(v27, v28);
                        v24 = true;
                    end;
                elseif v27.PrimaryPart.PivotOffset ~= CFrame.identity then
                    v27.PrimaryPart.PivotOffset = CFrame.identity;
                    v27.WorldPivot = v27:GetPivot();
                    v24 = true;
                end;
            end;
        else
            v25 = v25 + 1;
            if v27.PivotOffset ~= CFrame.new() then
                v27.PivotOffset = CFrame.new();
                v24 = true;
            end;
        end;
    end;
    if v24 then
        l_ChangeHistoryService_0:SetWaypoint("Clear Pivot");
    end;
    v10:sendEvent("clearPivot", {
        objectCount = v25
    });
end;
v14.render = function(v29)
    return v4.createFragment({
        Toolbar = v4.createElement(l_PluginToolbar_0, {
            Title = "Pivot", 
            RenderButtons = function(v30)
                return {
                    EditPivot = if v15() then nil else v4.createElement(l_PluginButton_0, {
                        Toolbar = v30, 
                        Title = "EditPivot", 
                        Tooltip = "", 
                        Icon = "", 
                        Active = v29.state.active, 
                        OnClick = v29.toggleActive
                    }), 
                    ClearPivot = v4.createElement(l_PluginButton_0, {
                        Toolbar = v30, 
                        Title = "ClearPivot", 
                        Tooltip = "", 
                        Icon = "", 
                        Active = false, 
                        Enabled = true, 
                        OnClick = function()
                            v29:_onClearPivot();
                        end
                    })
                };
            end
        }), 
        Session = v29.state.active and v4.createElement(v11)
    });
end;
return (l_withContext_0({
    Plugin = l_ContextServices_0.Plugin
})(v14));
