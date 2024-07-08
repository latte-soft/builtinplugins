local v3 = {
    init = function(v0)
        v0.HasPublished = false;
        v0:resetSession();
    end, 
    resetSession = function(v1)
        v1.FirstAction = nil;
        v1.CurrentScreen = nil;
        v1.RigidFlow = false;
        v1.TotalLayers = 0;
        v1.TotalAvatars = 1;
        v1.CageEdits = 0;
    end, 
    reset = function(v2)
        v2:init();
    end
};
v3:init();
return v3;
