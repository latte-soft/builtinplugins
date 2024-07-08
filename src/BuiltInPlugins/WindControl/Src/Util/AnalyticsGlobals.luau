return {
    textFieldCount = 0, 
    sliderCount = 0, 
    greenCircleCount = 0, 
    reset = function(v0)
        v0.textFieldCount = 0;
        v0.sliderCount = 0;
        v0.greenCircleCount = 0;
    end, 
    totalCount = function(v1)
        return (v1.textFieldCount + v1.sliderCount) + v1.greenCircleCount;
    end
};
