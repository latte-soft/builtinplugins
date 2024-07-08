local l_deepCopy_0 = require(script.Parent.Parent.Parent.Packages.Framework).Util.deepCopy;
local v1 = require(script.Parent.Constants);
local function _(v2, v3, v4, v5)
    return {
        Id = v3, 
        Text = v2:getText("Common", v3), 
        Data = v4, 
        OnItemClicked = v5
    };
end;
local function _(v7, v8)
    return {
        id = v8, 
        text = v7:getText("Common", v8), 
        allowBinding = false
    };
end;
local function v14(v10)
    local v11 = {};
    for _, v13 in pairs(v1.StepActionIds) do
        v11[v13] = {
            id = v13, 
            text = v10:getText("Common", v13), 
            allowBinding = false
        };
    end;
    v11[v1.StepActionIds.stepOverActionV2].defaultShortcut = "F10";
    v11[v1.StepActionIds.stepIntoActionV2].defaultShortcut = "F11";
    v11[v1.StepActionIds.stepOutActionV2].defaultShortcut = "Shift+F11";
    v11[v1.StepActionIds.simulationResumeActionV2].defaultShortcut = "F5";
    return v11;
end;
return {
    getCallstackActions = function(v15, v16)
        local v17 = {};
        for _, v19 in pairs(v1.CallstackActionIds) do
            v17[v19] = {
                Id = v19, 
                Text = v15:getText("Common", v19), 
                Data = nil, 
                OnItemClicked = v16
            };
        end;
        return v17;
    end, 
    getWatchActions = function(v20, v21, v22)
        local v23 = {};
        for _, v25 in pairs(v1.WatchActionIds) do
            v23[v25] = {
                Id = v25, 
                Text = v20:getText("Common", v25), 
                Data = v21, 
                OnItemClicked = v22
            };
        end;
        return v23;
    end, 
    getBreakpointActions = function(v26, v27, v28, v29, v30)
        local v31 = {};
        local l_BreakpointActions_0 = v1.BreakpointActions;
        if v28 then
            l_BreakpointActions_0 = v1.LogpointActions;
        end;
        for _, v34 in pairs(l_BreakpointActions_0) do
            v31[v34] = {
                Id = v34, 
                Text = v26:getText("Common", v34), 
                Data = v29, 
                OnItemClicked = v30
            };
        end;
        for _, v36 in pairs(v1.CommonActions) do
            v31[v36] = {
                Id = v36, 
                Text = v26:getText("Common", v36), 
                Data = v29, 
                OnItemClicked = v30
            };
        end;
        if not v27 then
            if not v28 then
                v31[v1.BreakpointActions.DisableBreakpoint] = nil;
                return v31;
            else
                v31[v1.LogpointActions.DisableLogpoint] = nil;
                return v31;
            end;
        elseif not v28 then
            v31[v1.BreakpointActions.EnableBreakpoint] = nil;
            return v31;
        else
            v31[v1.LogpointActions.EnableLogpoint] = nil;
            return v31;
        end;
    end, 
    getActionsWithShortcuts = function(v37)
        local v38 = {};
        for v39, v40 in pairs((v14(v37))) do
            v38[v39] = v40;
        end;
        return v38;
    end, 
    getBreakpointActionsOrder = function(v41, v42)
        local v43 = if not v42 then l_deepCopy_0(v1.BreakpointActionsOrder) else l_deepCopy_0(v1.LogpointActionsOrder);
        if not v41 then
            table.remove(v43, v1.DisableKey);
            return v43;
        else
            table.remove(v43, v1.EnableKey);
            return v43;
        end;
    end
};
