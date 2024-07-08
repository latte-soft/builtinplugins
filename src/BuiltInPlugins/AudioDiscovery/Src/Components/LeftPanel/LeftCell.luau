local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_mapOne_0 = v2.Dash.mapOne;
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Image_0 = l_UI_0.Image;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_game_FastInt_0 = game:GetFastInt("SoundEffectMaxDuration");
local v13 = v1.PureComponent:extend("LeftCell");
v13.getContent = function(v14)
    local l_props_0 = v14.props;
    local v16 = l_props_0.CellProps.Locations[l_props_0.Row.Id] or {};
    if l_props_0.ColumnIndex > 1 then
        local l_Value_0 = l_props_0.Value;
        if typeof(l_props_0.Value) == "number" then
            l_Value_0 = tostring(l_Value_0);
            local v19 = if not v16 then nil else l_mapOne_0(v16, function(v18)
                if v18.Instance.ClassName == "Sound" then
                    return v18.Instance;
                else
                    return nil;
                end;
            end);
            if v19 then
                l_Value_0 = tostring(v19.TimeLength);
            end;
            l_Value_0 = l_Value_0 .. "s";
        end;
        return v1.createElement(l_TextLabel_0, {
            TextColor = l_props_0.Style.Text, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            Size = UDim2.fromScale(1, 1), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            LayoutOrder = l_props_0.ColumnIndex, 
            Text = l_Value_0
        });
    else
        local l_Value_1 = l_props_0.Value;
        if l_Value_1 == "" then
            return ;
        else
            if l_Value_1 == "error" and #v16 == 0 then
                l_Value_1 = "done";
            end;
            return v1.createElement(l_Image_0, {
                Size = UDim2.fromOffset(24, 24), 
                Image = ("rbxasset://textures/AudioDiscovery/%s.png"):format(l_Value_1)
            });
        end;
    end;
end;
v13.render = function(v21)
    local l_props_1 = v21.props;
    local l_Localization_1 = l_props_1.Localization;
    local l_Style_0 = l_props_1.Style;
    local v25 = if l_props_1.RowIndex % 2 == 1 then l_Style_0.BackgroundOdd else l_Style_0.BackgroundEven;
    local v26 = l_props_1.Width or UDim.new(1 / #l_props_1.Columns, 0);
    local v27 = if not l_props_1.Value then nil else tostring(l_props_1.Value);
    local v28 = l_props_1.CellProps.Locations[l_props_1.Row.Id] or {};
    if l_props_1.ColumnIndex == 1 then
        v27 = if #v28 == 0 then l_Localization_1:getText("Reason", "Done") else if l_props_1.Value == "ok" then if l_props_1.Row.Creator == "Roblox" then l_Localization_1:getText("Reason", "Roblox") else if l_props_1.Row.Creator == "Monstercat" then l_Localization_1:getText("Reason", "Monstercat") else if l_props_1.Row.Time < l_game_FastInt_0 then l_Localization_1:getText("Reason", "Effect") else l_Localization_1:getText("Reason", "OK") else l_Localization_1:getText("Reason", "Error");
    elseif l_props_1.ColumnIndex == 5 then
        v27 = ("%s %s"):format(l_props_1.Row.CreatorType, l_props_1.Row.CreatorId);
    end;
    return v1.createElement(l_Pane_0, {
        LayoutOrder = l_props_1.ColumnIndex, 
        Padding = {
            Top = 1, 
            Bottom = 1, 
            Left = 5, 
            Right = 5
        }, 
        Style = "Box", 
        BackgroundColor3 = v25, 
        BorderSizePixel = 1, 
        BorderColor3 = l_Style_0.Border, 
        Size = UDim2.new(v26.Scale, v26.Offset, 1, 0)
    }, {
        Child = v21:getContent(), 
        Tooltip = v27 and v1.createElement(l_Tooltip_0, {
            MaxWidth = l_Style_0.Tooltip.MaxWidth, 
            Text = v27, 
            TextXAlignment = Enum.TextXAlignment.Left
        })
    });
end;
return l_withContext_0({
    Localization = l_Localization_0
})(v13);
