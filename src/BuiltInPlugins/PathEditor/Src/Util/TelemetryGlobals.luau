return {
    selectModeCount = 0, 
    addPointModeCount = 0, 
    addTangentModeCount = 0, 
    totalCount = function(v0)
        return (v0.selectModeCount + v0.addPointModeCount) + v0.addTangentModeCount;
    end, 
    reset = function(v1)
        v1.selectModeCount = 0;
        v1.addPointModeCount = 0;
        v1.addTangentModeCount = 0;
    end
};
