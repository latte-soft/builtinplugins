local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Packages.Framework).Util.LayoutOrderIterator;
local v2 = require(l_Parent_0.Src.Util.ModernIcons);
local l_shouldEnableAudioImport_0 = require(l_Parent_0.Src.Util.AssetManagerUtilities).shouldEnableAudioImport;
local l_shouldEnableVideoImport_0 = require(l_Parent_0.Src.Util.AssetManagerUtilities).shouldEnableVideoImport;
local l_Places_0 = v2.IconEnums.Places;
local l_Images_0 = v2.IconEnums.Images;
local l_Meshes_0 = v2.IconEnums.Meshes;
local l_Packages_0 = v2.IconEnums.Packages;
local l_Audio_0 = v2.IconEnums.Audio;
local l_Video_0 = v2.IconEnums.Video;
local l_Models_0 = v2.IconEnums.Models;
local v12 = {
    MAIN = {
        Path = "MAIN"
    }, 
    PLACES = {
        Path = "PLACES"
    }, 
    MESHES = {
        Path = "MESHES"
    }, 
    IMAGES = {
        Path = "IMAGES"
    }, 
    PACKAGES = {
        Path = "PACKAGES"
    }
};
if l_shouldEnableAudioImport_0() then
    v12.AUDIO = {
        Path = "AUDIO"
    };
    v12.AUDIO.Parent = v12.MAIN.Path;
    v12.AUDIO.AssetType = Enum.AssetType.Audio;
    v12.AUDIO.LayoutOrder = 6;
    v12.AUDIO.Image = l_Audio_0;
end;
if l_shouldEnableVideoImport_0() then
    v12.VIDEO = {
        Path = "VIDEO"
    };
    v12.VIDEO.Parent = v12.MAIN.Path;
    v12.VIDEO.AssetType = Enum.AssetType.Video;
    v12.VIDEO.LayoutOrder = 7;
    v12.VIDEO.Image = l_Video_0;
end;
v12.MODELS = {
    Path = "MODELS"
};
v12.MODELS.Parent = v12.MAIN.Path;
v12.MODELS.AssetType = Enum.AssetType.Model;
v12.MODELS.LayoutOrder = not l_shouldEnableVideoImport_0() and 7 or 8;
v12.MODELS.Image = l_Models_0;
v12.MESHES.Parent = v12.MAIN.Path;
v12.IMAGES.Parent = v12.MAIN.Path;
v12.PACKAGES.Parent = v12.MAIN.Path;
v12.PLACES.Parent = v12.MAIN.Path;
v12.MESHES.AssetType = Enum.AssetType.MeshPart;
v12.IMAGES.AssetType = Enum.AssetType.Image;
v12.PACKAGES.AssetType = Enum.AssetType.Package;
v12.PLACES.AssetType = Enum.AssetType.Place;
v12.PLACES.LayoutOrder = 1;
v12.IMAGES.LayoutOrder = 2;
v12.MESHES.LayoutOrder = 3;
v12.PACKAGES.LayoutOrder = 4;
v12.PLACES.Image = l_Places_0;
v12.IMAGES.Image = l_Images_0;
v12.MESHES.Image = l_Meshes_0;
v12.PACKAGES.Image = l_Packages_0;
return v12;
