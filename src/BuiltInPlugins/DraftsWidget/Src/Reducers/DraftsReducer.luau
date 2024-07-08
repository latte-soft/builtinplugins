local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = require(l_Parent_0.Src.Symbols.DraftState);
local v4 = require(l_Parent_0.Src.Symbols.CommitState);
local v5 = require(l_Parent_0.Src.Symbols.AutosaveState);
local v6 = require(l_Parent_0.Src.Flags.getFFlagDraftsWidgetChangedAfterRemoved);
local function _(v7)
    return {
        [v3.Outdated] = false, 
        [v3.Deleted] = v7.Parent == nil, 
        [v3.Committed] = v4.Uncommitted, 
        [v3.Autosaved] = v5.Saved
    };
end;
return (v1.createReducer({}, {
    DraftAddedAction = function(v9, v10)
        local l_Draft_0 = v10.Draft;
        return v2.Dictionary.join(v9, {
            [l_Draft_0] = {
                [v3.Outdated] = false, 
                [v3.Deleted] = l_Draft_0.Parent == nil, 
                [v3.Committed] = v4.Uncommitted, 
                [v3.Autosaved] = v5.Saved
            }
        });
    end, 
    DraftRemovedAction = function(v12, v13)
        return v2.Dictionary.join(v12, {
            [v13.Draft] = v2.None
        });
    end, 
    DraftsLoadedAction = function(v14, v15)
        local l_Drafts_0 = v15.Drafts;
        local v17 = {};
        for _, v19 in ipairs(l_Drafts_0) do
            v17[v19] = {
                [v3.Outdated] = false, 
                [v3.Deleted] = v19.Parent == nil, 
                [v3.Committed] = v4.Uncommitted, 
                [v3.Autosaved] = v5.Saved
            };
        end;
        return v2.Dictionary.join(v14, v17);
    end, 
    DraftStateChangedAction = function(v20, v21)
        local l_Draft_1 = v21.Draft;
        local l_StateType_0 = v21.StateType;
        local l_StateValue_0 = v21.StateValue;
        if not v6() then
            assert(v20[l_Draft_1] ~= nil, "Attempt to modify uninitialized state for draft '" .. l_Draft_1.Name .. "'");
        elseif v20[l_Draft_1] == nil then
            return v20;
        end;
        return v2.Dictionary.join(v20, {
            [l_Draft_1] = v2.Dictionary.join(v20[l_Draft_1], {
                [l_StateType_0] = l_StateValue_0
            })
        });
    end
}));
