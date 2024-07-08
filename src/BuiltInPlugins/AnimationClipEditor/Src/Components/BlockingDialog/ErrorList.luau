local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ScrollingFrame_0 = v2.UI.ScrollingFrame;
local _ = require(l_script_FirstAncestor_0.Src.Util.Constants);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = v1.PureComponent:extend("ErrorList");
v7.makeSeparator = function(_)
    return v1.createElement("Frame", {
        Size = UDim2.fromOffset(0, 5), 
        BackgroundTransparency = 1
    });
end;
v7.makeErrorElements = function(v9)
    local l_props_0 = v9.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Localization_0 = l_props_0.Localization;
    local l_dialogTheme_0 = l_Stylizer_0.dialogTheme;
    local l_ErrorList_0 = l_props_0.ErrorList;
    local l_ErrorKey_0 = l_props_0.ErrorKey;
    local v16 = {};
    for v17, v18 in ipairs(l_ErrorList_0) do
        local l_Data_0 = v18.Data;
        if v17 > 1 then
            table.insert(v16, v9:makeSeparator());
        end;
        table.insert(v16, v1.createElement("TextLabel", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            TextSize = l_dialogTheme_0.textSize, 
            TextColor3 = l_dialogTheme_0.textColor, 
            Font = l_Stylizer_0.font, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            TextWrapped = true, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            RichText = true, 
            Text = "<b>" .. l_Localization_0:getText(l_ErrorKey_0, v18.ID, {
                entries = ""
            }) .. "</b>"
        }));
        if l_Data_0 then
            local v20 = {};
            for _, v22 in ipairs(l_Data_0) do
                table.insert(v20, v22.Name);
            end;
            table.insert(v16, v1.createElement("TextLabel", {
                Size = UDim2.new(1, 0, -20, 0), 
                Position = UDim2.new(0, 0, 20, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                TextSize = l_dialogTheme_0.textSize, 
                TextColor3 = l_dialogTheme_0.textColor, 
                Font = l_Stylizer_0.font, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                TextWrapped = true, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                Text = table.concat(v20, ", ")
            }));
        end;
    end;
    return v16;
end;
v7.render = function(v23)
    local l_props_1 = v23.props;
    local l_Stylizer_1 = l_props_1.Stylizer;
    local l_Localization_1 = l_props_1.Localization;
    local l_dialogTheme_1 = l_Stylizer_1.dialogTheme;
    local _ = l_props_1.HeaderKey;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        Layout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, 10)
        }), 
        Header = v1.createElement("Frame", {
            LayoutOrder = 1, 
            Size = UDim2.new(1, 0, 0, 21), 
            BackgroundTransparency = 1
        }, {
            Icon = v1.createElement("ImageLabel", {
                Size = UDim2.new(0, 21, 0, 21), 
                BackgroundTransparency = 1, 
                Image = l_dialogTheme_1.errorImage
            }), 
            Text = v1.createElement("TextLabel", {
                Size = UDim2.new(1, -21, 1, 0), 
                Position = UDim2.new(0, 31, 0, 0), 
                BackgroundTransparency = 1, 
                TextSize = l_dialogTheme_1.textSize, 
                TextColor3 = l_dialogTheme_1.textColor, 
                Font = l_dialogTheme_1.headerFont, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Text = l_Localization_1:getText(l_props_1.ErrorKey, "Header")
            })
        }), 
        Body = v1.createElement(l_ScrollingFrame_0, {
            LayoutOrder = 2, 
            Size = UDim2.new(1, 0, 1, -31)
        }, (v23:makeErrorElements()))
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v7));
