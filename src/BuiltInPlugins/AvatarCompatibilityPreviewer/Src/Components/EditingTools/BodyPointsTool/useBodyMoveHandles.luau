local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local l_DraggerFramework_0 = l_script_FirstAncestor_0.Packages.DraggerFramework;
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Components.EditingTools.BodyPointsTool.Types);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v5 = require(l_DraggerFramework_0.Handles.MoveHandles);
return function(v6, v7)
    local v11 = v2.useMemo(function()
        local v8 = nil;
        return {
            beginDrag = function()
                v8 = v7:GetPivot();
            end, 
            updateDrag = function(_, v10)
                assert(v8 ~= nil, "startDragPivot not set during updateDrag");
                v7:PivotTo(v8 * v10);
                return v10;
            end, 
            endDrag = function()
                v8 = nil;
            end, 
            render = function()
                return nil;
            end
        };
    end, {
        v7
    });
    return v2.useMemo(function()
        return v5.new(v6, {
            ShowBoundingBox = false, 
            Summonable = false, 
            Outset = 1
        }, v11);
    end, {
        v11
    });
end;
