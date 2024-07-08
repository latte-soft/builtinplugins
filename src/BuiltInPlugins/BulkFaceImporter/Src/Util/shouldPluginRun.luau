local v0 = require(script.Parent.Parent.Parent.Src.Flags.FFlagEnableBulkFaceImporter);
return function()
    return game:GetService("StudioService"):HasInternalPermission() and v0();
end;
