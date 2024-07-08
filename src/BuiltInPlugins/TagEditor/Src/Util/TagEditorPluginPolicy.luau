local v0 = require(script.Parent.Parent.Parent.Src.Util.DebugFlags);
return {
    getAreCustomIconsAndEmojiAllowed = function()
        if not v0.RunningUnderCLI() then
            return game:GetService("PluginPolicyService"):getPluginPolicy("TagEditor").AreCustomIconsAndEmojiAllowed;
        else
            return true;
        end;
    end
};
