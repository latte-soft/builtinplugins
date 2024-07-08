local v0 = require(script.Parent.Parent.Parent.Src.Testing.isFTF);
return function()
    if not v0() then
        return game:GetFastFlag("HideAnimationSettingForGltf");
    else
        return true;
    end;
end;
