local l_Parent_0 = script.Parent.Parent.Parent;
return (require(l_Parent_0.Packages.Rodux).createReducer("", {
    [require(l_Parent_0.Src.Actions.UpdateSearchTerm).name] = function(_, v2)
        return v2.searchTerm;
    end
}));
