local _ = require(script.Parent.FFlag);
local v1 = require(script.Parent.Utility);
local l_Selection_0 = game:GetService("Selection");
local v3 = {};
local v4 = {};
local v5 = {};
local v6 = {};
local v7 = {};
local v8 = 0;
local v9 = {};
local v10 = false;
local _ = function(v11, v12)
    for _, v14 in pairs(v7) do
        v14(v11, v12);
    end;
end;
local function _()
    for v16 = 1, #v4 do
        v6[v4[v16]]:disconnect();
    end;
end;
local function v23()
    for v18 = 1, #v4 do
        v6[v4[v18]] = v4[v18].Changed:connect(function(v19)
            local v20 = v4[v18];
            for _, v22 in pairs(v7) do
                v22(v20, v19);
            end;
        end);
    end;
end;
local function v24(v25, v26)
    if v25 and v25:IsA("GuiBase2d") then
        if v1:findItemInTable(v25, v26) ~= 0 then
            return true;
        else
            return v24(v25.Parent, v26);
        end;
    else
        return false;
    end;
end;
local v35 = {
    connectSelectionInstancesChanged = function(_, v28)
        v8 = v8 + 1;
        v7[v8] = v28;
        return v8;
    end, 
    disconnectSelectionInstancesChanged = function(_, v30)
        if v30 then
            v7[v30] = nil;
            return nil;
        else
            return nil;
        end;
    end, 
    connectFilteredSelectionChanged = function(_, v32)
        table.insert(v9, v32);
    end, 
    disconnectFilteredSelectionChanged = function(_, v34)
        assert(v1:removeItemFromTable(v34, v9), "Could not remove listener from listeners");
    end
};
local _ = function()
    for _, v37 in ipairs(v9) do
        v37:onSelectionChanged();
    end;
end;
local function v40(v39)
    if not game:GetEngineFeature("UIDragDetector") then
        if not game:GetFastFlag("UIEditorAvoidEditingPath2D") then
            return v39:isA("GuiObject") or v39:isA("UIComponent");
        else
            return (v39:isA("GuiObject") or v39:isA("UIComponent")) and not v39:isA("Path2D");
        end;
    elseif not game:GetFastFlag("UIEditorAvoidEditingPath2D") then
        return (v39:IsA("GuiObject") or v39:IsA("UIComponent")) and not v39:IsA("UIDragDetector");
    else
        return ((v39:IsA("GuiObject") or v39:IsA("UIComponent")) and not v39:IsA("Path2D")) and not v39:IsA("UIDragDetector");
    end;
end;
local function v44(v41)
    if v40(v41) then
        local v42 = false;
        local l_Parent_0 = v41.Parent;
        while l_Parent_0 ~= nil do
            if l_Parent_0 == game:GetService("StarterGui") then
                return true;
            elseif not l_Parent_0:isA("GuiBase2d") and not l_Parent_0:isA("Folder") then
                break;
            else
                l_Parent_0 = l_Parent_0.Parent;
            end;
        end;
        return v42;
    else
        return false;
    end;
end;
local function _(v45)
    return v45:FindFirstAncestorOfClass("ScreenGui") ~= nil;
end;
v35.passesGuiFilter = function(_, v48)
    return v44(v48) and v48:FindFirstAncestorOfClass("ScreenGui") ~= nil;
end;
v35.onDescendantAddedToStarterGui = function(_, v50)
    if not (not v35:passesGuiFilter(v50) or not v50:isA("GuiObject")) then
        v35:onSelectionChanged();
    end;
end;
v35.onParentChanged = function(_, _)
    v35:onSelectionChanged();
end;
v35.onSelectionChanged = function(_)
    for v54 = 1, #v4 do
        v6[v4[v54]]:disconnect();
    end;
    local v55 = l_Selection_0:Get();
    v3 = v55;
    v4 = {};
    v5 = {};
    for v56 = 1, #v3 do
        local v57 = v3[v56];
        if not (not v35:passesGuiFilter(v57) or not v57:isA("GuiObject")) then
            table.insert(v4, v57);
        end;
    end;
    for v58 = 1, #v4 do
        local l_Parent_1 = v55[v58].Parent;
        if not (not not l_Parent_1 and if l_Parent_1:IsA("GuiBase2d") then v1:findItemInTable(l_Parent_1, v55) ~= 0 and true or v24(l_Parent_1.Parent, v55) else false) then
            table.insert(v5, v4[v58]);
        end;
    end;
    v23();
    if not v10 then
        for _, v61 in ipairs(v9) do
            v61:onSelectionChanged();
        end;
    end;
end;
v35.getRawSelection = function(_)
    return {
        unpack(v3)
    };
end;
v35.getFilteredSelection = function(_)
    return {
        unpack(v4)
    };
end;
v35.getFilteredSelectionCommonAncestors = function(_)
    return {
        unpack(v5)
    };
end;
v35.hasSelection = function(_)
    return #v3 ~= 0;
end;
v35.hasFilteredSelection = function(_)
    return #v4 ~= 0;
end;
v35.setSelection = function(_, v68)
    if not v1:tablesAreEquivalent(v3, v68) then
        l_Selection_0:Set(v68);
        return true;
    else
        return false;
    end;
end;
v35.setSuppressFilteredSelectionChanged = function(_, v70)
    if v10 == v70 then
        return ;
    else
        v10 = v70;
        if not v70 then
            for _, v72 in ipairs(v9) do
                v72:onSelectionChanged();
            end;
        end;
        return ;
    end;
end;
return v35;
