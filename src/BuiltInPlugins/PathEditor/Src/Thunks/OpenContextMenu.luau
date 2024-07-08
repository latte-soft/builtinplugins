local l_Parent_0 = script.Parent.Parent.Parent;
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local _ = l_ContextServices_0.Localization;
local _ = l_ContextServices_0.Plugin;
local l_Actions_0 = l_Parent_0.Src.Actions;
local _ = require(l_Actions_0.ToggleAddPointTool);
local _ = require(l_Actions_0.ToggleAddTangentTool);
local _ = require(l_Actions_0.ToggleDone);
local v8 = require(l_Actions_0.ToggleMirrored);
local _ = require(l_Actions_0.ToggleMoveTool);
local _ = require(l_Actions_0.ToolbarHovered);
local l_Thunks_0 = l_Parent_0.Src.Thunks;
local v12 = require(l_Thunks_0.AddControlPointTangent);
local v13 = require(l_Thunks_0.ClearControlPointTangent);
local v14 = require(l_Thunks_0.RemoveControlPoint);
local v15 = require(l_Parent_0.Src.Util.createContextMenu);
local _ = require(l_Parent_0.Src.Util.getShortcuts)();
return function(v17, v18)
    return function(v19)
        local l_PathReducer_0 = v19:getState().PathReducer;
        if l_PathReducer_0.SelectedObject == nil then
            return l_PathReducer_0;
        else
            local l_SelectedControlPointIndex_0 = l_PathReducer_0.SelectedControlPointIndex;
            if l_SelectedControlPointIndex_0 == 0 then
                return l_PathReducer_0;
            else
                local v22 = {};
                local v23 = l_PathReducer_0.ControlPointStates[l_SelectedControlPointIndex_0];
                if l_PathReducer_0.SelectedTangentSide == nil then
                    if not v23.Mirrored then
                        table.insert(v22, {
                            Icon = "", 
                            OnClick = function()
                                v19:dispatch(v8(l_SelectedControlPointIndex_0));
                            end, 
                            Text = v18:getText("ContextMenu", "MirrorTangents")
                        });
                    else
                        table.insert(v22, {
                            Icon = "", 
                            OnClick = function()
                                v19:dispatch(v8(l_SelectedControlPointIndex_0));
                            end, 
                            Text = v18:getText("ContextMenu", "BreakTangents")
                        });
                    end;
                    if not v23.Sharp then
                        table.insert(v22, {
                            Icon = "", 
                            OnClick = function()
                                v19:dispatch(v13(l_SelectedControlPointIndex_0, "Left"));
                                v19:dispatch(v13(l_SelectedControlPointIndex_0, "Right"));
                            end, 
                            Text = v18:getText("ContextMenu", "ClearTangents")
                        });
                    else
                        table.insert(v22, {
                            Icon = "", 
                            OnClick = function()
                                v19:dispatch(v12(l_SelectedControlPointIndex_0));
                            end, 
                            Text = v18:getText("ContextMenu", "AddTangents")
                        });
                    end;
                    table.insert(v22, {
                        Icon = "", 
                        OnClick = function()
                            v19:dispatch(v14(l_SelectedControlPointIndex_0));
                        end, 
                        Text = v18:getText("ContextMenu", "DeletePoint")
                    });
                else
                    table.insert(v22, {
                        Icon = "", 
                        OnClick = function()
                            if v23.Mirrored then
                                v19:dispatch(v8(l_SelectedControlPointIndex_0));
                            end;
                            v19:dispatch(v13(l_SelectedControlPointIndex_0, l_PathReducer_0.SelectedTangentSide));
                        end, 
                        Text = v18:getText("ContextMenu", "DeleteTangent")
                    });
                end;
                v15(v17:get(), v22, "BaseMenu");
                return l_PathReducer_0;
            end;
        end;
    end;
end;
