local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v4 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v5 = require(l_script_FirstAncestor_0.Src.Utility.GetLocalizedString);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v1.Style.Stylizer;
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v14 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportEnableMultipleFiles);
local v15 = v2.PureComponent:extend("FailureWidget");
local function v25(v16, v17, v18, v19)
    local v20 = {};
    for v21, v22 in pairs(v16) do
        local _ = nil;
        local _ = nil;
        table.insert(v20, (v2.createElement(l_TextLabel_0, {
            LayoutOrder = #v20 + 1, 
            Text = ("%*: %*"):format(v21, if v22 == "500" and v18:GetImportTree().ExistingPackageId ~= "" then v5(v19, "HttpError", "PackageError") else v5(v19, "HttpError", v22) or string.format("%s %s", v19:getText("HttpError", "UnknownStatusCode"), v22)), 
            TextSize = v17.SubtextSize, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.fromScale(1, 0), 
            HorizontalAlignment = if not v14() then Enum.HorizontalAlignment.Center else nil
        })));
    end;
    return v20;
end;
v15.render = function(v26)
    local l_props_0 = v26.props;
    local l_Localization_1 = v26.props.Localization;
    local l_UploadWidget_0 = l_props_0.Stylizer.UploadWidget;
    local l_ErrorMap_0 = l_props_0.ErrorMap;
    local v31 = not not v4.isEmpty(l_ErrorMap_0) and l_Localization_1:getText("Upload", "FailureDescriptionNoError") or l_Localization_1:getText("Upload", "FailureDescription");
    local v32 = v25(l_ErrorMap_0, l_UploadWidget_0, l_props_0.AssetImportSession, l_Localization_1);
    local v33 = (l_UploadWidget_0.TextSize + l_UploadWidget_0.SubtextSize) + 10;
    return v2.createElement(l_Pane_0, {
        LayoutOrder = 1, 
        Layout = Enum.FillDirection.Vertical, 
        VerticalAlignment = Enum.VerticalAlignment.Top
    }, {
        Title = v2.createElement(l_Pane_0, {
            Layout = Enum.FillDirection.Vertical, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Size = UDim2.new(1, 0, 0, v33), 
            LayoutOrder = 1
        }, {
            Text = v2.createElement(l_TextLabel_0, {
                LayoutOrder = 1, 
                Size = l_UploadWidget_0.TextLabelSize, 
                Text = l_Localization_1:getText("Upload", "Failure"), 
                TextSize = l_UploadWidget_0.TextSize, 
                TextXAlignment = l_UploadWidget_0.TextAlignment, 
                TextColor = l_UploadWidget_0.FailureColor
            }), 
            Description = v2.createElement(l_TextLabel_0, {
                LayoutOrder = 2, 
                Size = l_UploadWidget_0.TextLabelSize, 
                Text = v31, 
                TextSize = l_UploadWidget_0.SubtextSize, 
                TextXAlignment = l_UploadWidget_0.TextAlignment
            })
        }), 
        ErrorMap = v2.createElement(l_Pane_0, {
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = 2, 
            Size = UDim2.new(1, -40, 1, -v33), 
            HorizontalAlignment = Enum.HorizontalAlignment.Center
        }, {
            ScrollingFrame = v2.createElement(l_ScrollingFrame_0, {
                LayoutOrder = 1, 
                Size = UDim2.new(1, 0, 1, 0), 
                CanvasSize = UDim2.fromScale(1, 0), 
                OnCanvasResize = v26.onContentResize, 
                ScrollingDirection = Enum.ScrollingDirection.Y, 
                AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                Layout = Enum.FillDirection.Vertical
            }, {
                Pane = v2.createElement(l_Pane_0, {
                    Size = l_UploadWidget_0.TextLabelSize, 
                    Layout = Enum.FillDirection.Vertical, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    LayoutOrder = 1, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center
                }, v32)
            })
        })
    });
end;
return v3.connect(function(v34)
    return {
        AssetImportSession = v34.Preview.assetImportSession
    };
end, function(_)
    return {};
end)((l_withContext_0({
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v15)));
