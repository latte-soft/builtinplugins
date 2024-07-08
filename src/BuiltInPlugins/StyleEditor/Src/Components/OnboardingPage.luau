local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_GuiService_0 = game:GetService("GuiService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Parent_0 = script.Parent.Parent.Parent;
local v4 = require(l_Parent_0.Packages.React);
local l_useEffect_0 = v4.useEffect;
local l_UI_0 = require(l_Parent_0.Packages.Framework).UI;
local l_DropShadow_0 = l_UI_0.DropShadow;
local l_IconButton_0 = l_UI_0.IconButton;
local l_Image_0 = l_UI_0.Image;
local l_LinkText_0 = l_UI_0.LinkText;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local v14 = require(l_Parent_0.Src.Util.createBlankSystem);
local v15 = require(l_Parent_0.Src.Util.recordChange)(l_ChangeHistoryService_0);
local v16 = require(l_Parent_0.Src.Resources.ModernIcons);
local v17 = require(l_Parent_0.Src.Resources.Telemetry.OnboardingLearnLinkClickedEvent);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v19 = require(l_Actions_0.Window.SetRootRoute);
local v20 = require(l_Actions_0.Window.SetDesignSheet);
local v21 = require(l_Parent_0.Src.Thunks.Telemetry.SendTelemetryEvent);
local v22 = require(l_Parent_0.Src.Hooks.useFrameworkContext);
local v23 = require(l_Parent_0.Src.Hooks.useDispatch);
return function()
    local v24 = v23();
    local l_Localization_0 = v22().Localization;
    local function v26()
        v24(v19("Main"));
    end;
    local function v28()
        local v27 = nil;
        v15({
            Name = "StyleEditor.CreateDesignSystem", 
            DisplayName = "Style Editor - Create Design", 
            DoChange = function()
                v27 = v14();
                v27.Parent = l_ReplicatedStorage_0;
                return Enum.FinishRecordingOperation.Commit;
            end
        });
        v24(v20(v27.Design));
        v24(v19("Main"));
    end;
    local function v29()
        l_GuiService_0:OpenBrowserWindow("https://devforum.roblox.com/");
        v24(v21(v17()));
    end;
    l_useEffect_0(function()
        for _, v31 in l_ReplicatedStorage_0:GetDescendants() do
            if v31:IsA("StyleSheet") and v31:GetAttribute("StyleCategory") == "Designs" then
                v24(v20(v31));
                v24(v19("Main"));
                break;
            end;
        end;
        local v33 = l_ReplicatedStorage_0.DescendantAdded:Connect(function(v32)
            if v32:IsA("StyleSheet") then
                v24(v19("Main"));
            end;
        end);
        return function()
            if v33 then
                v33:Disconnect();
            end;
        end;
    end, {});
    return v4.createElement(l_DropShadow_0, {
        AutomaticSize = Enum.AutomaticSize.XY, 
        Size = UDim2.fromScale(0, 0)
    }, {
        Column = v4.createElement(l_Pane_0, {
            [v4.Tag] = "OnboardingPage X-ColumnM X-Fit X-PadL"
        }, {
            CloseContainer = v4.createElement(l_Pane_0, {
                LayoutOrder = 1, 
                [v4.Tag] = "X-FitY"
            }, {
                Close = v4.createElement(l_IconButton_0, {
                    Cursor = "PointingHand", 
                    LeftIcon = {
                        Image = v16.close(), 
                        [v4.Tag] = "Icon22"
                    }, 
                    OnClick = v26, 
                    [v4.Tag] = "Compact IconOnly PositionRight"
                })
            }), 
            StylingImage = v4.createElement(l_Image_0, {
                Image = v16.onboarding(), 
                LayoutOrder = 2
            }), 
            Title = v4.createElement(l_TextLabel_0, {
                LayoutOrder = 3, 
                Text = l_Localization_0:getText("Onboarding", "Title"), 
                [v4.Tag] = "Subtitle X-Fit"
            }), 
            Description = v4.createElement(l_TextLabel_0, {
                LayoutOrder = 4, 
                Text = l_Localization_0:getText("Onboarding", "Description"), 
                [v4.Tag] = "TextXAlignLeft X-FitY"
            }), 
            ButtonContainer = v4.createElement(l_Pane_0, {
                LayoutOrder = 5
            }, {
                Link = v4.createElement(l_LinkText_0, {
                    OnClick = v29, 
                    Text = l_Localization_0:getText("Onboarding", "LearnMore")
                }), 
                BlankButton = v4.createElement(l_IconButton_0, {
                    Cursor = "PointingHand", 
                    OnClick = v28, 
                    Text = l_Localization_0:getText("Onboarding", "CreateDesign"), 
                    [v4.Tag] = "PositionRight PrimaryBrand"
                })
            })
        })
    });
end;
