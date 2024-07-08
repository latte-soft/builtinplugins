local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.React);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_UserInputService_0 = game:GetService("UserInputService");
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v11 = require(l_Actions_0.LockSelectedControlPoint);
local v12 = require(l_Actions_0.SelectTangentSide);
local l_Thunks_0 = l_Parent_0.Src.Thunks;
local v14 = require(l_Thunks_0.RecordChangeHistory);
local v15 = require(l_Thunks_0.SelectControlPoint);
local v16 = require(l_Thunks_0.ClearControlPointTangent);
local v17 = require(l_Thunks_0.SetControlPointTangent);
local v18 = require(l_Thunks_0.OpenContextMenu);
local _ = require(l_Parent_0.Src.Resources.Constants);
local v20 = require(l_Parent_0.Src.Components.DraggablePoint);
local l_LeftShift_0 = Enum.KeyCode.LeftShift;
local _ = Enum.KeyCode.LeftControl;
local v23 = v2.Component:extend("TangentPoint");
v23.render = function(v24)
    local l_props_0 = v24.props;
    local v26 = "Tangent";
    if l_props_0.isPhantom then
        v26 = "PhantomTangent";
    end;
    return v2.createElement(v20, {
        ZIndex = 1, 
        AbsolutePosition = l_props_0.absolutePosition, 
        FollowCursorOnDrag = false, 
        Style = v26, 
        IsSelected = l_props_0.SelectedTangentSide == l_props_0.side, 
        OnSelected = function()
            l_props_0.dispatchSelectControlPoint(l_props_0.index);
            l_props_0.dispatchSelectTangentSide(l_props_0.side);
        end, 
        OnDoubleClicked = function()
            l_props_0.dispatchClearControlPointTangent(l_props_0.index, l_props_0.side);
        end, 
        OnDragStart = function()
            l_props_0.dispatchRecordChangeHistory("Move Tangent");
            l_props_0.dispatchSelectControlPoint(l_props_0.index);
            l_props_0.dispatchLockSelectedControlPoint(true);
        end, 
        OnDragMoved = function(v27, v28)
            l_props_0.dispatchSetControlPointTangent(l_props_0.index, l_props_0.side, l_props_0.position + (v28 - v27), false, (l_UserInputService_0:IsKeyDown(l_LeftShift_0)));
        end, 
        OnDragEnd = function(_, _)
            l_props_0.dispatchLockSelectedControlPoint(false);
            l_props_0.dispatchRecordChangeHistory();
        end, 
        OnRightClicked = function()
            l_props_0.dispatchSelectControlPoint(l_props_0.index);
            l_props_0.dispatchSelectTangentSide(l_props_0.side);
            l_props_0.dispatchOpenContextMenu(l_props_0.PluginContext, l_props_0.Localization);
        end
    });
end;
return v3.connect(function(v31, _)
    return {
        LockSelectedControlPoint = v31.PathReducer.LockSelectedControlPoint, 
        SelectedTangentSide = v31.PathReducer.SelectedTangentSide
    };
end, function(v33)
    return {
        dispatchRecordChangeHistory = function(v34)
            v33(v14(v34));
        end, 
        dispatchClearControlPointTangent = function(v35, v36)
            v33(v16(v35, v36));
        end, 
        dispatchSelectControlPoint = function(v37)
            v33(v15(v37));
        end, 
        dispatchSelectTangentSide = function(v38)
            v33(v12(v38));
        end, 
        dispatchSetControlPointTangent = function(v39, v40, v41, v42, v43)
            v33(v17(v39, v40, v41, v42, v43));
        end, 
        dispatchLockSelectedControlPoint = function(v44)
            v33(v11(v44));
        end, 
        dispatchOpenContextMenu = function(v45, v46)
            v33(v18(v45, v46));
        end
    };
end)((l_withContext_0({
    PluginContext = l_Plugin_0, 
    Localization = l_Localization_0
})(v23)));
