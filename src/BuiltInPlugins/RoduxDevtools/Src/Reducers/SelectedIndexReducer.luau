local l_Parent_0 = script.Parent.Parent.Parent;
return (require(l_Parent_0.Packages.Rodux).createReducer(0, {
    [require(l_Parent_0.Src.Actions.UpdateSelectedIndex).name] = function(_, v2)
        return v2.selectedIndex;
    end
}));
