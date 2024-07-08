local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local l_useContext_0 = v1.useContext;
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_IconButton_0 = v3.UI.IconButton;
local l_Pane_0 = v3.UI.Pane;
local l_join_0 = require(l_Parent_0.Packages.Dash).join;
local v8 = require(l_Parent_0.Src.Resources.ModernIcons);
local v9 = require(l_Parent_0.Src.Renderers.SequenceRenderers.LabelCell);
local v10 = require(l_Parent_0.Src.Renderers.ColorRenderer);
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Renderers.SequenceRenderers.Types);
local v13 = {
    Type = "Color"
};
local v14 = {
    Type = "Number", 
    Min = 0, 
    Max = 1
};
return function(v15)
    local v16 = l_useContext_0(l_ContextServices_0.Context.Consumer)[l_ContextServices_0.Localization.Key];
    return v1.createElement(l_Pane_0, {
        LayoutOrder = v15.LayoutOrder, 
        [v1.Tag] = "X-Center X-Middle X-FitY X-Pad X-RowM"
    }, {
        SequenceButtonsContainer = v1.createElement(l_Pane_0, {
            LayoutOrder = 1, 
            [v1.Tag] = "X-Left X-Pad X-RowM X-FitY", 
            Size = UDim2.fromScale(0.5, 1)
        }, {
            Time = v1.createElement(v9, {
                LayoutOrder = 1, 
                Text = v16:getText("Label", "Time"), 
                Schema = v14, 
                Disabled = v15.IsKeypointFixed, 
                Value = v15.Keypoint.Time, 
                OnChanged = function(v17)
                    v15.OnEdit(l_join_0(v15.Keypoint, {
                        Time = v17
                    }));
                end
            }), 
            Color = v1.createElement(v9, {
                LayoutOrder = 2, 
                Text = v16:getText("Label", "Color"), 
                Schema = v13, 
                Value = v15.Keypoint.Value, 
                OnChanged = function(v18)
                    v15.OnEdit(l_join_0(v15.Keypoint, {
                        Value = v18
                    }));
                end, 
                Renderer = v10
            }), 
            Delete = v1.createElement(l_IconButton_0, {
                LayoutOrder = 3, 
                TooltipText = v16:getText("Control", "DeleteTooltip"), 
                LeftIcon = v8.delete(), 
                Disabled = v15.IsKeypointFixed, 
                OnClick = v15.OnDelete
            })
        }), 
        CommitButtonsContainer = v1.createElement(l_Pane_0, {
            LayoutOrder = 2, 
            [v1.Tag] = "X-Right X-Pad X-RowM X-FitY", 
            Size = UDim2.fromScale(0.5, 1)
        }, {
            Save = v1.createElement(l_IconButton_0, {
                LayoutOrder = 1, 
                Text = v16:getText("Modal", "Save"), 
                OnClick = v15.OnSave
            })
        })
    });
end;
