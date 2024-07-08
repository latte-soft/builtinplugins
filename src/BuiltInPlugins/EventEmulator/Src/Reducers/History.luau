local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
local l_Actions_0 = l_Parent_0.Src.Actions;
return v1.createReducer({
    HistoryItems = {}
}, {
    [require(l_Actions_0.AddHistoryItem).name] = function(v4, v5)
        return v2.Dictionary.join(v4, {
            HistoryItems = v2.Dictionary.join(v4.HistoryItems, {
                [v5.item.Name] = v5.item
            })
        });
    end, 
    [require(l_Actions_0.RemoveHistoryItem).name] = function(v6, v7)
        return v2.Dictionary.join(v6, {
            HistoryItems = v2.Dictionary.join(v6.HistoryItems, {
                [v7.historyItem] = v2.None
            })
        });
    end
});
