local l_CollectionService_0 = game:GetService("CollectionService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_HttpService_0 = game:GetService("HttpService");
local l_ServerStorage_0 = game:GetService("ServerStorage");
local l_Workspace_0 = game:GetService("Workspace");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v6 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v7 = require(l_script_FirstAncestor_0.Packages.Framework);
local v8 = require(l_script_FirstAncestor_0.Packages.React);
local v9 = require(l_script_FirstAncestor_0.Packages.ReactRoblox);
local v10 = require(l_script_FirstAncestor_0.Packages.Dev.ReactTestingLibrary);
local v11 = require(l_script_FirstAncestor_0.Packages.Dev.Rhodium);
local v12 = require(script.createDisambiguationMenuTestHelpers);
local v13 = require(l_script_FirstAncestor_0.RhodiumTests.createMockContext);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v15 = require(l_script_FirstAncestor_0.Src.Components.App);
local v16 = require(l_script_FirstAncestor_0.Src.Components.ContextStack);
local v17 = require(l_script_FirstAncestor_0.Src.Components.PlacesServiceContext);
local v18 = require(l_script_FirstAncestor_0.Src.Components.RunServiceContext);
local v19 = require(l_script_FirstAncestor_0.Src.Components.UGCAvatarServiceContext);
local v20 = require(l_script_FirstAncestor_0.RhodiumTests.UGCValidationContextMocks);
local v21 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerAddGeoToSelection);
local v22 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerEditingTools);
local v23 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerPickTabsMenu);
local l_provideMockContext_0 = v7.TestHelpers.provideMockContext;
local v28 = {
    clickSimpleTab = function(v25)
        v25.Size = UDim2.fromOffset(0, 1);
        v9.act(function()
            v11.Element.new(v25):click();
        end);
    end, 
    freshLizard = function(v26)
        local v27 = l_Workspace_0.Lizard:Clone();
        if v26 ~= nil then
            v27.Name = v26;
        end;
        v27.Parent = l_Workspace_0;
        return v27;
    end
};
local function v37(v29)
    if v22() then
        local function v32(v30)
            local l_v30_FirstAncestorWhichIsA_0 = v30:FindFirstAncestorWhichIsA("ScreenGui");
            assert(l_v30_FirstAncestorWhichIsA_0 ~= nil, "Couldn't find ScreenGui for toolbar");
            l_v30_FirstAncestorWhichIsA_0.DisplayOrder = v29;
        end;
        for _, v34 in (l_CollectionService_0:GetTagged("VPF-Toolbar")), nil, nil do
            local l_v34_FirstAncestorWhichIsA_0 = v34:FindFirstAncestorWhichIsA("ScreenGui");
            assert(l_v34_FirstAncestorWhichIsA_0 ~= nil, "Couldn't find ScreenGui for toolbar");
            l_v34_FirstAncestorWhichIsA_0.DisplayOrder = v29;
        end;
        local v36 = l_CollectionService_0:GetInstanceAddedSignal("VPF-Toolbar"):Connect(v32);
        return function()
            v36:Disconnect();
        end;
    else
        return function()
        end;
    end;
end;
local function v128(v38)
    local l_Folder_0 = Instance.new("Folder");
    local v40 = ("AvatarPreviewer_%*"):format((l_HttpService_0:GenerateGUID()));
    local l_ScreenGui_0 = Instance.new("ScreenGui");
    l_ScreenGui_0.Name = v40;
    l_ScreenGui_0.Parent = l_CoreGui_0;
    local v42 = v9.createBlockingRoot(l_ScreenGui_0);
    local v43, v44 = v13();
    local v46 = {
        isRunning = function()
            local v45 = false;
            if v38 ~= nil then
                v45 = v38.runServiceIsRunning == true;
            end;
            return v45;
        end
    };
    if v38 ~= nil and v38.devFrameworkContexts ~= nil then
        v43.context = v6.List.join(v43.context, v38.devFrameworkContexts);
    end;
    v9.act(function()
        v42:render(l_provideMockContext_0(v43.context, (v8.createElement(v16, {
            providers = v6.List.join({
                v8.createElement(v19.Provider, {
                    value = l_Folder_0
                }), 
                v8.createElement(v17.Provider, {
                    value = v44.placesService
                }), 
                v8.createElement(v18.Provider, {
                    value = v46
                })
            }, if v38 ~= nil and v38.wrapAppContexts ~= nil then v38.wrapAppContexts else {})
        }, v8.createElement(v15, {
            additionalAvatarContext = v6.List.join({
                v8.createElement(v20.NeverReturnsProvider)
            }, not not v38 and v38.additionalAvatarContext or {})
        })))));
    end);
    assert(#l_ScreenGui_0:GetChildren() > 0, "Container is empty after mount");
    local v51 = {
        ui = assert(l_CoreGui_0:FindFirstChild(v40), "Couldn't find previewer screen"), 
        placesService = v43.placesService, 
        destroy = function()
            v9.act(function()
                v42:unmount();
            end);
            l_ScreenGui_0:Destroy();
        end, 
        select = function(v47)
            v9.act(function()
                v43.selectionService:Set(v47);
            end);
        end, 
        getSelection = function()
            return v43.selectionService:Get();
        end, 
        getLastAnalyticsEvent = function()
            return v43.analyticsService.lastEvent;
        end, 
        subWindows = function()
            return v43.plugin.subWindows;
        end, 
        getSubWindow = function(v48)
            return v43.plugin:GetSubWindow(v48);
        end, 
        getStyledDialogButton = function(v49, v50)
            return v49.SolidBackground.ButtonContainer[v50].Contents.TextButton;
        end
    };
    v51.clickStyledDialogButton = function(v52, v53)
        v9.act(function()
            v11.Element.new(v51.getStyledDialogButton(v52, v53)):click();
        end);
    end;
    v51.getStyledDialogContent = function(v54)
        return v54.SolidBackground.Contents.Contents;
    end;
    v51.freshLizard = function()
        return v28.freshLizard((("FreshLizard_%*"):format(v40)));
    end;
    v51.selectFreshLizard = function()
        return v51.select({
            v51.freshLizard()
        });
    end;
    v51.pathOf = function(v55)
        return v11.XPath.new((("game.CoreGui.%*.%*"):format(v40, if typeof(v55) == "string" then v55 else v55:toString())));
    end;
    v51.elementByPath = function(v56)
        return v11.Element.new(v51.pathOf(v56));
    end;
    v51.debugPath = function(v57)
        local v58 = nil;
        local v59 = if typeof(v57) == "string" then v11.XPath.new(v57) else v57;
        while true do
            local v60 = v59:parent();
            if v60:toString() ~= v59:toString() then
                v58 = v51.elementByPath(v60:setWait(0)):getRbxInstance();
                if v58 == nil then
                    v59 = v60;
                else
                    break;
                end;
            else
                break;
            end;
        end;
        local v61 = {};
        if not v58 then
            table.insert(v61, "No segment found");
        else
            table.insert(v61, v58:GetFullName());
            table.insert(v61, "Children found:");
            for _, v63 in v58:GetChildren() do
                table.insert(v61, (("\t- %*"):format(v63.Name)));
            end;
        end;
        return table.concat(v61, "\n");
    end;
    v51.expectElementByPath = function(v64)
        local v65 = v51.elementByPath(v64);
        if v65:getRbxInstance() == nil then
            error((("%* was not found\nClosest match: %*"):format(if typeof(v64) == "string" then v64 else v64:toString(), (v51.debugPath(v64)))));
        end;
        return v65;
    end;
    v51.expectInstanceByPath = function(v66)
        return v51.expectElementByPath(v66):getRbxInstance();
    end;
    v51.instanceByPath = function(v67)
        return v11.Element.new(v51.pathOf(v67):setWait(0)):getRbxInstance();
    end;
    v51.clickPath = function(v68)
        v9.act(function()
            v51.expectElementByPath(v68):click();
        end);
    end;
    v51.getByImage = function(v69)
        local v70 = {};
        for _, v72 in v51.ui:GetDescendants() do
            if not (not v72:IsA("ImageLabel") and not v72:IsA("ImageButton")) and v72.Image:match("rbxasset://studio_svg_textures/Lua/AvatarCompatibilityPreviewer/[^/]+/[^/]+/([^@]*).*%.png") == v69 then
                table.insert(v70, v72);
            end;
        end;
        return v70;
    end;
    v51.resize = function(v73, v74)
        v9.act(function()
            l_ScreenGui_0:GetChildren()[1].Size = UDim2.fromOffset(v73, v74);
            task.wait();
        end);
    end;
    v51.resizeToDefault = function()
        v51.resize(1024, 758);
    end;
    v51.AvatarScreen = {};
    v51.AvatarScreen.XPATH_ASSET_PALETTES = not v23() and "AvatarScreen.Contents.Tabs.AssetPalettes.Scroller.Tabs" or "AvatarScreen.Contents.Tabs.AssetPalettes.ScrollingFrame.Scroller.Tabs";
    local function v79(v75, v76)
        for _, v78 in v51.expectInstanceByPath(v75):GetChildren() do
            if not (not v78:IsA("TextButton") or not v78.Row.Label.Text:match((("%%.%*:"):format(v76)))) then
                assert(v78:IsA("TextButton"), "Tab should be a button");
                v28.clickSimpleTab(v78);
                return ;
            end;
        end;
        error((("Could not find %*"):format(v76)));
    end;
    v51.AvatarScreen.isActive = function()
        return v51.instanceByPath("AvatarScreen") ~= nil;
    end;
    v51.AvatarScreen.isPalettesPickTabMenuActive = function()
        return v51.instanceByPath("AvatarScreen.Contents.Tabs.AssetPalettes.PickTabMenu") ~= nil;
    end;
    v51.AvatarScreen.isCategoryPickTabMenuActive = function()
        return v51.instanceByPath("AvatarScreen.Contents.Tabs.TabBar.PickTabMenu") ~= nil;
    end;
    v51.AvatarScreen.waitUntilActive = function(v80)
        local v81 = os.clock();
        while true do
            if os.clock() - v81 < (v80 or 1) then
                if not v51.AvatarScreen.isActive() then
                    v9.act(task.wait);
                else
                    return ;
                end;
            else
                error("AvatarScreen didn't become active within timeout");
                return ;
            end;
        end;
    end;
    v51.AvatarScreen.clickCategory = function(v82)
        v79("AvatarScreen.Contents.Tabs.TabBar.ScrollingFrame.Scroller.Tabs", v82);
    end;
    v51.AvatarScreen.clickPalette = function(v83)
        v79(v51.AvatarScreen.XPATH_ASSET_PALETTES, v83);
    end;
    v51.AvatarScreen.clickBuiltin = function(v84)
        local v85 = v51.expectElementByPath((("AvatarScreen.Contents.Contents.CatalogContainer.CatalogContainer.Catalog.ScrollingFrame.Scroller.item_builtin_%*.Contents.TextButton"):format(v84)));
        v9.act(function()
            v85:click();
        end);
    end;
    v51.AvatarScreen.clickInstance = function(v86)
        local v87 = v51.expectElementByPath((("AvatarScreen.Contents.Contents.CatalogContainer.CatalogContainer.Catalog.ScrollingFrame.Scroller.item_instance_%*.Contents.TextButton"):format(v86)));
        v9.act(function()
            v87:click();
        end);
    end;
    v51.AvatarScreen.catalogItemCounts = function()
        local v88 = v51.expectInstanceByPath("AvatarScreen.Contents.Contents.CatalogContainer.CatalogContainer.Catalog.ScrollingFrame.Scroller");
        local v89 = 0;
        local v90 = 0;
        for _, v92 in v88:GetChildren() do
            local v93, v94 = v92.Name:match("item_([a-z]+)_([0-9]+)");
            if v93 ~= nil and v94 ~= nil then
                local v95 = tonumber(v94);
                assert(v95 ~= nil, "Pattern should not be returning non-numeric indexes");
                if v93 == "builtin" then
                    v89 = math.max(v89, v95);
                elseif v93 == "instance" then
                    v90 = math.max(v90, v95);
                else
                    error((("Unknown item type: %*"):format(v93)));
                end;
            end;
        end;
        return {
            builtins = v89, 
            instances = v90
        };
    end;
    v51.AvatarScreen.selectedPaletteText = function()
        for _, v97 in v51.expectInstanceByPath(v51.AvatarScreen.XPATH_ASSET_PALETTES):GetChildren() do
            if not (not v97:IsA("TextButton") or not v97.Row.Label.FontFace.Bold) then
                return v97.Row.Label.Text;
            end;
        end;
        error("Palettes are open, but there is no open palette");
    end;
    v51.AvatarScreen.selectedPaletteKey = function()
        return (assert(v51.AvatarScreen.selectedPaletteText():match(".+%.(.-):%[%]$"), "Couldn't match palette key"));
    end;
    v51.AvatarScreen.getDummy = function()
        local v98 = v51.elementByPath("AvatarScreen.Contents.Contents.Preview.DummyPreview.DummyPreview.WorldModel.Dummy"):waitForRbxInstance(5);
        if v98 ~= nil then
            return v98;
        else
            return (v51.expectInstanceByPath("AvatarScreen.Contents.Contents.Preview.DummyPreview.DummyPreview.WorldModel.Dummy"));
        end;
    end;
    v51.AvatarScreen.clickAddItem = function()
        v51.clickPath("AvatarScreen.Contents.Contents.CatalogContainer.CatalogContainer.Catalog.AddItemButton");
    end;
    v51.AvatarScreen.getSidebarItems = function()
        local function _(v99)
            if not v99:IsA("ImageLabel") then
                return v99;
            else
                return v99.Image;
            end;
        end;
        local function v103(v101, v102)
            return v101.yPosition < v102.yPosition;
        end;
        local v104 = v51.expectInstanceByPath("AvatarScreen.Contents.Contents.Preview.EquippedItemsSidebar");
        local v105 = {};
        for _, v107 in v104.Contents.LayeredClothingEquipment:GetChildren() do
            local v108 = {
                yPosition = v107.AbsolutePosition.Y, 
                instance = v107
            };
            local l_Preview_0 = v10.getByTestId(v107, "EquippedItemPreview").Inner.Preview;
            v108.preview = if not l_Preview_0:IsA("ImageLabel") then l_Preview_0 else l_Preview_0.Image;
            table.insert(v105, v108);
        end;
        local v110 = {};
        for _, v112 in v104.OtherEquipment.Scroller:GetChildren() do
            if v112:IsA("Frame") then
                local v113 = {
                    yPosition = v112.AbsolutePosition.Y, 
                    instance = v112
                };
                local l_Preview_1 = v112.Inner.Preview;
                v113.preview = if not l_Preview_1:IsA("ImageLabel") then l_Preview_1 else l_Preview_1.Image;
                table.insert(v110, v113);
            end;
        end;
        table.sort(v105, v103);
        table.sort(v110, v103);
        return {
            layeredClothing = v105, 
            otherEquipment = v110
        };
    end;
    v51.AvatarScreen.clickSubmitButton = function()
        v51.clickPath("AvatarScreen.StageSelect.Contents.Publish");
    end;
    v51.AvatarScreen.clickCheckFaceMode = function()
        v51.clickPath("AvatarScreen.StageSelect.Contents.CheckFace");
    end;
    v51.AvatarScreen.clickHideShowButton = function()
        local v115 = v51.AvatarScreen.getSidebarItems();
        local v116 = nil;
        for _, v118 in v115.layeredClothing, nil, nil do
            local l_instance_0 = v118.instance;
            v9.act(function()
                v11.VirtualInput.Mouse.SendMouseMoveEvent(l_instance_0.AbsolutePosition.X, l_instance_0.AbsolutePosition.Y);
                v11.VirtualInput.waitForInputEventsProcessed();
            end);
            local v120 = l_instance_0:GetChildren()[1];
            if v120 ~= nil then
                v116 = v120:FindFirstChild("Outer"):GetChildren()[1]:FindFirstChild("HideShowPane");
            end;
            if not (v116 == nil) then
                break;
            end;
        end;
        assert(v116 ~= nil, "did not find button");
        local l_v116_FullName_0 = v116:GetFullName();
        local v122 = string.find(l_v116_FullName_0, "AvatarScreen");
        assert(v122 ~= nil, "invalid path");
        v51.clickPath((string.sub(l_v116_FullName_0, v122)));
    end;
    v51.AvatarScreen.getSkinToneButtons = function()
        assert(v51.AvatarScreen.selectedPaletteKey() == "Skin", "Not on Skin tab");
        local v123 = {};
        for _, v125 in v10.getAllByTestId(v51.ui, "SkinPreview") do
            table.insert(v123, {
                color = v125.BackgroundColor3, 
                click = function()
                    v9.act(function()
                        v11.Element.new(v125):click();
                    end);
                end, 
                isClickable = not v125:IsA("TextButton")
            });
        end;
        return v123;
    end;
    v51.AutoSetupScreen = {};
    v51.AutoSetupScreen.getAlertDescription = function()
        local v126 = v51.instanceByPath("Provider.ErrorAlert.Alert.Contents.Description");
        local v127 = true;
        if v126 ~= nil then
            v127 = v126:IsA("TextLabel");
        end;
        assert(v127, "Description isn't a valid instance");
        return v126 and v126.Text;
    end;
    v51.AutoSetupScreen.getDummy = function()
        return (v51.expectInstanceByPath("Provider.ModelPreview.ModelPreview.ViewportFrame.WorldModel.Dummy"));
    end;
    v51.AutoSetupScreen.startAutoSetup = function()
        v51.clickPath("Provider.Controls.Start");
    end;
    v51.AutoSetupScreen.controlsActive = function()
        assert(v51.AutoSetupScreen.isActive(), "Auto setup screen is not active");
        return v51.instanceByPath("Provider.Controls") ~= nil;
    end;
    v51.AutoSetupScreen.isActive = function()
        return v51.instanceByPath("Provider.ModelPreview.ModelPreview.ViewportFrame.WorldModel.Dummy") ~= nil;
    end;
    v51.SelectScreen = {};
    v51.SelectScreen.isActive = function()
        if not v21() then
            return v51.instanceByPath("Provider.ImportCharacterFrom") ~= nil;
        else
            return v51.instanceByPath("Provider.Buttons") ~= nil;
        end;
    end;
    v51.SelectScreen.clickAddSelected = function()
        v51.clickPath("Provider.Buttons.AddSelected");
    end;
    v51.DisambiguationMenu = v12(v51);
    v51.TestingScreen = {};
    v51.TestingScreen.isActive = function()
        return v51.instanceByPath("Provider.StopButton") ~= nil;
    end;
    v51.TestingScreen.clickStop = function()
        v51.clickPath("Provider.StopButton");
    end;
    return v51;
end;
v28.withTestPreviewer = function(v129, v130)
    return function()
        local v131 = v128(v130);
        local v132 = v37(-1);
        v129(v131);
        v132();
        v131.destroy();
    end;
end;
v28.withClonedLizard = function(v133)
    return function()
        local v134 = l_Workspace_0.Lizard:Clone();
        v134.Name = "LizardClone";
        v134.Parent = l_Workspace_0;
        v133(v134);
        v134:Destroy();
    end;
end;
v28.withPreviewerAndLizard = function(v135, v136)
    return v28.withTestPreviewer(function(v137)
        return v28.withClonedLizard(function(v138)
            v137.select({
                v138
            });
            v135(v137, v138);
        end)();
    end, v136);
end;
v28.testAssets = l_ServerStorage_0.TestAssets;
return v28;
