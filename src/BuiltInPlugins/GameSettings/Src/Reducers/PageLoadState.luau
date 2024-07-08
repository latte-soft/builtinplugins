local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
return require(l_Parent_0.Packages.Rodux).createReducer({}, {
    ResetStore = function(_, _)
        return {};
    end, 
    SetPageLoadState = function(v4, v5)
        return v1.Dictionary.join(v4, {
            [v5.pageId] = v5.loadState
        });
    end
});
