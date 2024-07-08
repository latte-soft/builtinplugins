return require(script.Parent.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0)
    assert(v0 >= 0, "Number of events should not be negative");
    return {
        currentRecordingNumEvents = v0
    };
end);
