local v0 = {
    PublishTags = {
        AdapterTagging = {
            Name = "R15MigratorHasAdapter", 
            Mask = 1
        }, 
        CharacterTagging = {
            Name = "R15MigratorUnconvertedCharacter", 
            Mask = 2
        }, 
        AnimationTagging = {
            Name = "R15MigratorUnconvertedAnimation", 
            Mask = 4
        }, 
        ScriptTagging = {
            Name = "R15MigratorUnconvertedScript", 
            Mask = 8
        }
    }, 
    NonePublishTags = {
        CharactersConvertedToR15Tag = "R15MigratorCharactersConvertedToR15"
    }, 
    AttributePrefix = "RBX_R15Migrator_", 
    PreviewSpeeds = {
        0.25, 
        0.5, 
        0.75, 
        1, 
        1.25, 
        1.5, 
        1.75, 
        2
    }, 
    StatusTableData = {
        TEXT_COLUMN_INDEX = 1, 
        STATUS_COLUMN_INDEX = 2
    }, 
    CrossPluginCommunicationName = "R15Migrator", 
    CrossPluginCommunicationInstructions = {
        Open = "Open", 
        Published = "Published"
    }, 
    ScriptMenuActions = {
        GoToScript = "GoToScript", 
        ShowInExplorer = "ShowInExplorer", 
        RevertScript = "RevertScript", 
        SelectAllSimilar = "SelectAllSimilar"
    }
};
v0.Attributes = {
    TempId = v0.AttributePrefix .. "R15MigratorTempId", 
    OriginalId = v0.AttributePrefix .. "OriginalId", 
    Name = v0.AttributePrefix .. "name", 
    Adapted = v0.AttributePrefix .. "Adapted"
};
return v0;
