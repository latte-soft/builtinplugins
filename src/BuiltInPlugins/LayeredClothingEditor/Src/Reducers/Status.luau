local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
return v1.createReducer({
    toolMode = require(l_Parent_0.Src.Util.Constants).TOOL_MODE.None, 
    draggerType = Enum.RibbonTool.Select
}, {
    SetToolMode = function(v3, v4)
        return v2.Dictionary.join(v3, {
            toolMode = v4.toolMode
        });
    end, 
    SetDraggerType = function(v5, v6)
        return v2.Dictionary.join(v5, {
            draggerType = v6.draggerType
        });
    end
});
