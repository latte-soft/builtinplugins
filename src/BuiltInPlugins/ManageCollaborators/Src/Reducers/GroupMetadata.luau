local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v4 = require(l_Actions_0.SetGroupMetadata);
local v5 = require(l_Actions_0.SetCurrentGroupMetadata);
local v6 = require(l_Parent_0.Src.Util.IsEqualCheck);
local function _()
    return {
        CurrentGroupMetadata = {}
    };
end;
return v1.createReducer({
    CurrentGroupMetadata = {}
}, {
    ResetStore = function(_, _)
        return {
            CurrentGroupMetadata = {}
        };
    end, 
    [v4.name] = function(v10, v11)
        local l_newGroupMetadata_0 = v11.newGroupMetadata;
        assert(type(l_newGroupMetadata_0) == "table");
        if v6(v10.CurrentGroupMetadata, l_newGroupMetadata_0) then
            l_newGroupMetadata_0 = v2.None;
        end;
        return v2.Dictionary.join(v10, {
            NewGroupMetadata = l_newGroupMetadata_0
        });
    end, 
    [v5.name] = function(v13, v14)
        return v2.Dictionary.join(v13, {
            CurrentGroupMetadata = v14.currentGroupMetadata
        });
    end
});
