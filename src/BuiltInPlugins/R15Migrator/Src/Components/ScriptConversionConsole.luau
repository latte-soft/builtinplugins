local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local l_ContextServices_0 = v1.ContextServices;
local v5 = require(l_script_FirstAncestor_0.Src.Components.ScriptIconView);
local v6 = require(l_script_FirstAncestor_0.Src.Components.PopUpFrame);
local v7 = require(l_script_FirstAncestor_0.Src.Util.ScriptStatusUtil);
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_List_0 = l_UI_0.List;
local v11 = v2.PureComponent:extend("ScriptConversionConsole");
v11.init = function(v12)
    v12.state = {
        arrowHovered = false, 
        hideConsole = true, 
        rows = {}
    };
    v12.onMouseEnter = function()
        v12:setState({
            arrowHovered = true
        });
    end;
    v12.onMouseLeave = function()
        v12:setState({
            arrowHovered = false
        });
    end;
    v12.closeConsole = function()
        v12:setState({
            hideConsole = true
        });
    end;
    v12.openConsole = function()
        v12:setState({
            hideConsole = false, 
            arrowHovered = false
        });
    end;
    v12.renderConsoleContent = function(v13)
        local l_state_0 = v12.state;
        local l_props_0 = v12.props;
        local l_rows_0 = l_state_0.rows;
        if l_rows_0 then
            return v2.createElement(l_List_0, {
                Rows = l_rows_0, 
                LayoutOrder = v13, 
                RowHeight = l_props_0.Stylizer.RowHeight
            });
        else
            return ;
        end;
    end;
end;
v11.buildRows = function(v17)
    local l_props_1 = v17.props;
    local l_processResult_0 = l_props_1.processResult;
    local l_Localization_0 = l_props_1.Localization;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local l_v7_StatusMessages_0 = v7:GetStatusMessages(l_processResult_0, l_Localization_0);
    local v23 = {};
    for v24, v25 in l_v7_StatusMessages_0, nil, nil do
        table.insert(v23, {
            text = v25, 
            icon = {
                Image = l_Stylizer_0.StatusIcons[v24], 
                Size = l_Stylizer_0.IconSize
            }
        });
    end;
    v17:setState({
        rows = v23
    });
end;
v11.didMount = function(v26)
    if v26.props.processResult then
        v26:buildRows();
    end;
end;
v11.didUpdate = function(v27, v28)
    if v27.props.processResult ~= v28.processResult then
        v27:buildRows();
    end;
end;
v11.render = function(v29)
    local l_props_2 = v29.props;
    local l_state_1 = v29.state;
    local l_LayoutOrder_0 = l_props_2.LayoutOrder;
    local l_Stylizer_1 = l_props_2.Stylizer;
    local l_processResult_1 = l_props_2.processResult;
    local l_Size_0 = l_Stylizer_1.Arrow.Size;
    local l_hideConsole_0 = l_state_1.hideConsole;
    local l_arrowHovered_0 = l_state_1.arrowHovered;
    local v38 = next(l_processResult_1) ~= nil;
    return v2.createElement(l_Pane_0, {
        BackgroundColor3 = l_Stylizer_1.BackgroundColor, 
        BorderSizePixel = 0, 
        LayoutOrder = l_LayoutOrder_0, 
        Size = UDim2.new(1, 0, 0, l_Stylizer_1.RowHeight), 
        Padding = l_Stylizer_1.Padding
    }, {
        StatusPane = v2.createElement(v5, {
            Size = UDim2.fromScale(1, 1), 
            ShowCounts = true, 
            Statuses = v7:GetStatusCounts(l_processResult_1), 
            AllowTooltips = false
        }), 
        PopUpFrame = v38 and v2.createElement(v6, {
            Hide = l_hideConsole_0, 
            OnFocusLost = v29.closeConsole, 
            RenderContent = v29.renderConsoleContent, 
            ExpandedHeight = l_Stylizer_1.ConsoleHeight
        }), 
        ExpandButton = v38 and v2.createElement("ImageButton", {
            Position = UDim2.fromScale(1, 0.5), 
            AnchorPoint = Vector2.new(1, 0.5), 
            BackgroundTransparency = 1, 
            Size = UDim2.fromOffset(l_Size_0, l_Size_0), 
            ImageColor3 = if not l_arrowHovered_0 then l_Stylizer_1.Arrow.Color else l_Stylizer_1.Arrow.HoverColor, 
            Image = l_Stylizer_1.Arrow.Image, 
            ImageRectOffset = l_Stylizer_1.Arrow.Offset, 
            ImageRectSize = Vector2.new(l_Size_0, l_Size_0), 
            [v2.Event.MouseButton1Click] = v29.openConsole, 
            [v2.Event.MouseEnter] = v29.onMouseEnter, 
            [v2.Event.MouseLeave] = v29.onMouseLeave
        })
    });
end;
return v3.connect(function(v39, _)
    return {
        processResult = v39.ScriptConversion.processResult
    };
end)((l_ContextServices_0.withContext({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v11)));
