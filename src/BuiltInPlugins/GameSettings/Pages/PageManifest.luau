local v0 = {
    require(script.Parent.BasicInfoPage.BasicInfo), 
    require(script.Parent.PermissionsPage.Permissions), 
    require(script.Parent.MonetizationPage.Monetization), 
    require(script.Parent.SecurityPage.Security), 
    require(script.Parent.PlacesPage.Places), 
    require(script.Parent.LocalizationPage.Localization), 
    require(script.Parent.AvatarPage.Avatar), 
    require(script.Parent.WorldPage.World), 
    (require(script.Parent.OptionsPage.Options))
};
if not (not game:GetFastFlag("AvatarChatSettingsEnabled2") and not game:GetFastFlag("MoveSpatialVoice")) then
    v0[#v0 + 1] = require(script.Parent.CommunicationPage.Communication);
end;
return v0;
