local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_Button_0 = l_UI_0.Button;
local l_HoverArea_0 = l_UI_0.HoverArea;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_TitledFrame_0 = l_UI_0.TitledFrame;
local v12 = require(l_Parent_0.Src.ContextServices.AnalyticsContext);
local v13 = v1.PureComponent:extend("ImageLocalizationSection");
local l_HttpService_0 = game:GetService("HttpService");
local function v18(v15)
    l_HttpService_0:RequestInternal({
        Url = "https://apis.sitetest1.robloxlabs.com/image-localization-api/v1/image-localization/ingest", 
        Method = "POST", 
        Headers = {
            ["Content-Type"] = "application/json"
        }, 
        Body = v15
    }):Start(function(v16, v17)
        if v16 then
            if v17.Success then
                return ;
            else
                warn("Error returned: " .. v17.StatusCode .. " " .. v17.StatusMessage .. " " .. v17.Body);
                return ;
            end;
        else
            warn("Error on request: " .. v17);
            return ;
        end;
    end);
end;
local function _(v19)
    v18((l_HttpService_0:JSONEncode({
        assetIds = v19, 
        universeId = game.GameId
    })));
end;
local function v24()
    local v21 = {};
    for _, v23 in pairs(workspace:GetDescendants()) do
        if not (not v23:IsA("ImageLabel") and not v23:IsA("ImageButton")) then
            table.insert(v21, v23.Image);
        end;
    end;
    if #v21 > 0 then
        v18((l_HttpService_0:JSONEncode({
            assetIds = v21, 
            universeId = game.GameId
        })));
    end;
end;
v13.init = function(v25)
    v25.uploadImageAssetIds = function()
        v24();
    end;
end;
v13.render = function(v26)
    if game:GetFastFlag("ImageLocalizationFeatureEnabled") then
        local l_props_0 = v26.props;
        local l_Stylizer_0 = l_props_0.Stylizer;
        local l_Localization_0 = l_props_0.Localization;
        return v1.createElement(l_Pane_0, {
            LayoutOrder = l_props_0.LayoutOrder, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Padding = {
                Top = l_Stylizer_0.PaddingTop
            }, 
            Spacing = l_Stylizer_0.Spacing
        }, {
            SectionLabel = v1.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = 1, 
                Style = "Label", 
                Text = l_Localization_0:getText("ImageLocalizationSection", "SectionLabel")
            }), 
            Content = v1.createElement(l_Pane_0, {
                LayoutOrder = 2, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                Padding = {
                    Top = l_Stylizer_0.PaddingTop, 
                    Left = l_Stylizer_0.LeftIndent
                }
            }, {
                Upload = v1.createElement(l_TitledFrame_0, {
                    Title = l_Localization_0:getText("ImageLocalizationSection", "UploadButtonLabel"), 
                    TitleWidth = l_Stylizer_0.LabelWidth
                }, {
                    ButtonContainer = v1.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(0, l_Stylizer_0.ButtonWidth, 1, 0)
                    }, {
                        Button = v1.createElement(l_Button_0, {
                            AnchorPoint = Vector2.new(0.5, 0.5), 
                            OnClick = v26.uploadImageAssetIds, 
                            Position = UDim2.new(0.5, 0, 0.5, 0), 
                            Size = UDim2.new(1, 0, 0, l_Stylizer_0.ButtonHeight), 
                            Style = "TextButton", 
                            Text = l_Localization_0:getText("ImageLocalizationSection", "UploadButton")
                        }, {
                            v1.createElement(l_HoverArea_0, {
                                Cursor = "PointingHand"
                            })
                        })
                    })
                })
            })
        });
    else
        return ;
    end;
end;
return v2.connect(function(v30, _)
    return {
        IsBusy = v30.CloudTable.IsBusy
    };
end)((l_withContext_0({
    Plugin = l_ContextServices_0.Plugin, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Analytics = v12
})(v13)));
