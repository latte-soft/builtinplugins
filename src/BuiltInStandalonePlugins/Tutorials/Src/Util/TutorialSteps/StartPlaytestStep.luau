local v0 = require(script.Parent:FindFirstAncestor("Tutorials").Src.Flags.getFFlagTutorialsUseLuaRibbon)();
local l_LabelRibbonControlGroups_0 = game:GetFastFlag("LabelRibbonControlGroups");
local v2 = require(script.Parent.TutorialStep).extend("StartPlaytest");
v2.bind = function(v3)
    v3.tutorial.startPlaying = function()
        v3:complete();
    end;
    v3.tutorial:attachTo(if not v0 then {
        target = not l_LabelRibbonControlGroups_0 and "simulationToggleAccuratePlaySoloAction" or "playGameActionGroupRibbonControl", 
        offset = if not l_LabelRibbonControlGroups_0 then Vector2.new(-35, 50) else Vector2.new(0, 5)
    } else {
        TargetWidgetUri = {
            DataModel = "Standalone", 
            PluginType = "Standalone", 
            PluginId = "Ribbon", 
            Category = "Widgets", 
            ItemId = "LeftMezzanine/PlayControls/1"
        }, 
        SubjectAnchorPoint = Vector2.new(0, 0), 
        TargetAnchorPoint = Vector2.new(0, 1), 
        Offset = Vector2.new(0, 20)
    });
end;
v2.unbind = function(v4)
    v4.tutorial.startPlaying = nil;
end;
return v2;
