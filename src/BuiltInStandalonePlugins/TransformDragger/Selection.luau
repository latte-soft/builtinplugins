local v0 = require(script.Parent.Rubberband);
local v1 = require(script.Parent.Metapart);
local v2 = {};
local v3 = {};
local v4 = nil;
local function v9()
    local v5 = {};
    local v6 = 1;
    for _, v8 in ipairs(v2) do
        if not (((not v8:IsA("BasePart") and not v8:IsA("Model") or v8:IsA("Workspace")) or v8:IsA("Terrain")) or not v8:isDescendantOf(workspace)) then
            v5[v6] = v8;
            v6 = v6 + 1;
        end;
    end;
    return v5;
end;
return {
    updateSelection = function()
        v2 = game:GetService("Selection"):Get();
        if not v0.isRubberBandDragInProgress() then
            v3 = v9();
            if v4 then
                v4.Unsubscribe();
            end;
            v4 = v1.convertToPart(v3, true);
            return ;
        else
            return ;
        end;
    end, 
    getCurrentSelection = function()
        return v2;
    end, 
    getFilteredSelection = function()
        return v3;
    end, 
    getFilteredSelectionMetapart = function()
        return v4;
    end
};
