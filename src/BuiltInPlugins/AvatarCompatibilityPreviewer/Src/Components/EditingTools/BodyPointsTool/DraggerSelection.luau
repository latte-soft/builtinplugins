local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.DraggerFramework.Utility.Signal);
local _ = require(l_script_FirstAncestor_0.Src.Components.EditingTools.BodyPointsTool.Types);
local v4 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v5 = require(l_script_FirstAncestor_0.Src.Util.diffArray);
local v6 = {};
v6.__index = v6;
v6.new = function(v7)
    return (setmetatable({
        SelectionChanged = v2.new(), 
        draggerContext = nil, 
        _selection = {}, 
        _setSelectedPointNames = v7
    }, v6));
end;
v6.Get = function(v8)
    if #v8._selection == 0 then
        return {
            v4.PHONY_NO_SELECTION
        };
    else
        return v8._selection;
    end;
end;
local function _(v9, v10)
    local v12 = v1.find(v9.points, function(v11)
        return v11.name == v10;
    end);
    assert(v12 ~= nil, "Could not find point by name");
    return v12;
end;
v6.Set = function(v14, v15)
    local v16 = v14.draggerContext and v14.draggerContext.points;
    if v16 == nil then
        return ;
    else
        local v17 = false;
        if v14.draggerContext ~= nil then
            v17 = v16 ~= nil;
        end;
        assert(v17, v4.LUAU_ANALYZE_ERROR);
        if #v15 > 1 then
            local l_draggerContext_0 = v14.draggerContext;
            local v19 = v15[#v15];
            local v21 = v1.find(l_draggerContext_0.points, function(v20)
                return v20.name == v19;
            end);
            assert(v21 ~= nil, "Could not find point by name");
            local l_limb_0 = v21.limb;
            v17 = {
                v15[#v15]
            };
            for v23 = #v15 - 1, 1, -1 do
                local l_draggerContext_1 = v14.draggerContext;
                local v25 = v15[v23];
                local v27 = v1.find(l_draggerContext_1.points, function(v26)
                    return v26.name == v25;
                end);
                assert(v27 ~= nil, "Could not find point by name");
                if v27.limb == l_limb_0 then
                    table.insert(v17, 1, v15[v23]);
                end;
            end;
            v15 = v17;
        end;
        v14:_fireOnSelect(v15);
        v14._selection = v15;
        v14._setSelectedPointNames(v15);
        v14.SelectionChanged:Fire();
        return ;
    end;
end;
v6._fireOnSelect = function(v28, v29)
    assert(v28.draggerContext ~= nil, "_fireOnSelect called without dragger context");
    local v30, v31 = v5(v29, v28._selection);
    local v32 = 0;
    for _, v34 in v28.draggerContext.points, nil, nil do
        if table.find(v30, v34.name) ~= nil then
            if v34.onSelect ~= nil then
                v34.onSelect();
            end;
        elseif table.find(v31, v34.name) ~= nil then
            if v34.onUnselect ~= nil then
                v34.onUnselect();
            end;
        else
            continue;
        end;
        v32 = v32 + 1;
        if not (v32 ~= #v30 + #v31) then
            break;
        end;
    end;
end;
return v6;
