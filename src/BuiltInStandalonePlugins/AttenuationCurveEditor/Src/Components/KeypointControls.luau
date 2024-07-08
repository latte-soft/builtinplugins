local l_script_FirstAncestor_0 = script:FindFirstAncestor("AttenuationCurveEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_useCallback_0 = v1.useCallback;
local l_useContext_0 = v1.useContext;
local _ = require(l_script_FirstAncestor_0.Packages.Dash).join;
local v5 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v5.ContextServices;
local l_IconButton_0 = v5.UI.IconButton;
local l_Pane_0 = v5.UI.Pane;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v10 = require(l_script_FirstAncestor_0.Src.Components.LabelCell);
local v11 = {
    Type = "Number", 
    Min = 0
};
local v12 = {
    Type = "Number", 
    Min = 0, 
    Max = 1
};
return function(v13)
    local v14 = l_useContext_0(l_ContextServices_0.Context.Consumer)[l_ContextServices_0.Localization.Key];
    local v19 = l_useCallback_0(function(v15)
        if v13.Keypoint then
            return function(v16)
                local l_Keypoint_0 = v13.Keypoint;
                if v15 == "X" then
                    l_Keypoint_0 = Vector2.new(v16, l_Keypoint_0.Y);
                end;
                if v15 == "Y" then
                    l_Keypoint_0 = Vector2.new(l_Keypoint_0.X, v16);
                end;
                if v13.OnEdit then
                    v13.OnEdit(l_Keypoint_0);
                end;
            end;
        else
            return function(_)
            end;
        end;
    end, {
        v13.Keypoint, 
        v13.OnEdit
    });
    local v20 = nil;
    local v21 = nil;
    if v13.Keypoint then
        v20 = v13.Keypoint.X;
        v21 = v13.Keypoint.Y;
    end;
    return v1.createElement(l_Pane_0, {
        LayoutOrder = 2, 
        Size = UDim2.fromScale(1, 0), 
        [v1.Tag] = "X-Center X-Middle X-RowM X-Fit"
    }, {
        SequenceButtonsContainer = v1.createElement(l_Pane_0, {
            LayoutOrder = 1, 
            [v1.Tag] = "X-Left X-Pad X-RowM X-Fit"
        }, {
            X = v1.createElement(v10, {
                LayoutOrder = 1, 
                Text = v14:getText("Label", "Distance"), 
                Schema = v11, 
                Value = v20, 
                OnChanged = v19("X")
            }), 
            Y = v1.createElement(v10, {
                LayoutOrder = 2, 
                Text = v14:getText("Label", "Volume"), 
                Schema = v12, 
                Value = v21, 
                OnChanged = v19("Y")
            })
        }), 
        CommitButtonsContainer = v1.createElement(l_Pane_0, {
            LayoutOrder = 3, 
            [v1.Tag] = "X-Right X-Pad X-RowM X-Fit"
        }, {
            Delete = v1.createElement(l_IconButton_0, {
                LayoutOrder = 1, 
                Text = v14:getText("Control", "Delete"), 
                OnClick = v13.OnDelete
            }), 
            Cancel = v1.createElement(l_IconButton_0, {
                LayoutOrder = 2, 
                Text = v14:getText("Control", "Reset"), 
                OnClick = v13.OnReset
            }), 
            Save = v1.createElement(l_IconButton_0, {
                LayoutOrder = 3, 
                Text = v14:getText("Control", "Save"), 
                OnClick = v13.OnSave
            })
        })
    });
end;
