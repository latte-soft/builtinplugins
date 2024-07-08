local v0 = require(script.Parent.TutorialStep).extend("Playtest");
v0.bind = function(v1)
    v1.tutorial.startPlaying = function()
        v1.callout:Destroy();
        v1.callout = v1.tutorial:showCallout({
            title = v1.tutorial.localization:getText("Tutorial", "StopPlaytest_Title"), 
            description = v1.tutorial.localization:getText("Tutorial", "StopPlaytest_Description"), 
            target = "simulationResetAction", 
            anchorPoint = Vector2.new(0.5, 0)
        });
    end;
    v1.tutorial.stopPlaying = function()
        v1:complete();
    end;
    v1.callout = v1.tutorial:showCallout({
        title = v1.data.title, 
        description = v1.data.description, 
        target = "playGameActionGroup", 
        anchorPoint = Vector2.new(0.5, 0)
    });
end;
v0.unbind = function(v2)
    v2.callout:Destroy();
    v2.tutorial.startPlaying = nil;
    v2.tutorial.stopPlaying = nil;
end;
return v0;
