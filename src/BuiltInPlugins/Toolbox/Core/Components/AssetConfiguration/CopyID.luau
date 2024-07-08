local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_StudioService_0 = game:GetService("StudioService");
local l_Packages_0 = l_Parent_0.Packages;
local v3 = require(l_Packages_0.Roact);
local v4 = require(l_Parent_0.Core.Util.Constants);
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = v3.PureComponent:extend("CopyID");
v7.init = function(v8)
    v8.state = {
        copied = false
    };
    v8.onCopyClicked = function(_)
        l_StudioService_0:CopyToClipboard((tostring(v8.props.AssetId)));
        v8:setState({
            copied = true
        });
    end;
end;
v7.render = function(v10)
    local l_props_0 = v10.props;
    local l_state_0 = v10.state;
    local l_Stylizer_0 = l_props_0.Stylizer;
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        Position = UDim2.new(0.5, 0, 0, l_props_0.YPos), 
        AnchorPoint = Vector2.new(0.5, 0), 
        Size = UDim2.new(0, 111, 0, 24)
    }, {
        LayoutContainer = v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0)
        }, {
            UIListLayout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 5)
            }), 
            IDLabel = v3.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Font = v4.FONT, 
                Text = "ID: " .. l_props_0.AssetId, 
                TextColor3 = l_Stylizer_0.uploadResult.idText, 
                TextSize = v4.FONT_SIZE_MEDIUM, 
                Size = UDim2.new(0, 86, 1, 0), 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                LayoutOrder = 1
            }), 
            CopyButton = v3.createElement("ImageButton", {
                Size = UDim2.new(0, 20, 0, 20), 
                Image = "rbxasset://textures/StudioToolbox/AssetConfig/copy_2x.png", 
                ImageColor3 = l_Stylizer_0.uploadResult.buttonColor, 
                BackgroundTransparency = 1, 
                LayoutOrder = 2, 
                [v3.Event.MouseButton1Click] = v10.onCopyClicked
            })
        }), 
        CopiedLabel = l_state_0.copied and v3.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Font = v4.FONT, 
            Text = l_props_0.Localization:getText("AssetConfigUpload", "IDCopied"), 
            TextColor3 = l_Stylizer_0.uploadResult.greenText, 
            TextSize = v4.FONT_SIZE_MEDIUM, 
            Size = UDim2.new(0, 64, 1, 0), 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, 116, 0.5, 0), 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextXAlignment = Enum.TextXAlignment.Center
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v7));
