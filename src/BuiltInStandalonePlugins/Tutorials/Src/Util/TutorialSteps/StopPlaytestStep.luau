local v0 = require(script.Parent.TutorialStep).extend("StopPlaytest");
v0.bind = function(v1)
    v1.tutorial.stopPlaying = function()
        v1:complete();
    end;
    v1.tutorial:resetAttachment();
end;
v0.unbind = function(v2)
    v2.tutorial.stopPlaying = nil;
end;
return v0;
