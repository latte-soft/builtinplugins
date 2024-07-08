return require(script:FindFirstAncestor("AnimationClipEditor").Packages.Rodux).createReducer(nil, {
    SetAnimationData = function(_, v1)
        return v1.animationData;
    end
});
