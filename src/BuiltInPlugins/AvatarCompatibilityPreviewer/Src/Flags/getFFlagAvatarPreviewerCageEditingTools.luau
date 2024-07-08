local l_BaseWrapVerticesModified_0 = game:GetFastFlag("BaseWrapVerticesModified");
game:DefineFastFlag("EnableCageEditingTools_Dev", false);
return function()
    return game:GetFastFlag("EnableCageEditingTools_Dev") and l_BaseWrapVerticesModified_0;
end;
