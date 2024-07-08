local l_StylingService_0 = game:GetService("StylingService");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_createStyleLink_0 = require(l_Parent_0.Packages.Framework).Styling.createStyleLink;
local v3 = require(l_Parent_0.Src.Util.MenuHelpers);
local v4 = require(l_Parent_0.Src.Enums.InstancesHaveVariant);
local l_mapOne_0 = require(l_Parent_0.Packages.Dash).mapOne;
local v6 = {
    SelectorSyntax = {
        Blank = "", 
        Child = ">", 
        Descendant = ">>", 
        GuiStateModifier = ":", 
        Name = "#", 
        PseudoInstance = "::", 
        Tag = "."
    }
};
v6.isElement = function(v7)
    return l_mapOne_0(v3.Classes, function(v8)
        v7 = v7:gsub("%s+", "");
        local v9, v10 = v7:find(v8);
        if v9 then
            if v9 == 1 then
                return v8;
            elseif not (v7:sub(math.max(v9 - #v6.SelectorSyntax.Child, 1), v10) == v6.SelectorSyntax.Child .. v8) then
                if v7:sub(math.max(v9 - #v6.SelectorSyntax.Descendant, 1), v10) == v6.SelectorSyntax.Descendant .. v8 then
                    return v8;
                end;
            else
                return v8;
            end;
        end;
        return nil;
    end);
end;
v6.findFirstClassSelector = function(v11)
    if v11 and v11:IsA("StyleRule") then
        local v12 = false;
        if v11 ~= nil then
            v12 = v11:IsA("StyleRule");
        end;
        assert(v12, "style cannot be nil");
        local v13 = v6.getSelectorChain(v11);
        if v13 and v13.Class ~= "" then
            return v13.Class;
        else
            return "";
        end;
    else
        return "";
    end;
end;
v6.getSelectorChain = function(v14)
    if v14 ~= nil and v14:IsA("StyleRule") then
        local l_status_0, l_result_0 = pcall(function()
            return game:GetService("StylingService"):GetStyleInfo(v14).SelectorChains;
        end);
        if not l_status_0 then
            return nil;
        else
            return l_result_0[1][#l_result_0[1]];
        end;
    else
        return nil;
    end;
end;
v6.instancesHaveVariant = function(v17, v18)
    if not (v17 ~= nil) or #v17 == 0 then
        return v4.None;
    else
        local v19 = 0;
        for _, v21 in pairs(v17) do
            local l_status_1, l_result_1 = pcall(function()
                return l_StylingService_0:GetAppliedStyles(v21);
            end);
            if l_status_1 then
                for _, v25 in pairs(l_result_1) do
                    if v25.Instance == v18 then
                        v19 = v19 + 1;
                        break;
                    end;
                end;
            end;
        end;
        if #v17 <= v19 then
            return v4.All;
        elseif v19 <= 0 then
            return v4.None;
        else
            return v4.Mixed;
        end;
    end;
end;
v6.ruleHasTags = function(v26)
    if v26 == nil then
        return false;
    else
        local v27 = v6.getSelectorChain(v26);
        if v27 and #v27.Tags > 0 then
            return true;
        else
            return false;
        end;
    end;
end;
v6.canApplyVariant = function(v28, v29)
    if not (v28 ~= nil and v29 ~= nil) or #v29 == 0 then
        return false;
    else
        local v30 = v6.getSelectorChain(v28);
        if v30 then
            if v30.Name and v30.Name ~= "" then
                return false;
            elseif not v30.Class or v30.Class == "" then
                return true;
            else
                for _, v32 in pairs(v29) do
                    if v30.Class ~= v32.ClassName then
                        return false;
                    end;
                end;
                return true;
            end;
        else
            return false;
        end;
    end;
end;
v6.applyVariant = function(v33, v34)
    if not (v33 ~= nil) or v34 == nil then
        return ;
    else
        local v35 = v6.getSelectorChain(v33);
        if v35 == nil then
            return ;
        else
            for _, v37 in v35.Tags, nil, nil do
                v34:AddTag(v37);
            end;
            return ;
        end;
    end;
end;
v6.removeVariant = function(v38, v39)
    if not (v38 ~= nil) or v39 == nil then
        return ;
    else
        local v40 = v6.getSelectorChain(v38);
        if v40 == nil then
            return ;
        else
            for _, v42 in v40.Tags, nil, nil do
                v39:RemoveTag(v42);
            end;
            return ;
        end;
    end;
end;
v6.getStyleLinkRoot = function(v43)
    for _, v45 in {
        "ScreenGui", 
        "SurfaceGui", 
        "BillboardGui", 
        "StarterGui", 
        "Workspace", 
        "PluginGuiService"
    }, nil, nil do
        if not v43:IsA(v45) then
            local l_v43_FirstAncestorWhichIsA_0 = v43:FindFirstAncestorWhichIsA(v45);
            if l_v43_FirstAncestorWhichIsA_0 then
                return l_v43_FirstAncestorWhichIsA_0;
            end;
        else
            return v43;
        end;
    end;
    return nil;
end;
v6.addStyleLinkToRoot = function(v47, v48)
    if v47 and v48 then
        if not v48:IsA("StyleRule") then
            if v48:IsA("StyleSheet") then
                local v49 = v6.getStyleLinkRoot(v47);
                if (not v49 or v49:FindFirstChildWhichIsA("StyleLink")) or not v48 then
                    return nil;
                else
                    return l_createStyleLink_0(v49, v48);
                end;
            else
                return nil;
            end;
        else
            return v6.addStyleLinkToRoot(v47, v48:FindFirstAncestorWhichIsA("StyleSheet"));
        end;
    else
        return nil;
    end;
end;
return v6;
