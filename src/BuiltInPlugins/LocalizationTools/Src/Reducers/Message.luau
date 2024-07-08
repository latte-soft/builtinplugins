return require(script.Parent.Parent.Parent.Packages.Rodux).createReducer("", {
    SetMessage = function(_, v1)
        return v1.message;
    end
});
