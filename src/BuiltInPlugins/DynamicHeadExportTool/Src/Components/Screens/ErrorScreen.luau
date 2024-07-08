local l_script_FirstAncestor_0 = script:FindFirstAncestor("DynamicHeadExportTool");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_UI_0 = v3.UI;
local l_Button_0 = l_UI_0.Button;
local l_MultiLineTextInput_0 = l_UI_0.MultiLineTextInput;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_StyleKey_0 = v3.Style.StyleKey;
local v10 = require(l_script_FirstAncestor_0.Src.Actions.SetEnabled);
local v11 = require(l_script_FirstAncestor_0.Src.Constants);
local v12 = v1.PureComponent:extend("ErrorScreen");
v12.render = function(v13)
    local l_props_0 = v13.props;
    local l_Localization_0 = l_props_0.Localization;
    return v1.createElement("Frame", {
        BackgroundColor3 = l_props_0.Stylizer[l_StyleKey_0.MainBackground], 
        Size = UDim2.new(1, 0, 1, 0)
    }, {
        UIPadding = v1.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, v11.Padding), 
            PaddingLeft = UDim.new(0, v11.Padding), 
            PaddingRight = UDim.new(0, v11.Padding), 
            PaddingTop = UDim.new(0, v11.Padding)
        }), 
        Content = v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, -(30 + v11.Padding))
        }, {
            UIListLayout = v1.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                Padding = UDim.new(0, v11.Padding)
            }), 
            TextLabel = v1.createElement(l_TextLabel_0, {
                LayoutOrder = 1, 
                Text = l_Localization_0:getText("Plugin", "ErrorTitle"), 
                Style = "Title", 
                Size = UDim2.new(1, 0, 0, 20), 
                Position = UDim2.new(0, 0, 0, 0), 
                BackgroundTransparency = 1, 
                TextXAlignment = Enum.TextXAlignment.Center
            }), 
            MultiLineTextInput = v1.createElement(l_MultiLineTextInput_0, {
                LayoutOrder = 2, 
                TextInputProps = {
                    Text = v13.props.errorText, 
                    Enabled = false
                }, 
                Style = "FilledRoundedRedBorder", 
                Size = UDim2.new(1, 0, 1, -(20 + v11.Padding)), 
                Position = UDim2.new(0, 0, 0, 0)
            })
        }), 
        Button = v1.createElement(l_Button_0, {
            Text = l_Localization_0:getText("Plugin", "CloseButton"), 
            Style = "Round", 
            TextSize = 24, 
            Size = UDim2.new(1, 0, 0, 30), 
            Position = UDim2.new(0, 0, 1, -30), 
            OnClick = function()
                l_props_0.close();
            end
        })
    });
end;
return v2.connect(function(v16, _)
    return {
        errorText = v16.PluginReducer.errorText
    };
end, function(v18)
    return {
        close = function()
            v18(v10(false));
        end
    };
end)((l_ContextServices_0.withContext({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Plugin = l_ContextServices_0.Plugin
})(v12)));
