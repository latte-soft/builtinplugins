local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local l_UI_0 = require(l_Parent_0.Packages.Framework).UI;
local l_Pane_0 = l_UI_0.Pane;
local l_Button_0 = l_UI_0.Button;
local l_Checkbox_0 = l_UI_0.Checkbox;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_DEPRECATED_TextInput_0 = l_UI_0.DEPRECATED_TextInput;
local v8 = require(script.Parent.multipleFBXimporter);
local v9 = require(script.Parent.setTestAvatarBody);
local l_Dialog_0 = l_UI_0.Dialog;
local l_LoadingBar_0 = l_UI_0.LoadingBar;
local v12 = v1.PureComponent:extend("importUIComponent");
v12.init = function(v13)
    v13.state = {
        keepBody = false, 
        enabled = false, 
        objectName = "", 
        canceled = false, 
        completed = false, 
        progress = 0
    };
    v13.bundleIDs = "";
    v13.setKeepBody = function(v14)
        v13:setState({
            [v14] = not v13.state[v14]
        });
    end;
    v13.close = function()
        v13:setState({
            enabled = false
        });
    end;
    v13.cancelUploadProcess = function()
        v13:setState({
            canceled = true
        });
        print("Cancel");
    end;
    v13.importAvatars = function()
        v8.importAvatars(v13);
    end;
    v13.changeAvatarBody = function()
        v9(v13);
    end;
end;
v12.render = function(v15)
    local l_createElement_0 = v1.createElement;
    local l_l_Pane_0_0 = l_Pane_0;
    local v18 = {
        BackgroundColor = Color3.fromRGB(100, 100, 100), 
        Layout = Enum.FillDirection.Vertical, 
        LayoutOrder = 1
    };
    local v19 = {};
    local l_createElement_1 = v1.createElement;
    local l_l_Pane_0_1 = l_Pane_0;
    local v22 = {
        Padding = 5, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        LayoutOrder = 1, 
        Layout = Enum.FillDirection.Horizontal
    };
    local v23 = {};
    local l_createElement_2 = v1.createElement;
    local l_l_Button_0_0 = l_Button_0;
    local v26 = {
        OnClick = v15.importAvatars, 
        Style = "RoundPrimary", 
        Size = UDim2.fromOffset(200, 70), 
        Text = "Import Avatars", 
        LayoutOrder = 1
    };
    local v27 = {};
    local v28 = false;
    if v15.state.enabled == true then
        v28 = v1.createElement(l_Dialog_0, {
            Title = "Uploading", 
            Enabled = v15.state.enabled, 
            Size = Vector2.new(350, 90), 
            OnClose = v15.close, 
            Modal = true
        }, {
            v1.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                Position = UDim2.new(0, 0, 0, 0), 
                BackgroundColor3 = Color3.fromRGB(100, 100, 100), 
                LayoutOrder = 1
            }, {
                UIListLayout = v1.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    Padding = UDim.new(0, 10)
                }); 
                v1.createElement(l_TextLabel_0, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Text = v15.state.objectName, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1
                }), 
                v1.createElement(l_LoadingBar_0, {
                    LayoutOrder = 2, 
                    Size = UDim2.fromOffset(150, 10), 
                    Progress = v15.state.progress
                }), 
                v1.createElement(l_Button_0, {
                    OnClick = v15.cancelUploadProcess, 
                    Style = "Round", 
                    Size = UDim2.fromOffset(90, 20), 
                    Text = "Cancel", 
                    LayoutOrder = 3
                })
            })
        });
    end;
    v27.progressWindow = v28;
    v23.Button = l_createElement_2(l_l_Button_0_0, v26, v27);
    v19.First = l_createElement_1(l_l_Pane_0_1, v22, v23);
    v19.Second = v1.createElement(l_Pane_0, {
        Padding = 10, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        LayoutOrder = 2
    }, {
        v1.createElement(l_Checkbox_0, {
            Checked = v15.state.keepBody, 
            Key = "keepBody", 
            LayoutOrder = 1, 
            OnClick = v15.setKeepBody, 
            Text = "Keep body"
        })
    });
    v19.Third = v1.createElement(l_Pane_0, {
        Padding = 10, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        LayoutOrder = 3, 
        Layout = Enum.FillDirection.Vertical
    }, {
        Button2 = v1.createElement(l_Button_0, {
            OnClick = v15.changeAvatarBody, 
            Style = "RoundPrimary", 
            Size = UDim2.fromOffset(200, 30), 
            Text = "Change Avatar Body", 
            LayoutOrder = 1
        })
    });
    v19.Fourth = v1.createElement(l_Pane_0, {
        Padding = 10, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        LayoutOrder = 4, 
        Layout = Enum.FillDirection.Vertical
    }, {
        v1.createElement(l_DEPRECATED_TextInput_0, {
            Size = UDim2.fromOffset(200, 30), 
            Style = "FilledRoundedBorder", 
            PlaceholderText = "Input avatar bundle ID here", 
            OnTextChanged = function(v29)
                v15.bundleIDs = v29;
            end, 
            LayoutOrder = 1
        })
    });
    return l_createElement_0(l_l_Pane_0_0, v18, v19);
end;
return v12;
