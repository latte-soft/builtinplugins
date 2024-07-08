local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Rodux);
local l_ItemCharacteristics_0 = require(l_Parent_0.Packages.AvatarToolsShared).Util.AccessoryAndBodyToolShared.ItemCharacteristics;
local v4 = require(l_Parent_0.Packages.Dev.Rhodium);
local l_Element_0 = v4.Element;
local l_XPath_0 = v4.XPath;
local l_Localization_0 = v1.ContextServices.Localization;
local v8 = require(l_Parent_0.Src.Reducers.MainReducer);
local v9 = {
    DefaultClothesName = "clothes", 
    DefaultAvatarName = "dummy", 
    AttachmentCFrame = CFrame.new(10, 20, 10), 
    DefaultAttachmentName = "WaistFrontAttachment", 
    DefaultMeshId = "https://assetdelivery.roblox.com/v1/asset/?id=6799863967"
};
local function _()
    wait(0.1);
end;
v9.delay = function()
    wait(0.1);
end;
v9.createTestStore = function()
    return v2.Store.new(v8, nil, {
        v2.thunkMiddleware
    });
end;
v9.clickElement = function(v11, v12)
    v11:click(v12);
    wait(0.1);
end;
v9.sendInputToXPath = function(v13, v14)
    local v15 = v9.clickXPath(v13, 2);
    wait(0.1);
    v15:sendKey(Enum.KeyCode.Backspace);
    wait(0.1);
    v15:sendText(v14);
    wait(0.1);
    v15:sendKey(Enum.KeyCode.Return);
    wait(0.1);
end;
v9.confirmDialog = function()
    local v16 = l_XPath_0.new(game.CoreGui[l_Localization_0.mock():getText("Dialog", "DefaultTitle")]):cat(l_XPath_0.new("SolidBackground.ButtonContainer.1.Contents.TextButton"));
    v9.waitForXPathInstance(v16);
    v9.clickXPath(v16);
end;
v9.goToAssetTypeScreenFromStart = function(v17, v18)
    local v19 = v9.getScreenFlow():cat(l_XPath_0.new("SelectFrame.Content")):cat(l_XPath_0.new("NextAndBackButtonContainer.NextButton.Contents.TextButton"));
    v9.waitForXPathInstance(v19);
    if not v17 then
        if not v18 then
            v9.addLCItemWithoutCageFromExplorer();
        else
            v9.addLCItemWithAttachmentFromExplorer();
        end;
    else
        v9.addLCItemWithFullCageFromExplorer();
    end;
    v9.clickXPath(v19);
    wait(0.1);
end;
v9.goToEditScreenFromStart = function(v20, v21)
    v9.goToAssetTypeScreenFromStart(v20, v21);
    local v22 = v9.getScreenFlow(true):cat(l_XPath_0.new("ExpandablePane.Content"));
    local v23 = v22:cat(l_XPath_0.new("Content.ClothingTypeList.List.Shirt"));
    local v24 = v22:cat(l_XPath_0.new("Content.AccessoryTypeList.List.Waist"));
    local v25 = v22:cat(l_XPath_0.new("Content.List.Front"));
    local v26 = v22:cat(l_XPath_0.new("NextAndBackButtonContainer.NextButton.Contents.TextButton"));
    if not v20 then
        v9.waitForXPathInstance(v24);
        v9.clickXPath(v24);
        v9.waitForXPathInstance(v26);
        v9.clickXPath(v26);
        v9.waitForXPathInstance(v25);
        v9.clickXPath(v25);
    else
        v9.waitForXPathInstance(v23);
        v9.clickXPath(v23);
    end;
    v9.waitForXPathInstance(v26);
    v9.clickXPath(v26);
    wait(0.1);
end;
v9.clickEquippableGridTile = function(v27)
    local v28 = v9.getEquippableGridTilePath(v27);
    v9.waitForXPathInstance(v28);
    local v29 = v28:cat(l_XPath_0.new("Contents.TextButton"));
    v9.waitForXPathInstance(v29);
    v9.clickXPath(v29);
end;
v9.getEquippableGridTilePath = function(v30)
    return v9.getEditScreenContainer():cat(l_XPath_0.new("PreviewSwizzle.Content.PreviewFrame.Grid")):cat(l_XPath_0.new("ScrollingFrame.Scroller")):cat(l_XPath_0.new((tostring(v30 + 1))));
end;
v9.getEquippableGridTileInstance = function(v31)
    return v9.waitForXPathInstance((v9.getEquippableGridTilePath(v31)));
end;
v9.clickXPath = function(v32, v33)
    local v34 = l_Element_0.new(v32);
    v9.clickElement(v34, v33);
    return v34;
end;
local function v37(v35)
    local v36 = os.time();
    while true do
        if v35() then
            return true;
        elseif os.time() - v36 > 5 then
            return false;
        else
            wait(0.1);
        end;
    end;
end;
v9.waitForValid = function(v38)
    return (v37(v38));
end;
v9.waitForXPathInstance = function(v39)
    if not v37(function()
        return v39:getFirstInstance();
    end) then
        return nil;
    else
        return v39:getFirstInstance();
    end;
end;
local function _(v40, v41)
    local l_status_0, l_result_0 = pcall(function()
        return v40[v41];
    end);
    return l_status_0 == true and l_result_0 or nil;
end;
v9.waitForPropertyEqualTo = function(v45, v46, v47)
    return (v37(function()
        local l_v45_0 = v45;
        local l_v46_0 = v46;
        local l_status_1, l_result_1 = pcall(function()
            return l_v45_0[l_v46_0];
        end);
        return (l_status_1 == true and l_result_1 or nil) == v47;
    end));
end;
v9.waitForChildrenCountEqualTo = function(v52, v53)
    return (v37(function()
        return #v52:GetChildren() == v53;
    end));
end;
v9.getScreenFlow = function(v54)
    if not v54 then
        return l_XPath_0.new("game.CoreGui.PluginMockGui.ScreenFlow");
    else
        return l_XPath_0.new("game.CoreGui.PluginMockGui.ScreenFlow.Screen.MainFrame.Scroller");
    end;
end;
v9.getEditScreenContainer = function()
    return l_XPath_0.new("game.CoreGui.PluginMockGui.Container.MainFrame");
end;
v9.cleanTempInstances = function()
    local v55 = v9.getTempInstancesFolder();
    if v55 then
        v55:Destroy();
    end;
    local v56 = v9.getTempScreenGui();
    if v56 then
        v56:Destroy();
    end;
end;
v9.getTempInstancesFolder = function()
    local l_TempInstancesFolder_0 = workspace:FindFirstChild("TempInstancesFolder");
    if not l_TempInstancesFolder_0 then
        l_TempInstancesFolder_0 = Instance.new("Folder");
        l_TempInstancesFolder_0.Name = "TempInstancesFolder";
        l_TempInstancesFolder_0.Parent = workspace;
        return l_TempInstancesFolder_0;
    else
        return l_TempInstancesFolder_0;
    end;
end;
v9.getTempScreenGui = function()
    local l_TempScreenGui_0 = game.CoreGui:FindFirstChild("TempScreenGui");
    if not l_TempScreenGui_0 then
        l_TempScreenGui_0 = Instance.new("ScreenGui", game.CoreGui);
        l_TempScreenGui_0.Name = "TempScreenGui";
        l_TempScreenGui_0.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
        return l_TempScreenGui_0;
    else
        return l_TempScreenGui_0;
    end;
end;
v9.createNonAvatar = function(v59)
    local l_Model_0 = Instance.new("Model");
    l_Model_0.Name = v59 or v9.DefaultAvatarName;
    l_Model_0.Parent = v9.getTempInstancesFolder();
    return l_Model_0;
end;
v9.createClothesWithoutCage = function(v61)
    local l_Model_1 = Instance.new("Model");
    local v63 = Instance.new("MeshPart", l_Model_1);
    v63.Name = v61 or v9.DefaultClothesName;
    l_Model_1.Parent = v9.getTempInstancesFolder();
    return v63;
end;
v9.createClothesWithFullCages = function(v64)
    local l_Model_2 = Instance.new("Model");
    local v66 = Instance.new("MeshPart", l_Model_2);
    v66.Name = v64 or v9.DefaultClothesName;
    l_Model_2.Parent = v9.getTempInstancesFolder();
    Instance.new("MeshPart", v66).Name = v66.Name;
    local v67 = Instance.new("WrapLayer", v66);
    v67.CageMeshId = v9.DefaultMeshId;
    v67.ReferenceMeshId = v9.DefaultMeshId;
    return v66;
end;
v9.createClothesWithOuterCage = function(v68)
    local l_Model_3 = Instance.new("Model");
    local v70 = Instance.new("MeshPart", l_Model_3);
    v70.Name = v68 or v9.DefaultClothesName;
    l_Model_3.Parent = v9.getTempInstancesFolder();
    Instance.new("MeshPart", v70).Name = v70.Name;
    Instance.new("WrapTarget", v70).CageMeshId = v9.DefaultMeshId;
    return v70;
end;
local function v74(v71)
    local l_Model_4 = Instance.new("Model");
    l_Model_4.Parent = v9.getTempInstancesFolder();
    Instance.new("Humanoid").Parent = l_Model_4;
    Instance.new("Part", l_Model_4).Name = "HumanoidRootPart";
    local v73 = Instance.new("MeshPart", l_Model_4);
    v73.Name = "UpperTorso";
    Instance.new("MeshPart", l_Model_4).Name = "LowerTorso";
    Instance.new("MeshPart", l_Model_4).Name = "Head";
    Instance.new("MeshPart", l_Model_4).Name = "LeftFoot";
    Instance.new("MeshPart", l_Model_4).Name = "RightFoot";
    Instance.new("MeshPart", l_Model_4).Name = "LeftHand";
    Instance.new("MeshPart", l_Model_4).Name = "RightHand";
    Instance.new("MeshPart", l_Model_4).Name = "RightUpperArm";
    Instance.new("MeshPart", l_Model_4).Name = "RightLowerArm";
    Instance.new("MeshPart", l_Model_4).Name = "LeftUpperArm";
    Instance.new("MeshPart", l_Model_4).Name = "LeftLowerArm";
    Instance.new("MeshPart", l_Model_4).Name = "LeftUpperLeg";
    Instance.new("MeshPart", l_Model_4).Name = "LeftLowerLeg";
    Instance.new("MeshPart", l_Model_4).Name = "RightUpperLeg";
    Instance.new("MeshPart", l_Model_4).Name = "RightLowerLeg";
    l_Model_4.Name = v71 or v9.DefaultAvatarName;
    Instance.new("WrapTarget", v73);
    return l_Model_4;
end;
v9.createAvatarWithoutCages = function(v75)
    return (v74(v75));
end;
v9.createAvatarWithFullCages = function(v76)
    local v77 = v74(v76);
    Instance.new("Humanoid").Parent = v77;
    local l_MeshPart_0 = Instance.new("MeshPart");
    l_MeshPart_0.Parent = v77;
    Instance.new("Attachment", l_MeshPart_0).Name = v9.DefaultAttachmentName;
    Instance.new("MeshPart", v77).Name = "Inner";
    Instance.new("MeshPart", v77).Name = "Outer";
    v77.PrimaryPart = l_MeshPart_0;
    return v77;
end;
local function _(v79)
    game:GetService("Selection"):Set({
        v79
    });
    wait(0.1);
end;
local function _(v81, v82)
    if v82 then
        v9.clickXPath(v82);
        game:GetService("Selection"):Set({
            v81
        });
        wait(0.1);
        v9.confirmDialog();
        return ;
    else
        return ;
    end;
end;
v9.addRegularPartFromExplorer = function()
    local l_Part_0 = Instance.new("Part");
    l_Part_0.Parent = v9.getTempInstancesFolder();
    game:GetService("Selection"):Set({
        l_Part_0
    });
    wait(0.1);
    return l_Part_0;
end;
v9.addLCItemWithAttachmentFromExplorer = function()
    local v85 = v9.createClothesWithoutCage();
    local v86 = Instance.new("Attachment", v85);
    v86.Name = v9.DefaultAttachmentName;
    v86.CFrame = v9.AttachmentCFrame;
    game:GetService("Selection"):Set({
        v85
    });
    wait(0.1);
    return v85;
end;
v9.addLCItemWithoutCageFromExplorer = function(v87)
    local v88 = v87 or v9.createClothesWithoutCage();
    assert(not l_ItemCharacteristics_0.hasFullCages(v88));
    game:GetService("Selection"):Set({
        v88
    });
    wait(0.1);
    return v88;
end;
v9.addLCItemWithFullCageFromExplorer = function(v89)
    local v90 = v89 or v9.createClothesWithFullCages();
    assert(l_ItemCharacteristics_0.hasFullCages(v90));
    game:GetService("Selection"):Set({
        v90
    });
    wait(0.1);
    return v90;
end;
v9.addLCItemWithOuterCageFromExplorer = function(v91)
    local v92 = v91 or v9.createClothesWithOuterCage();
    assert(l_ItemCharacteristics_0.hasOuterCage(v92));
    game:GetService("Selection"):Set({
        v92
    });
    wait(0.1);
    return v92;
end;
v9.addAvatarWithFullCagesFromExplorer = function()
    local v93 = v9.createAvatarWithFullCages();
    assert(l_ItemCharacteristics_0.hasFullCages(v93));
    game:GetService("Selection"):Set({
        v93
    });
    wait(0.1);
    return v93;
end;
v9.addLCItemWithInvalidCageFromExplorer = function()
    local v94 = v9.createClothesWithFullCages();
    local l_WrapLayer_0 = v94:FindFirstChild("WrapLayer");
    l_WrapLayer_0.CageMeshId = "";
    l_WrapLayer_0.ReferenceMeshId = "";
    assert(l_ItemCharacteristics_0.hasInvalidCage(v94));
    game:GetService("Selection"):Set({
        v94
    });
    wait(0.1);
    return v94;
end;
local function v99(v96)
    local v97 = v9.getEditScreenContainer():cat(l_XPath_0.new("PreviewSwizzle.Content.PreviewFrame.Grid")):cat(l_XPath_0.new("ScrollingFrame.Scroller")):cat(l_XPath_0.new("AddNewTile"));
    v9.waitForXPathInstance(v97);
    local v98 = v97:cat(l_XPath_0.new("Contents.TextButton"));
    v9.waitForXPathInstance(v98);
    if v98 then
        v9.clickXPath(v98);
        game:GetService("Selection"):Set({
            v96
        });
        wait(0.1);
        v9.confirmDialog();
        return ;
    else
        return ;
    end;
end;
v9.addAvatarToGrid = function()
    v99(v9.createAvatarWithFullCages());
end;
v9.addClothesItemToGrid = function()
    v99(v9.createClothesWithFullCages());
end;
return v9;
