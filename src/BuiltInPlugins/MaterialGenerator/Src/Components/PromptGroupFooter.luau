local l_script_FirstAncestor_0 = script:FindFirstAncestor("MaterialGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.MaterialFramework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local l_ContextServices_0 = v1.ContextServices;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = l_ContextServices_0.Stylizer;
local l_UI_0 = v1.UI;
local l_Button_0 = l_UI_0.Button;
local l_Image_0 = l_UI_0.Image;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_StudioServices_0 = v2.Context.StudioServices;
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
return function(v14)
    local v15 = v3.useRef(nil);
    v3.useEffect(function()
        return function()
            if v15.current ~= nil then
                task.cancel(v15.current);
                v15.current = nil;
            end;
        end;
    end, {});
    local v16 = l_Stylizer_0:use("PromptGroupFooter");
    local v17 = l_StudioServices_0.use();
    local v18 = l_Localization_0.use();
    local v19, v20 = v3.useState(false);
    local v21 = if not v19 then v18:getText("PromptGroupFooter", "CopyPrompt") else v18:getText("PromptGroupFooter", "CopyPromptCopied");
    local v22 = v16.ButtonSize.X.Offset * 1 + v16.ButtonSpacing * 0;
    return v3.createElement(l_Pane_0, {
        BackgroundColor = v16.BackgroundColor, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Layout = Enum.FillDirection.Horizontal, 
        Padding = v16.Padding, 
        Position = v14.Position, 
        Size = v14.Size, 
        Style = v16.Style
    }, {
        PromptLabel = v3.createElement(l_TextLabel_0, {
            LayoutOrder = 1, 
            Size = UDim2.new(1, -v22, 1, 0), 
            Text = v14.Text or "", 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextSelectable = false, 
            TextWrapped = false, 
            TextColor = v16.TextColor
        }), 
        PromptGroupButtons = v3.createElement(l_Pane_0, {
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Layout = Enum.FillDirection.Horizontal, 
            LayoutOrder = 2, 
            Size = UDim2.new(0, v22, 1, 0), 
            Spacing = v16.ButtonSpacing
        }, {
            CopyPromptButton = v3.createElement(l_Button_0, {
                Size = v16.ButtonSize, 
                Style = "RoundSubtle", 
                Tooltip = v21, 
                OnClick = v3.useCallback(function()
                    if v14.Text == "" then
                        return ;
                    else
                        local l_status_0, l_result_0 = pcall(function()
                            v17:getService("StudioService"):CopyToClipboard(v14.Text);
                        end);
                        v20(true);
                        if v15.current then
                            task.cancel(v15.current);
                            v15.current = nil;
                        end;
                        v15.current = task.delay(1, function()
                            v20(false);
                        end);
                        if not l_status_0 then
                            warn(l_result_0);
                        end;
                        return ;
                    end;
                end, {
                    v14.Text
                })
            }, {
                Icon = v3.createElement(l_Image_0, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    ImageColor3 = v16.ButtonColor, 
                    Image = v16.CopyPromptButtonImage, 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    Size = v16.ButtonImageSize
                })
            })
        })
    });
end;
