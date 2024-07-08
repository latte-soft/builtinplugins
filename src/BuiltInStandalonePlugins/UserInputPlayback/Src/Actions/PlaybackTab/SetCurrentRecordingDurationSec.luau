return require(script.Parent.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0)
    assert(v0 >= 0, "Duration should not be negative");
    return {
        currentRecordingDurationSec = v0
    };
end);
