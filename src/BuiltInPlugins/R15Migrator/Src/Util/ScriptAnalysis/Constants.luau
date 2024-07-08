local v0 = require(script:FindFirstAncestor("R15Migrator").Src.Resources.Constants);
return {
    StartKey = "start", 
    EndKey = "end", 
    CharacterLimit = 199987, 
    AttributeChunkNameBase = v0.AttributePrefix .. "ScriptBackupChunk", 
    AttributeChunkCountName = v0.AttributePrefix .. "ScriptBackupCount", 
    AttributeInitialIssueCountName = v0.AttributePrefix .. "InitialIssueCount", 
    AttributeUnificationScriptName = v0.AttributePrefix .. "UnificationScript", 
    ScriptStatus = {
        AutoConverted = "AutoConverted", 
        Complete = "Complete", 
        Reverted = "Reverted", 
        Warning = "Warning", 
        Error = "Error", 
        VariableError = "VariableError", 
        None = "None"
    }, 
    ReferenceKey = "Reference", 
    ScriptBackupTag = "R15MigratorScriptHasBackup"
};
