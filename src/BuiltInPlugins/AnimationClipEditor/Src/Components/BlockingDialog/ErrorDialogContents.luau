local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = v1.PureComponent:extend("ErrorDialogContents");
v6.render = function(v7)
    local l_Stylizer_0 = v7.props.Stylizer;
    local l_Localization_0 = v7.props.Localization;
    local l_dialogTheme_0 = l_Stylizer_0.dialogTheme;
    local l_props_0 = v7.props;
    local l_Entries_0 = l_props_0.Entries;
    local l_ErrorType_0 = l_props_0.ErrorType;
    local v14 = l_props_0.ErrorKey or v3.RIG_ERRORS_KEY;
    local v15 = l_props_0.ErrorHeader or v3.RIG_ERRORS_HEADER_KEY;
    local v16 = nil;
    if l_Entries_0 then
        v16 = table.concat(l_Entries_0, "; ");
    end;
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
                Image = l_dialogTheme_0.errorImage
            }), 
            Text = v1.createElement("TextLabel", {
                Size = UDim2.new(1, -21, 1, 0), 
                Position = UDim2.new(0, 31, 0, 0), 
                BackgroundTransparency = 1, 
                TextSize = l_dialogTheme_0.textSize, 
                TextColor3 = l_dialogTheme_0.textColor, 
                Font = l_dialogTheme_0.headerFont, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Text = l_Localization_0:getText(v3.DIALOG_KEY, v15)
            })
        }), 
        Body = v1.createElement("TextLabel", {
            LayoutOrder = 2, 
            Size = UDim2.new(1, 0, 1, -31), 
            BackgroundTransparency = 1, 
            TextSize = l_dialogTheme_0.textSize, 
            TextColor3 = l_dialogTheme_0.textColor, 
            Font = l_Stylizer_0.font, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            TextWrapped = true, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            Text = l_Localization_0:getText(v14, l_ErrorType_0, {
                entries = v16
            })
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v6));
