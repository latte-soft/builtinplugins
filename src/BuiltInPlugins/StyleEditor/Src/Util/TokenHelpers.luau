local l_StylingService_0 = game:GetService("StylingService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Dash);
local l_assign_0 = v2.assign;
local l_includes_0 = v2.includes;
local l_omit_0 = v2.omit;
local l_reverse_0 = v2.reverse;
local v7 = require(l_Parent_0.Src.Enums.TokenValidationError);
local _ = require(l_Parent_0.Src.Types);
local v9 = {};
v9.getTokenValue = function(v10, v11)
    return v9.evaluateToken(v9.getAllAttributes(v10), v11);
end;
v9.getDerivedAttributes = function(v12)
    local v13 = {};
    if v12 then
        assert(v12 ~= nil, "styleInstance cannot be invalid");
        if not v12:IsA("StyleSheet") then
            if v12:IsA("StyleRule") then
                v13 = v9.getDerivedAttributes(v12.Parent);
            end;
        else
            local l_status_0, l_result_0 = pcall(function()
                return l_StylingService_0:GetStyleSheetDerivesChain(v12);
            end);
            if l_status_0 then
                for _, v17 in pairs(l_result_0) do
                    if v17 ~= v12 then
                        v13 = l_assign_0(v13, v17:GetAttributes());
                    end;
                end;
                return v13;
            end;
        end;
        return v13;
    else
        return v13;
    end;
end;
v9.getAllAttributes = function(v18)
    if v18 then
        assert(v18 ~= nil, "styleInstance cannot be invalid");
        local v19 = v9.getDerivedAttributes(v18);
        if v18:IsA("StyleBase") then
            v19 = l_assign_0(v19, v18:GetAttributes());
        end;
        return v19;
    else
        return {};
    end;
end;
v9.getTokenSourceStyleSheet = function(v20, v21)
    local v22 = false;
    if typeof(v20) == "Instance" then
        v22 = v20:IsA("StyleBase");
    end;
    assert(v22, "expecting valid StyleBase");
    local v23 = v9.parseAttributeName(v21);
    if v23 then
        assert(v23 ~= nil, "invalid attribute name");
        v22 = if not v20:IsA("StyleSheet") then v20:FindFirstAncestorWhichIsA("StyleSheet") else v20;
        if v22 then
            local l_status_1, l_result_1 = pcall(function()
                return l_reverse_0(l_StylingService_0:GetStyleSheetDerivesChain(v22));
            end);
            if l_status_1 then
                for _, v27 in l_result_1, nil, nil do
                    if v27:GetAttribute(v23) then
                        return v27;
                    end;
                end;
                return nil;
            else
                return nil;
            end;
        else
            return nil;
        end;
    else
        return nil;
    end;
end;
v9.parseAttributeName = function(v28)
    if not v28 or typeof(v28) ~= "string" then
        return nil;
    else
        return v28:match("^%s*%$([%a%d%-_]*)%s*$");
    end;
end;
v9.evaluateToken = function(v29, v30)
    local l_v30_0 = v30;
    local v32 = {};
    for _ = 1, 15 do
        local v34 = v9.parseAttributeName(l_v30_0);
        if not v34 then
            break;
        elseif not v32[l_v30_0] then
            v32[l_v30_0] = true;
            l_v30_0 = v29[v34];
            if not (l_v30_0 ~= nil) then
                break;
            end;
        else
            return nil, v7.CyclicReference;
        end;
    end;
    if l_v30_0 == nil then
        return nil, v7.DoesNotExist;
    else
        return l_v30_0, v7.None;
    end;
end;
v9.validateToken = function(v35, v36, v37)
    if v9.parseAttributeName(v36) then
        local v38, v39 = v9.evaluateToken(v35, v36);
        if v39 ~= v7.None then
            return v38, v39;
        elseif not v37 or l_includes_0(v37, (typeof(v38))) then
            return v38, v7.None;
        else
            return v38, v7.IncorrectType;
        end;
    else
        return nil, v7.InvalidSyntax;
    end;
end;
v9.stripStyleEditorMetaAttributes = function(v40)
    assert(typeof(v40) == "table", "array expected");
    return l_omit_0(v40, {
        "StyleCategory"
    });
end;
return v9;
