local v0 = require(script.Parent.Utility);
local v1 = require(script.Parent.SelectionManager);
local v2 = require(script.Parent.InstanceInfo);
local v3 = require(script.Parent.Analytics);
local l_StarterGui_0 = game:GetService("StarterGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local v6 = game:DefineFastFlag("SelectRotatedGuiObjects", false);
local v7 = game:DefineFastFlag("UIEditorFixSelectionZIndexOrdering", false);
local v8 = game:DefineFastFlag("UIEditorFixDisplayOrderAndTransparencySelection", false);
local v9 = {};
local v10 = {};
local v11 = nil;
local function v18(v12)
    if v12.AbsoluteRotation ~= 0 then
        return v12.AbsolutePosition, v12.AbsoluteSize;
    else
        local l_AbsolutePosition_0 = v12.AbsolutePosition;
        local v14 = v12.AbsoluteSize + l_AbsolutePosition_0;
        local l_v12_FirstAncestorWhichIsA_0 = v12:FindFirstAncestorWhichIsA("GuiObject");
        while l_v12_FirstAncestorWhichIsA_0 do
            if l_v12_FirstAncestorWhichIsA_0.ClipsDescendants then
                local l_AbsolutePosition_1 = l_v12_FirstAncestorWhichIsA_0.AbsolutePosition;
                local v17 = l_v12_FirstAncestorWhichIsA_0.AbsoluteSize + l_AbsolutePosition_1;
                l_AbsolutePosition_0 = Vector2.new(math.max(l_AbsolutePosition_0.X, l_AbsolutePosition_1.X), (math.max(l_AbsolutePosition_0.Y, l_AbsolutePosition_1.Y)));
                v14 = Vector2.new(math.min(v14.X, v17.X), (math.min(v14.Y, v17.Y)));
            end;
            l_v12_FirstAncestorWhichIsA_0 = l_v12_FirstAncestorWhichIsA_0:FindFirstAncestorWhichIsA("GuiObject");
        end;
        return l_AbsolutePosition_0, v14 - l_AbsolutePosition_0;
    end;
end;
local function v26(v19, v20)
    if v20 and v20:IsA("GuiBase2d") then
        local v21, v22 = v18(v20);
        local l_v22_0 = v22;
        l_v22_0 = Vector2.new(math.max(5, l_v22_0.X), (math.max(5, l_v22_0.Y)));
        local v24 = (v21 + v22 * 0.5) - l_v22_0 * 0.5;
        local v25 = false;
        if v24.x <= v19.x then
            v25 = false;
            if v19.x <= v24.x + l_v22_0.x then
                v25 = false;
                if v24.y <= v19.y then
                    v25 = v19.y <= v24.y + l_v22_0.y;
                end;
            end;
        end;
        return v25;
    else
        return false;
    end;
end;
local function v27(v28)
    local v29 = {};
    if not v6 then
        local l_v28_Children_0 = v28:GetChildren();
        for v31 = 1, #l_v28_Children_0 do
            if not (not l_v28_Children_0[v31]:IsA("GuiBase2d") and not l_v28_Children_0[v31]:IsA("Folder")) then
                local v32 = v27(l_v28_Children_0[v31]);
                if v2:isVisible(l_v28_Children_0[v31]) then
                    table.insert(v29, l_v28_Children_0[v31]);
                end;
                for v33 = 1, #v32 do
                    table.insert(v29, v32[v33]);
                end;
            end;
        end;
        return v29;
    else
        for _, v35 in (v28:GetDescendants()), nil, nil do
            if not (not v35:IsA("GuiBase2d") and not v35:IsA("Folder") or not v2:isVisible(v35)) then
                table.insert(v29, v35);
            end;
        end;
        return v29;
    end;
end;
local function v42(v36)
    local v37 = v27(v36);
    local v38 = {};
    for v39 = 1, #v37 do
        v38[v37[v39]] = v39;
    end;
    table.sort(v37, function(v40, v41)
        if v40.ZIndex == v41.ZIndex then
            return v38[v40] < v38[v41];
        else
            return v40.ZIndex < v41.ZIndex;
        end;
    end);
    return v37;
end;
local function v47()
    local l_Children_0 = game:GetService("StarterGui"):GetChildren();
    v9 = {};
    for v44 = 1, #l_Children_0 do
        if not (not l_Children_0[v44]:IsA("ScreenGui") and not l_Children_0[v44]:IsA("Folder")) then
            local v45 = v42(l_Children_0[v44]);
            for v46 = 1, #v45 do
                table.insert(v9, v45[v46]);
                v10[v45[v46]] = #v9;
            end;
        end;
    end;
end;
local function v55(v48)
    local v49 = {};
    if not v6 then
        for v50 = #v9, 1, -1 do
            if v26(v48, v9[v50]) then
                table.insert(v49, v9[v50]);
            end;
        end;
    else
        if not v8 then
            v49 = l_StarterGui_0:GetGuiObjectsAtPosition(v48.X, v48.Y);
        else
            local l_l_StarterGui_0_GuiObjectsAtPosition_0 = l_StarterGui_0:GetGuiObjectsAtPosition(v48.X, v48.Y);
            for v52 = 1, #l_l_StarterGui_0_GuiObjectsAtPosition_0 do
                if v2:isVisible(l_l_StarterGui_0_GuiObjectsAtPosition_0[v52]) then
                    table.insert(v49, l_l_StarterGui_0_GuiObjectsAtPosition_0[v52]);
                end;
            end;
        end;
        if not v7 then
            table.sort(v49, function(v53, v54)
                return v53.ZIndex < v54.ZIndex;
            end);
            return v49;
        end;
    end;
    return v49;
end;
local function v60(v56)
    v47();
    local v57 = v55(v56);
    local v58 = v57[1];
    if not (not l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftAlt) and not l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightAlt)) then
        local v59 = v0:findItemInTable(v11, v57);
        if v59 ~= 0 and v59 ~= #v57 then
            v58 = v57[v59 + 1];
        end;
    end;
    return v58;
end;
local function _(v61, v62)
    local v63 = v0:findItemInTable(v61, v62);
    if v63 > 0 then
        table.remove(v62, v63);
        return false;
    else
        table.insert(v62, v61);
        return true;
    end;
end;
return {
    getGuiObjects = function(_)
        local v66 = {};
        for v67, v68 in ipairs(v9) do
            v66[v67] = v68;
        end;
        return v66;
    end, 
    getGuiObjectsAtPoint = function(_, v70)
        return (v55(v70));
    end, 
    refreshPaintOrder = function(_)
        v47();
    end, 
    selectTopLevelItemAtPoint = function(_, v73)
        local v74 = v60(v73);
        local v75 = {
            unpack((v1:getRawSelection()))
        };
        local v76 = false;
        if not v74 then
            if not l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift) and not l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightShift) then
                if v0:findItemInTable(v74, v75) == 0 then
                    v75 = {
                        v74
                    };
                end;
            else
                return nil;
            end;
        elseif not ((l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftControl) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightControl)) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift)) and not l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightShift) then
            if v0:findItemInTable(v74, v75) == 0 then
                v75 = {
                    v74
                };
            end;
        else
            local l_v75_0 = v75;
            local v78 = v0:findItemInTable(v74, l_v75_0);
            local v79;
            if v78 > 0 then
                table.remove(l_v75_0, v78);
                v79 = false;
            else
                table.insert(l_v75_0, v74);
                v79 = true;
            end;
            if not v79 then
                v3:reportEvent("RemoveFromSelection");
            else
                v3:reportEvent("AddToSelection");
            end;
            v76 = true;
        end;
        v11 = v74;
        if not (not v1:setSelection(v75) or v76) then
            if not v1:hasFilteredSelection() then
                v3:reportEvent("Deselect");
            else
                v3:reportEvent("Select");
            end;
        end;
        return v11;
    end, 
    selectAllObjectsInBounds = function(_, v81, v82)
        local v83 = Vector2.new(math.min(v81.X, v82.X), (math.min(v81.Y, v82.Y)));
        local v84 = Vector2.new(math.max(v81.X, v82.X), (math.max(v81.Y, v82.Y)));
        local v85 = {};
        for v86 = 1, #v9 do
            if ((v83.X <= v9[v86].AbsolutePosition.X and v83.Y <= v9[v86].AbsolutePosition.Y) and v9[v86].AbsolutePosition.X + v9[v86].AbsoluteSize.X <= v84.X) and v9[v86].AbsolutePosition.Y + v9[v86].AbsoluteSize.Y <= v84.Y then
                table.insert(v85, v9[v86]);
            end;
        end;
        v1:setSelection(v85);
    end, 
    toggleSelectionOfAllObjectsInBounds = function(_, v88, v89, v90)
        local v91 = Vector2.new(math.min(v89.X, v90.X), (math.min(v89.Y, v90.Y)));
        local v92 = Vector2.new(math.max(v89.X, v90.X), (math.max(v89.Y, v90.Y)));
        local v93 = {};
        for v94 = 1, #v9 do
            if ((v91.X <= v9[v94].AbsolutePosition.X and v91.Y <= v9[v94].AbsolutePosition.Y) and v9[v94].AbsolutePosition.X + v9[v94].AbsoluteSize.X <= v92.X) and v9[v94].AbsolutePosition.Y + v9[v94].AbsoluteSize.Y <= v92.Y then
                table.insert(v93, v9[v94]);
            end;
        end;
        for v95 = 1, #v88 do
            local v96 = v0:findItemInTable(v88[v95], v93);
            if v96 ~= 0 then
                table.remove(v93, v96);
            else
                table.insert(v93, v88[v95]);
            end;
        end;
        v1:setSelection(v93);
    end
};
