local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local v4 = require(l_script_FirstAncestor_0.Src.Util.ScriptAnalysis.Constants);
local l_UI_0 = v2.UI;
local l_Image_0 = l_UI_0.Image;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Pane_0 = l_UI_0.Pane;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local v11 = v1.PureComponent:extend("ScriptIconView");
v11.defaultProps = {
    AllowTooltips = true
};
local function _(v12)
    return v12[v4.ScriptStatus.Reverted] or 0;
end;
local function _(v14)
    return v14[v4.ScriptStatus.Complete] or 0;
end;
local function _(v16)
    return v16[v4.ScriptStatus.Error] or 0;
end;
local function _(v18)
    return v18[v4.ScriptStatus.VariableError] or 0;
end;
local function _(v20)
    return v20[v4.ScriptStatus.Warning] or 0;
end;
v11.renderIcon = function(v22, v23, v24, v25, v26)
    local l_props_0 = v22.props;
    return v1.createElement(l_Image_0, {
        Image = v23, 
        ImageColor3 = v24, 
        Size = l_props_0.Stylizer.StatusImageSize, 
        LayoutOrder = v26
    }, {
        Tooltip = if not l_props_0.AllowTooltips then nil else v1.createElement(l_Tooltip_0, {
            Text = l_props_0.Localization:getText("ScriptStatus", v25)
        })
    });
end;
v11.renderCount = function(v28, v29, v30)
    return v1.createElement(l_TextLabel_0, {
        Text = tostring(v29), 
        AutomaticSize = Enum.AutomaticSize.XY, 
        LayoutOrder = v30, 
        TextSize = v28.props.Stylizer.CountTextSize
    });
end;
v11.render = function(v31)
    local l_props_1 = v31.props;
    local l_Size_0 = l_props_1.Size;
    local l_Statuses_0 = l_props_1.Statuses;
    local l_ShowCounts_0 = l_props_1.ShowCounts;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local v37 = l_Statuses_0[v4.ScriptStatus.Error] or 0;
    local v38 = l_Statuses_0[v4.ScriptStatus.VariableError] or 0;
    local v39 = l_Statuses_0[v4.ScriptStatus.Warning] or 0;
    local v40 = l_Statuses_0[v4.ScriptStatus.Complete] or 0;
    local v41 = l_Statuses_0[v4.ScriptStatus.Reverted] or 0;
    local v42 = l_LayoutOrderIterator_0.new();
    return v1.createElement(l_Pane_0, {
        Layout = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        Spacing = l_Stylizer_0.Spacing, 
        Size = l_Size_0
    }, {
        CompleteIcon = if v40 > 0 then v31:renderIcon(l_Stylizer_0.StatusIcons.Complete, nil, v4.ScriptStatus.Complete, v42:getNextOrder()) else nil, 
        CompleteCount = if not not l_ShowCounts_0 and v40 > 1 then v31:renderCount(v40, v42:getNextOrder()) else nil, 
        ErrorIcon = if v37 > 0 then v31:renderIcon(l_Stylizer_0.StatusIcons.Error, nil, v4.ScriptStatus.Error, v42:getNextOrder()) else nil, 
        ErrorCount = if not not l_ShowCounts_0 and v37 > 0 then v31:renderCount(v37, v42:getNextOrder()) else nil, 
        VarErrorIcon = if v38 > 0 then v31:renderIcon(l_Stylizer_0.StatusIcons.VariableError, nil, v4.ScriptStatus.VariableError, v42:getNextOrder()) else nil, 
        VarErrorCount = if not not l_ShowCounts_0 and v38 > 0 then v31:renderCount(v38, v42:getNextOrder()) else nil, 
        WarningIcon = if v39 > 0 then v31:renderIcon(l_Stylizer_0.StatusIcons.Warning, nil, v4.ScriptStatus.Warning, v42:getNextOrder()) else nil, 
        WarningCount = if not not l_ShowCounts_0 and v39 > 0 then v31:renderCount(v39, v42:getNextOrder()) else nil, 
        RevertedIcon = if v41 > 0 then v31:renderIcon(l_Stylizer_0.StatusIcons.Reverted, l_Stylizer_0.RevertedIconColor, v4.ScriptStatus.Reverted, v42:getNextOrder()) else nil, 
        RevertedCount = if not not l_ShowCounts_0 and v41 > 1 then v31:renderCount(v41, v42:getNextOrder()) else nil
    });
end;
return (l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v11));
