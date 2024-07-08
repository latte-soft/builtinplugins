local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_useState_0 = require(l_Parent_0.Packages.React).useState;
local v2 = require(l_Parent_0.Src.Renderers.SequenceRenderers.KeypointSequence);
local _ = require(l_Parent_0.Src.Renderers.SequenceRenderers.Types);
return function(v4)
    local v5, v6 = l_useState_0({
        Keypoints = v4, 
        Selected = 1
    });
    return {
        keypoints = v5.Keypoints, 
        selectedIndex = v5.Selected, 
        reset = function(v7)
            v6({
                Keypoints = v7, 
                Selected = 1
            });
        end, 
        update = function(v8)
            v6(function(v9)
                return v2.updateSelected(v9, v8);
            end);
        end, 
        add = function(v10)
            v6(function(v11)
                return v2.add(v11, v10);
            end);
        end, 
        remove = function()
            v6(function(v12)
                return v2.removeSelected(v12);
            end);
        end, 
        select = function(v13)
            v6(function(v14)
                return v2.select(v14, v13);
            end);
        end, 
        save = function(v15)
            v6(function(v16)
                v15(v16.Keypoints);
                return v16;
            end);
        end, 
        isFixedKeypointSelected = function()
            return v2.isFixedKeypointSelected(v5);
        end, 
        getSelectedKeypoint = function()
            return v2.selectedKeypoint(v5);
        end
    };
end;
