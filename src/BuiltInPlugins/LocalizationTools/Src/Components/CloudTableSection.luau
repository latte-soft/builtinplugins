local v0 = game:DefineFastFlag("LocalizationToolsFixCloudLabel", false);
local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v3 = require(l_Parent_0.Packages.Roact);
local v4 = require(l_Parent_0.Packages.RoactRodux);
local v5 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v5.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v5.UI;
local l_LinkText_0 = l_UI_0.LinkText;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v12 = require(l_Parent_0.Src.ContextServices.AnalyticsContext);
local v13 = require(l_Parent_0.Src.Components.LabeledTextButton);
local v14 = require(l_Parent_0.Src.Components.Collapsible);
local v15 = require(l_Parent_0.Src.Util.isEmpty);
local v16 = require(l_Parent_0.Src.Util.ShowDialog);
local v17 = require(l_Parent_0.Src.Thunks.DownloadCloudTable);
local v18 = require(l_Parent_0.Src.Thunks.UploadCloudTable);
local v19 = v3.PureComponent:extend("CloudTableSection");
v19.init = function(v20)
    v20.downloadCloudTable = function()
        local l_props_0 = v20.props;
        l_props_0.DownloadAndSaveCloudTable(l_props_0.API:get(), l_props_0.Localization, l_props_0.Analytics:get(), l_props_0.CloudTableId);
    end;
    v20.updateCloudTable = function(v22)
        local l_props_1 = v20.props;
        local v24 = l_props_1.Plugin:get();
        local v25 = l_props_1.API:get();
        local l_Localization_0 = l_props_1.Localization;
        l_props_1.UpdateCloudTable(v25, l_Localization_0, l_props_1.Analytics:get(), v16(v24, l_Localization_0, l_props_1.Stylizer, l_props_1.Mouse), v22);
    end;
    v20.openLocalizationSettings = function()
        local l_props_2 = v20.props;
        if not l_props_2.IsBusy then
            l_GuiService_0:OpenBrowserWindow((l_props_2.API:get().WWW.Localization.games(game.GameId):getUrl()));
            return ;
        else
            return ;
        end;
    end;
end;
v19.render = function(v28)
    local l_props_3 = v28.props;
    local l_Stylizer_0 = l_props_3.Stylizer;
    local l_Localization_1 = l_props_3.Localization;
    local l_LayoutOrder_0 = l_props_3.LayoutOrder;
    local v33 = not l_props_3.IsBusy;
    local v34 = ((not v15(l_props_3.AllLanguages) and not v15(l_props_3.LocalesToLanguages)) and l_props_3.CanManageTranslation) and l_props_3.CloudTableId ~= "";
    local _ = nil;
    return v3.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Layout = Enum.FillDirection.Vertical, 
        LayoutOrder = l_LayoutOrder_0
    }, {
        Padding = v3.createElement("UIPadding", {
            PaddingTop = UDim.new(0, l_Stylizer_0.PaddingTop)
        }), 
        SectionLabel = v3.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = 1, 
            Style = "Subtitle", 
            Text = l_Localization_1:getText("CloudTableSection", "SectionLabel")
        }), 
        Content = if not v34 then v3.createElement(not v0 and "Frame" or l_Pane_0, {
            Size = UDim2.new(1, 0, 0, l_Stylizer_0.PublishMessageHeight), 
            BackgroundColor3 = l_Stylizer_0.MessageFrameBackground, 
            BackgroundTransparency = 0, 
            BorderSizePixel = 1, 
            BorderColor3 = l_Stylizer_0.MessageFrameBorder, 
            LayoutOrder = 2, 
            Layout = if not v0 then nil else Enum.FillDirection.Vertical
        }, {
            PublishPlaceMessage = v3.createElement(l_TextLabel_0, {
                AnchorPoint = if not v0 then Vector2.new(0.5, 0.5) else nil, 
                AutomaticSize = if not v0 then Enum.AutomaticSize.XY else Enum.AutomaticSize.Y, 
                Position = if not v0 then UDim2.new(0.5, 0, 0.5, 0) else nil, 
                Size = if not v0 then nil else UDim2.fromScale(1, 0), 
                Text = l_Localization_1:getText("CloudTableSection", "PublishPlaceMessage"), 
                TextWrapped = not not v0 or nil
            })
        }) else v3.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = 2
        }, {
            Padding = v3.createElement("UIPadding", {
                PaddingTop = UDim.new(0, l_Stylizer_0.PaddingTop), 
                PaddingLeft = UDim.new(0, l_Stylizer_0.LeftIndent)
            }), 
            Download = v3.createElement(v13, {
                Active = v33, 
                ButtonText = l_Localization_1:getText("CloudTableSection", "DownloadButton"), 
                LabelText = l_Localization_1:getText("CloudTableSection", "DownloadTableLabel"), 
                LayoutOrder = 1, 
                OnButtonClick = v28.downloadCloudTable
            }), 
            Update = v3.createElement(v13, {
                Active = v33, 
                ButtonText = l_Localization_1:getText("CloudTableSection", "UpdateButton"), 
                LabelText = l_Localization_1:getText("CloudTableSection", "UpdateTableLabel"), 
                LayoutOrder = 2, 
                OnButtonClick = function()
                    v28.updateCloudTable(false);
                end
            }), 
            Collapsible = v3.createElement(v14, {
                Active = v33, 
                LayoutOrder = 3, 
                RenderContent = function()
                    return v3.createElement(v13, {
                        Active = v33, 
                        ButtonText = l_Localization_1:getText("CloudTableSection", "ReplaceButton"), 
                        LabelText = l_Localization_1:getText("CloudTableSection", "ReplaceTableLabel"), 
                        LayoutOrder = 2, 
                        OnButtonClick = function()
                            v28.updateCloudTable(true);
                        end
                    });
                end, 
                Title = l_Localization_1:getText("CloudTableSection", "AdvancedButton")
            }), 
            LinkTextFrame = v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 4, 
                Size = UDim2.new(1, 0, 0, l_Stylizer_0.LinkTextHeight)
            }, {
                LinkText = v3.createElement(l_LinkText_0, {
                    AnchorPoint = Vector2.new(0, 0.5), 
                    Position = UDim2.new(0, 0, 0.5, 0), 
                    OnClick = v28.openLocalizationSettings, 
                    Text = l_Localization_1:getText("CloudTableSection", "CloudTablePageLinkText")
                })
            })
        })
    });
end;
return v4.connect(function(v36, _)
    return {
        AllLanguages = v36.PluginMetadata.AllLanguages, 
        LocalesToLanguages = v36.PluginMetadata.LocalesToLanguages, 
        CanManageTranslation = v36.PluginMetadata.CanManageTranslation, 
        CloudTableId = v36.PluginMetadata.CloudTableId, 
        IsBusy = v36.CloudTable.IsBusy
    };
end, function(v38)
    return {
        DownloadAndSaveCloudTable = function(v39, v40, v41, v42)
            v38(v17.DownloadAndSave(v39, v40, v41, v42));
        end, 
        UpdateCloudTable = function(v43, v44, v45, v46, v47)
            v38(v18(v43, v44, v45, v46, v47));
        end
    };
end)((l_withContext_0({
    Plugin = l_ContextServices_0.Plugin, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    API = l_ContextServices_0.API, 
    Mouse = l_ContextServices_0.Mouse, 
    Analytics = v12
})(v19)));
