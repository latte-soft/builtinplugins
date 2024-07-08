local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local l_join_0 = require(l_Parent_0.Packages.Dash).join;
local _ = require(l_Parent_0.Src.Types);
return v1.createReducer({
    Fonts = {}
}, {
    [require(l_Parent_0.Src.Actions.Asset.SaveFontMetadata).name] = function(v4, v5)
        return l_join_0(v4, {
            Fonts = l_join_0(v4.Fonts, v5.metadata)
        });
    end
});
