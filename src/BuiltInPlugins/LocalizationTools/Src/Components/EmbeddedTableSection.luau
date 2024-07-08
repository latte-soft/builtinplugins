local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v4.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v10 = require(l_Parent_0.Src.ContextServices.AnalyticsContext);
local v11 = require(l_Parent_0.Src.Components.LabeledImageButton);
local v12 = require(l_Parent_0.Src.Util.EmbeddedTableUtil);
local l_game_EngineFeature_0 = game:GetEngineFeature("EnableLocalizedLocalizationToolsErrorsApi");
local v14 = v2.PureComponent:extend("EmbeddedTableSection");
v14.init = function(v15)
    v15.toggleTextScraperEnabled = function()
        v12.toggleTextScraperEnabled((v15.props.Analytics:get()));
        v15:setState({});
    end;
end;
v14.render = function(v16)
    local l_props_0 = v16.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Localization_0 = l_props_0.Localization;
    local v20 = l_props_0.Analytics:get();
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local v22 = not l_props_0.IsBusy;
    local l_IsTextScraperRunning_0 = l_LocalizationService_0.IsTextScraperRunning;
    return v2.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Layout = Enum.FillDirection.Vertical, 
        LayoutOrder = l_LayoutOrder_0
    }, {
        Padding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, l_Stylizer_0.PaddingTop * 2)
        }), 
        SectionLabel = v2.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = 1, 
            Text = l_Localization_0:getText("EmbeddedTableSection", "SectionLabel"), 
            Style = "Subtitle"
        }), 
        Container = v2.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = 2
        }, {
            Padding = v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, l_Stylizer_0.PaddingTop), 
                PaddingLeft = UDim.new(0, l_Stylizer_0.LeftIndent)
            }), 
            TextCapture = v2.createElement(v11, {
                Active = v22, 
                ButtonText = l_Localization_0:getText("EmbeddedTableSection", "TextCaptureButton"), 
                ButtonImage = not not l_IsTextScraperRunning_0 and l_Stylizer_0.TextCaptureButtonImage.On or l_Stylizer_0.TextCaptureButtonImage.Off, 
                LabelText = not not l_IsTextScraperRunning_0 and l_Localization_0:getText("EmbeddedTableSection", "TextCaptureStopText") or l_Localization_0:getText("EmbeddedTableSection", "TextCaptureStartText"), 
                LayoutOrder = 1, 
                OnButtonClick = v16.toggleTextScraperEnabled
            }), 
            Export = v2.createElement(v11, {
                Active = v22, 
                ButtonText = l_Localization_0:getText("EmbeddedTableSection", "ExportButton"), 
                ButtonImage = l_Stylizer_0.ExportButtonImage, 
                LabelText = l_Localization_0:getText("EmbeddedTableSection", "ExportTextLabel"), 
                LayoutOrder = 2, 
                OnButtonClick = function()
                    v12.promptExportToCSVs(v20);
                end
            }), 
            Import = v2.createElement(v11, {
                Active = v22, 
                ButtonText = l_Localization_0:getText("EmbeddedTableSection", "ImportButton"), 
                ButtonImage = l_Stylizer_0.ImportButtonImage, 
                LabelText = l_Localization_0:getText("EmbeddedTableSection", "ImportTextLabel"), 
                LayoutOrder = 3, 
                OnButtonClick = function()
                    if not l_game_EngineFeature_0 then
                        v12.promptImportFromCSVs_deprecated(v20);
                        return ;
                    else
                        v12.promptImportFromCSVs(v20, l_Localization_0);
                        return ;
                    end;
                end
            })
        })
    });
end;
return v3.connect(function(v24, _)
    return {
        IsBusy = v24.CloudTable.IsBusy
    };
end)((l_withContext_0({
    Plugin = l_ContextServices_0.Plugin, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Analytics = v10
})(v14)));
