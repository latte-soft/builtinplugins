return (require(script:FindFirstAncestor("R15Migrator").Packages.Rodux).combineReducers({
    AnimationConversion = require(script.Parent.AnimationConversion), 
    CharacterConversion = require(script.Parent.CharacterConversion), 
    ScriptConversion = require(script.Parent.ScriptConversion), 
    Adapter = require(script.Parent.Adapter), 
    PanelSelection = require(script.Parent.PanelSelection), 
    DataDisplay = require(script.Parent.DataDisplay), 
    AvatarType = function(v0, v1)
        if v1.type == "SetAvatarType" then
            return v1.avatarType;
        else
            return v0;
        end;
    end, 
    ConversionProgress = require(script.Parent.ConversionProgress)
}));
