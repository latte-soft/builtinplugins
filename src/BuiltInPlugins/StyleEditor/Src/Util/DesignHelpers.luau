local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_StylingService_0 = game:GetService("StylingService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v4 = require(l_Parent_0.Packages.Framework);
local v5 = require(l_Parent_0.Src.Util.SelectorHelpers);
local v6 = require(l_Parent_0.Src.Util.recordChange)(l_ChangeHistoryService_0);
local v7 = require(l_Parent_0.Packages.Dash);
local l_includes_0 = v7.includes;
local l_startsWith_0 = v7.startsWith;
local l_insert_0 = table.insert;
local l_createStyleSheet_0 = v4.Styling.createStyleSheet;
local v20 = {
    PATHS = {
        DESIGN = {
            1
        }, 
        UI_ELEMENTS = {
            1, 
            1
        }, 
        THEMES = {
            3
        }, 
        SELECTOR = {
            1
        }
    }, 
    getSelectorCategory = function(v12)
        if not l_startsWith_0(v12, ".") then
            if not v5.isElement(v12) then
                return "Other";
            else
                return "UI Elements";
            end;
        else
            return "Tags";
        end;
    end, 
    isUnderPath = function(v13, v14)
        if #v13 < #v14 then
            return false;
        else
            for v15, v16 in v14, nil, nil do
                if v16 ~= v13[v15] then
                    return false;
                end;
            end;
            return true;
        end;
    end, 
    isPartOfDesignSystem = function(v17)
        local v18 = if not not v17:IsA("StyleDerive") and v17.Parent then v17.Parent:GetAttribute("StyleCategory") else v17:GetAttribute("StyleCategory");
        local l_v18_0 = v18;
        if l_v18_0 then
            l_v18_0 = true;
            if v18 ~= "Themes" then
                l_v18_0 = true;
                if v18 ~= "Tokens" then
                    l_v18_0 = v18 == "Designs";
                end;
            end;
        end;
        return l_v18_0;
    end
};
v20.setAsToken = function(v21, v22)
    local v23 = false;
    for _, v25 in l_ReplicatedStorage_0:GetDescendants() do
        local v26 = v20.isTheme(v25);
        if not (not v25:IsA("StyleSheet") or not v26) then
            v23 = true;
            v20.insertDerive(v25, v21);
        end;
    end;
    if not (not v22 or v23) then
        v20.insertDerive(v22, v21);
    end;
end;
v20.setAsTheme = function(v27, v28)
    local l_v28_Derives_0 = v28:GetDerives();
    local v30 = {};
    for _, v32 in l_ReplicatedStorage_0:GetDescendants() do
        local l_v32_Attribute_0 = v32:GetAttribute("StyleCategory");
        if v32:IsA("StyleSheet") then
            if l_v32_Attribute_0 == "Tokens" then
                if l_includes_0(l_v28_Derives_0, v32) then
                    v20.removeDerive(v28, v32);
                end;
                v20.insertDerive(v27, v32);
            elseif not (not (l_v32_Attribute_0 == "Themes") or v32.Parent:IsA("Folder")) then
                l_insert_0(v30, v32);
            end;
        end;
    end;
    local v34 = if not not v27.Parent and v27.Parent:IsA("Folder") then v27.Parent else nil;
    local v35 = if not v34 then v30 else v34:GetChildren();
    local v36 = false;
    for _, v38 in v35, nil, nil do
        local l_v38_Attribute_0 = v38:GetAttribute("StyleCategory");
        if not (not ((v38:IsA("StyleSheet") and l_v38_Attribute_0 ~= "Tokens") and l_v38_Attribute_0 ~= "Designs") or not l_includes_0(l_v28_Derives_0, v38)) then
            v36 = true;
            break;
        end;
    end;
    if not v36 then
        v20.insertDerive(v28, v27);
    end;
end;
v20.isTheme = function(v40)
    if v40 and v40.Parent then
        assert(v40 ~= nil, "expecting valid stylesheet");
        if v40:GetAttribute("StyleCategory") == "Themes" then
            return true;
        else
            local l_Parent_1 = v40.Parent;
            if l_Parent_1:IsA("Folder") and l_Parent_1:GetAttribute("StyleCategory") == "Themes" then
                return true;
            else
                return false;
            end;
        end;
    else
        return false;
    end;
end;
v20.createDesign = function(v42)
    local v43 = nil;
    v6({
        Name = "StyleEditor.Add Design", 
        DisplayName = "Style Editor - Add Design", 
        DoChange = function()
            v43 = l_createStyleSheet_0("StyleSheet");
            if not (v42 and v42.Parent) then
                v43:SetAttribute("StyleCategory", "Designs");
                v43.Name = "Design";
            end;
            v43.Parent = l_ReplicatedStorage_0;
            return Enum.FinishRecordingOperation.Commit;
        end
    });
    return v43;
end;
v20.isValidDerive = function(v44, v45)
    local l_status_0, l_result_0 = pcall(function()
        return not l_includes_0(l_StylingService_0:GetStyleSheetDerivesChain(v45), v44) and not l_includes_0(v44:GetDerives(), v45);
    end);
    if l_status_0 and l_result_0 then
        return true;
    else
        return false;
    end;
end;
v20.insertDerive = function(v48, v49)
    if v48 and v49 then
        local l_StyleDerive_0 = Instance.new("StyleDerive");
        l_StyleDerive_0.Name = "Derive from " .. v49.Name;
        l_StyleDerive_0.Parent = v48;
        l_StyleDerive_0.StyleSheet = v49;
        return ;
    else
        return ;
    end;
end;
v20.removeDerive = function(v51, v52)
    if v51 and v52 then
        for _, v54 in v51:GetChildren() do
            if v54:IsA("StyleDerive") and v54.StyleSheet == v52 then
                v54:Remove();
            end;
        end;
        return ;
    else
        return ;
    end;
end;
v20.replaceDerive = function(v55, v56, v57)
    if v55 and v56 then
        for _, v59 in v55:GetChildren() do
            if v59:IsA("StyleDerive") and v59.StyleSheet == v57 then
                v59.StyleSheet = v56;
                local v60, v61 = v59.Name:find(v57.Name);
                if not (not v60 or not v61) then
                    v59.Name = v59.Name:sub(1, v60 - 1) .. v56.Name .. v59.Name:sub(v61 + 1);
                end;
                return ;
            end;
        end;
        v20.insertDerive(v55, v56);
        return ;
    else
        return ;
    end;
end;
return v20;
