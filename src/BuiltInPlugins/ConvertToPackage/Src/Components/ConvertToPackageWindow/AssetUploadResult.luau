local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = require(l_Parent_0.Src.Util.Constants);
local l_Button_0 = v4.UI.Button;
local v9 = require(l_Parent_0.Src.Components.ConvertToPackageWindow.AssetThumbnailPreview);
local v10 = v2.PureComponent:extend("AssetUploadResult");
v10.init = function(v11, _)
    v11.state = {
        isLoading = true
    };
end;
v10.render = function(v13)
    local l_props_0 = v13.props;
    local l_Localization_0 = l_props_0.Localization;
    local l_Stylizer_0 = l_props_0.Stylizer;
    return v2.createElement("Frame", {
        BackgroundColor3 = l_Stylizer_0.uploadResult.background, 
        BackgroundTransparency = 0, 
        BorderSizePixel = 0, 
        Size = l_props_0.Size
    }, {
        ModelPreview = v2.createElement(v9, {
            title = l_props_0.assetName, 
            titleHeight = 24, 
            titlePadding = 12, 
            Position = UDim2.new(0.5, -75, 0, 48), 
            Size = UDim2.new(0, 150, 0, 186)
        }), 
        LoadingResultSuccess = l_props_0.uploadSucceeded and v2.createElement("Frame", {
            Position = UDim2.new(0, 0, 0, 279), 
            Size = UDim2.new(1, 0, 1, -279), 
            BackgroundTransparency = 1
        }, {
            Title = v2.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Position = UDim2.new(0.5, -200, 0, 0), 
                Size = UDim2.new(0, 400, 0, 36), 
                Text = l_Localization_0:getText("General", "SuccessfullyConverted"), 
                Font = v7.FONT, 
                TextColor3 = l_Stylizer_0.uploadResult.successText, 
                TextSize = v7.FONT_SIZE_TITLE, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center
            }), 
            Rows = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 400, 0, 72), 
                Position = UDim2.new(0.5, -200, 0, 49)
            }, {
                UIListLayout = v2.createElement("UIListLayout", {
                    Padding = UDim.new(0, 12), 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                ModerationMessage = v2.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    Font = v7.FONT, 
                    Text = l_Localization_0:getText("General", "YouMayFindPackagesInToolbox"), 
                    TextColor3 = l_Stylizer_0.uploadResult.text, 
                    TextSize = v7.FONT_SIZE_MEDIUM, 
                    Size = UDim2.new(1, 0, 0, 24), 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    LayoutOrder = 0
                })
            })
        }), 
        LoadingResultFailure = not l_props_0.uploadSucceeded and v2.createElement("Frame", {
            Position = UDim2.new(0, 0, 0, 279), 
            Size = UDim2.new(1, 0, 1, -279), 
            BackgroundTransparency = 1
        }, {
            Title = v2.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Font = v7.FONT, 
                Position = UDim2.new(0.5, -200, 0, 0), 
                Size = UDim2.new(0, 400, 0, 36), 
                Text = l_Localization_0:getText("General", "ConvertToPackageFailed"), 
                TextColor3 = l_Stylizer_0.uploadResult.text, 
                TextSize = v7.FONT_SIZE_TITLE, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center
            }), 
            Reason = v2.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Font = v7.FONT, 
                Position = UDim2.new(0.5, -200, 0, 49), 
                Size = UDim2.new(0, 400, 0, 72), 
                Text = l_props_0.networkError.responseBody, 
                TextWrapped = true, 
                TextColor3 = l_Stylizer_0.uploadResult.text, 
                TextSize = v7.FONT_SIZE_MEDIUM, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Top
            })
        }), 
        Footer = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 0, 1, -80), 
            Size = UDim2.new(1, 0, 0, 80)
        }, {
            CloseButton = v2.createElement(l_Button_0, {
                LayoutOrder = 0, 
                OnClick = l_props_0.onClose, 
                Position = UDim2.new(0.5, -60, 0.5, -16), 
                Size = UDim2.new(0, 120, 0, 32), 
                Style = "Round", 
                Text = l_Localization_0:getText("Action", "Close")
            })
        })
    });
end;
return v3.connect(function(v17, _)
    v17 = v17 or {};
    return {
        assetId = v17.AssetConfigReducer.assetId, 
        assetName = v17.AssetConfigReducer.assetName, 
        uploadSucceeded = v17.AssetConfigReducer.uploadSucceeded, 
        networkError = v17.NetworkReducer.networkError, 
        assetConfigData = v17.AssetConfigReducer.assetConfigData, 
        assetTypeEnum = v17.AssetConfigReducer.assetTypeEnum
    };
end, function(_)
    return {};
end)((l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v10)));
