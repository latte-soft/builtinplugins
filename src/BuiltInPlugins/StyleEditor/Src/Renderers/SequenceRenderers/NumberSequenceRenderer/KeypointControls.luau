local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local l_useContext_0 = v1.useContext;
local l_join_0 = require(l_Parent_0.Packages.Dash).join;
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_IconButton_0 = v4.UI.IconButton;
local l_Pane_0 = v4.UI.Pane;
local v8 = require(l_Parent_0.Src.Resources.ModernIcons);
local v9 = require(l_Parent_0.Src.Renderers.SequenceRenderers.LabelCell);
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Renderers.SequenceRenderers.Types);
local v12 = {
    Type = "Number", 
    Min = 0, 
    Max = 1
};
return function(v13)
    local v14 = l_useContext_0(l_ContextServices_0.Context.Consumer)[l_ContextServices_0.Localization.Key];
    local function _(v15)
        return function(v16)
            v13.OnEdit(l_join_0(v13.Keypoint, {
                [v15] = v16
            }));
        end;
    end;
    local l_createElement_0 = v1.createElement;
    local l_l_Pane_0_0 = l_Pane_0;
    local v20 = {
        LayoutOrder = v13.LayoutOrder, 
        [v1.Tag] = "X-Center X-Middle X-RowM X-Fit"
    };
    local v21 = {};
    local l_createElement_1 = v1.createElement;
    local l_l_Pane_0_1 = l_Pane_0;
    local v24 = {
        LayoutOrder = 1, 
        [v1.Tag] = "X-Left X-Pad X-RowM X-Fit"
    };
    local v25 = {};
    local l_createElement_2 = v1.createElement;
    local l_v9_0 = v9;
    local v28 = {
        LayoutOrder = 1, 
        Text = v14:getText("Label", "Time"), 
        Schema = v12, 
        Disabled = v13.IsKeypointFixed, 
        Value = v13.Keypoint.Time
    };
    local v29 = "Time";
    local l_v29_0 = v29 --[[ copy: 16 -> 17 ]];
    v28.OnChanged = function(v31)
        v13.OnEdit(l_join_0(v13.Keypoint, {
            [l_v29_0] = v31
        }));
    end;
    v25.Time = l_createElement_2(l_v9_0, v28);
    l_createElement_2 = v1.createElement;
    l_v9_0 = v9;
    v28 = {
        LayoutOrder = 2, 
        Text = v14:getText("Label", "Value"), 
        Schema = v12, 
        Value = v13.Keypoint.Value
    };
    v29 = "Value";
    local l_v29_1 = v29 --[[ copy: 16 -> 18 ]];
    v28.OnChanged = function(v33)
        v13.OnEdit(l_join_0(v13.Keypoint, {
            [l_v29_1] = v33
        }));
    end;
    v25.Value = l_createElement_2(l_v9_0, v28);
    l_createElement_2 = v1.createElement;
    l_v9_0 = v9;
    v28 = {
        LayoutOrder = 3, 
        Text = v14:getText("Label", "Envelope"), 
        Schema = v12, 
        Value = v13.Keypoint.Envelope
    };
    v29 = "Envelope";
    v28.OnChanged = function(v34)
        v13.OnEdit(l_join_0(v13.Keypoint, {
            [v29] = v34
        }));
    end;
    v25.Envelope = l_createElement_2(l_v9_0, v28);
    v21.SequenceButtonsContainer = l_createElement_1(l_l_Pane_0_1, v24, v25);
    v21.CommitButtonsContainer = v1.createElement(l_Pane_0, {
        LayoutOrder = 3, 
        [v1.Tag] = "X-Right X-Pad X-RowM X-Fit"
    }, {
        Delete = v1.createElement(l_IconButton_0, {
            LayoutOrder = 1, 
            TooltipText = v14:getText("Control", "DeleteTooltip"), 
            LeftIcon = v8.delete(), 
            Disabled = v13.IsKeypointFixed, 
            OnClick = v13.OnDelete
        }), 
        Save = v1.createElement(l_IconButton_0, {
            LayoutOrder = 2, 
            Text = v14:getText("Modal", "Save"), 
            OnClick = v13.OnSave
        })
    });
    return l_createElement_0(l_l_Pane_0_0, v20, v21);
end;
