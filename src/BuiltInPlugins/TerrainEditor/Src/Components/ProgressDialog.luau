local _ = game:GetService("UserInputService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Localization_0 = v3.ContextServices.Localization;
local l_Stylizer_0 = v3.ContextServices.Stylizer;
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_LoadingBar_0 = l_UI_0.LoadingBar;
local l_StyledDialog_0 = l_UI_0.StyledDialog;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_LayoutOrderIterator_0 = v3.Util.LayoutOrderIterator;
local _ = require(l_script_FirstAncestor_0.Src.Hooks.useOperation);
local v13 = require(l_script_FirstAncestor_0.Src.Util.FormatTimeRemaining);
local l_DialogOption_0 = require(l_script_FirstAncestor_0.Src.Types).DialogOption;
return function(v15)
    local v16 = l_Stylizer_0:use("ProgressDialog");
    local v17 = l_Localization_0:use();
    local v18 = l_LayoutOrderIterator_0.new();
    local v19 = {};
    if not (not v15.OnPause or not v15.OnResume) then
        if not v15.Paused then
            table.insert(v19, {
                Key = l_DialogOption_0.Pause, 
                Text = v17:getText("Dialog", l_DialogOption_0.Pause)
            });
        else
            table.insert(v19, {
                Key = l_DialogOption_0.Resume, 
                Text = v17:getText("Dialog", l_DialogOption_0.Resume)
            });
        end;
    end;
    if v15.OnCancel then
        table.insert(v19, {
            Key = l_DialogOption_0.Cancel, 
            Text = v17:getText("Dialog", l_DialogOption_0.Cancel)
        });
    end;
    return v2.createElement(l_StyledDialog_0, {
        Enabled = v15.Enabled, 
        Modal = false, 
        Title = v15.Title, 
        MinContentSize = v16.MinContentSize, 
        Buttons = v19, 
        OnButtonPressed = function(v20)
            if not (v20 == l_DialogOption_0.Pause) or not v15.OnPause then
                if not (v20 == l_DialogOption_0.Resume) or not v15.OnResume then
                    if not (not (v20 == l_DialogOption_0.Cancel) or not v15.OnCancel) then
                        v15.OnCancel();
                    end;
                    return ;
                else
                    v15.OnResume();
                    return ;
                end;
            else
                v15.OnPause();
                return ;
            end;
        end, 
        OnClose = v15.OnClose
    }, {
        Contents = v2.createElement(l_Pane_0, {
            Layout = Enum.FillDirection.Vertical, 
            Padding = v16.Padding, 
            Size = UDim2.fromScale(1, 1), 
            Spacing = v16.Spacing
        }, {
            Description = v2.createElement(l_TextLabel_0, {
                LayoutOrder = v18:getNextOrder(), 
                Size = UDim2.new(1, 0, 0, v16.DescriptionHeight), 
                Text = v15.Description
            }), 
            Progress = v2.createElement(l_LoadingBar_0, {
                LayoutOrder = v18:getNextOrder(), 
                Progress = v15.Progress, 
                Size = UDim2.new(1, 0, 0, v16.ProgressHeight)
            }), 
            Time = if not v15.TimeRemaining then nil else v2.createElement(l_TextLabel_0, {
                LayoutOrder = v18:getNextOrder(), 
                Size = UDim2.new(1, 0, 0, v16.DescriptionHeight), 
                Text = v17:getText("Dialog", "TimeRemaining", {
                    Time = v13(v15.TimeRemaining, v17)
                })
            })
        })
    });
end;
