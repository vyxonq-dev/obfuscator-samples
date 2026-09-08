-- afem max 1.4
-- something
if not game:IsLoaded() then
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Script loading",
		Text = "Waiting for the game to finish loading!",
		Duration = 5
	})
	game.Loaded:Wait()
end
		-- Instances:
local Converted = {
	["_AFEMMax"] = Instance.new("ScreenGui");
	["_FUNCTIONS"] = Instance.new("ModuleScript");
	["_SBT"] = Instance.new("ModuleScript");
	["_DraggableObject"] = Instance.new("ModuleScript");
	["_Init"] = Instance.new("LocalScript");
	["_Menu"] = Instance.new("Frame");
	["_UICorner"] = Instance.new("UICorner");
	["_Branding"] = Instance.new("Frame");
	["_Icon"] = Instance.new("ImageLabel");
	["_UIListLayout"] = Instance.new("UIListLayout");
	["_Naming"] = Instance.new("Frame");
	["_HoverEffect"] = Instance.new("LocalScript");
	["_PriorityLine"] = Instance.new("TextLabel");
	["_UIFlexItem"] = Instance.new("UIFlexItem");
	["_UIListLayout1"] = Instance.new("UIListLayout");
	["_Line"] = Instance.new("TextLabel");
	["_UIFlexItem1"] = Instance.new("UIFlexItem");
	["_UIGradient"] = Instance.new("UIGradient");
	["_UISizeConstraint"] = Instance.new("UISizeConstraint");
	["_Bar"] = Instance.new("ImageButton");
	["_Tip"] = Instance.new("TextLabel");
	["_UICorner1"] = Instance.new("UICorner");
	["_UIPadding"] = Instance.new("UIPadding");
	["_UIScale"] = Instance.new("UIScale");
	["_CanvasGroup"] = Instance.new("CanvasGroup");
	["_UICorner2"] = Instance.new("UICorner");
	["_Icon1"] = Instance.new("ImageLabel");
	["_Open"] = Instance.new("TextButton");
	["_Area"] = Instance.new("Frame");
	["_UIListLayout2"] = Instance.new("UIListLayout");
	["_CategorySelect"] = Instance.new("Frame");
	["_UIFlexItem2"] = Instance.new("UIFlexItem");
	["_UIListLayout3"] = Instance.new("UIListLayout");
	["_Emotes"] = Instance.new("TextButton");
	["_UICorner3"] = Instance.new("UICorner");
	["_UIPadding1"] = Instance.new("UIPadding");
	["_Icon2"] = Instance.new("ImageLabel");
	["_TextLabel"] = Instance.new("TextLabel");
	["_UIScale1"] = Instance.new("UIScale");
	["_UIStroke"] = Instance.new("UIStroke");
	["_Glass"] = Instance.new("UIGradient");
	["_AnimationPacks"] = Instance.new("TextButton");
	["_UICorner4"] = Instance.new("UICorner");
	["_UIPadding2"] = Instance.new("UIPadding");
	["_Icon3"] = Instance.new("ImageLabel");
	["_TextLabel1"] = Instance.new("TextLabel");
	["_UIScale2"] = Instance.new("UIScale");
	["_UIStroke1"] = Instance.new("UIStroke");
	["_Glass1"] = Instance.new("UIGradient");
	["_Settings"] = Instance.new("TextButton");
	["_UICorner5"] = Instance.new("UICorner");
	["_UIPadding3"] = Instance.new("UIPadding");
	["_Icon4"] = Instance.new("ImageLabel");
	["_UIScale3"] = Instance.new("UIScale");
	["_UIStroke2"] = Instance.new("UIStroke");
	["_Glass2"] = Instance.new("UIGradient");
	["_SwitchSCR"] = Instance.new("LocalScript");
	["_AnimationController"] = Instance.new("TextButton");
	["_UICorner6"] = Instance.new("UICorner");
	["_UIPadding4"] = Instance.new("UIPadding");
	["_Icon5"] = Instance.new("ImageLabel");
	["_UIScale4"] = Instance.new("UIScale");
	["_UIStroke3"] = Instance.new("UIStroke");
	["_Glass3"] = Instance.new("UIGradient");
	["_ItemSelect"] = Instance.new("Frame");
	["_UIFlexItem3"] = Instance.new("UIFlexItem");
	["_UIPageLayout"] = Instance.new("UIPageLayout");
	["_Emotes1"] = Instance.new("Frame");
	["_UIListLayout4"] = Instance.new("UIListLayout");
	["_TextLabel2"] = Instance.new("TextLabel");
	["_Listing"] = Instance.new("ScrollingFrame");
	["_UIFlexItem4"] = Instance.new("UIFlexItem");
	["_UIGridLayout"] = Instance.new("UIGridLayout");
	["_UIPadding5"] = Instance.new("UIPadding");
	["_PaginationBar"] = Instance.new("Frame");
	["_UIListLayout5"] = Instance.new("UIListLayout");
	["_SamplePage"] = Instance.new("Frame");
	["_UICorner7"] = Instance.new("UICorner");
	["_Label"] = Instance.new("TextLabel");
	["_UIScale5"] = Instance.new("UIScale");
	["_Next"] = Instance.new("TextButton");
	["_UIScale6"] = Instance.new("UIScale");
	["_UIPadding6"] = Instance.new("UIPadding");
	["_UICorner8"] = Instance.new("UICorner");
	["_UIStroke4"] = Instance.new("UIStroke");
	["_UIPadding7"] = Instance.new("UIPadding");
	["_Previous"] = Instance.new("TextButton");
	["_UIScale7"] = Instance.new("UIScale");
	["_UIPadding8"] = Instance.new("UIPadding");
	["_UICorner9"] = Instance.new("UICorner");
	["_UIStroke5"] = Instance.new("UIStroke");
	["_ActionBar"] = Instance.new("Frame");
	["_Search"] = Instance.new("TextBox");
	["_UICorner10"] = Instance.new("UICorner");
	["_UIPadding9"] = Instance.new("UIPadding");
	["_UISizeConstraint1"] = Instance.new("UISizeConstraint");
	["_Favorites"] = Instance.new("TextButton");
	["_UICorner11"] = Instance.new("UICorner");
	["_UIPadding10"] = Instance.new("UIPadding");
	["_UIStroke6"] = Instance.new("UIStroke");
	["_Label1"] = Instance.new("TextLabel");
	["_UIListLayout6"] = Instance.new("UIListLayout");
	["_Spacer"] = Instance.new("Frame");
	["_UIFlexItem5"] = Instance.new("UIFlexItem");
	["_Spinner"] = Instance.new("Frame");
	["_UIAspectRatioConstraint"] = Instance.new("UIAspectRatioConstraint");
	["_Spinner1"] = Instance.new("ImageLabel");
	["_UIAspectRatioConstraint1"] = Instance.new("UIAspectRatioConstraint");
	["_Spin"] = Instance.new("LocalScript");
	["_TextLabel3"] = Instance.new("TextLabel");
	["_UIPadding11"] = Instance.new("UIPadding");
	["_OldSwitch"] = Instance.new("TextButton");
	["_UICorner12"] = Instance.new("UICorner");
	["_UIPadding12"] = Instance.new("UIPadding");
	["_UIStroke7"] = Instance.new("UIStroke");
	["_UIPageLayout1"] = Instance.new("UIPageLayout");
	["_UGCEmote"] = Instance.new("TextLabel");
	["_RobloxEmotes"] = Instance.new("TextLabel");
	["_SwitchTabs"] = Instance.new("Frame");
	["_UICorner13"] = Instance.new("UICorner");
	["_UIPadding13"] = Instance.new("UIPadding");
	["_UIStroke8"] = Instance.new("UIStroke");
	["_Roblox"] = Instance.new("TextButton");
	["_UICorner14"] = Instance.new("UICorner");
	["_UIPadding14"] = Instance.new("UIPadding");
	["_UIListLayout7"] = Instance.new("UIListLayout");
	["_UGC"] = Instance.new("TextButton");
	["_UICorner15"] = Instance.new("UICorner");
	["_UIPadding15"] = Instance.new("UIPadding");
	["_SearchSuggestion"] = Instance.new("Frame");
	["_UIListLayout8"] = Instance.new("UIListLayout");
	["_UIPadding16"] = Instance.new("UIPadding");
	["_ChipSample"] = Instance.new("Frame");
	["_Clickable"] = Instance.new("TextButton");
	["_UICorner16"] = Instance.new("UICorner");
	["_UIPadding17"] = Instance.new("UIPadding");
	["_UIStroke9"] = Instance.new("UIStroke");
	["_Label2"] = Instance.new("TextLabel");
	["_FavoritesSection"] = Instance.new("Frame");
	["_UIGradient1"] = Instance.new("UIGradient");
	["_UIStroke10"] = Instance.new("UIStroke");
	["_UICorner17"] = Instance.new("UICorner");
	["_UIListLayout9"] = Instance.new("UIListLayout");
	["_TextLabel4"] = Instance.new("TextLabel");
	["_UIPadding18"] = Instance.new("UIPadding");
	["_Listing1"] = Instance.new("ScrollingFrame");
	["_UIFlexItem6"] = Instance.new("UIFlexItem");
	["_UIListLayout10"] = Instance.new("UIListLayout");
	["_UIPadding19"] = Instance.new("UIPadding");
	["_FavoritesSetup"] = Instance.new("LocalScript");
	["_AnimationPacks1"] = Instance.new("Frame");
	["_UIListLayout11"] = Instance.new("UIListLayout");
	["_TextLabel5"] = Instance.new("TextLabel");
	["_Listing2"] = Instance.new("ScrollingFrame");
	["_UIFlexItem7"] = Instance.new("UIFlexItem");
	["_UIGridLayout1"] = Instance.new("UIGridLayout");
	["_UIPadding20"] = Instance.new("UIPadding");
	["_PaginationBar1"] = Instance.new("Frame");
	["_UIListLayout12"] = Instance.new("UIListLayout");
	["_Previous1"] = Instance.new("TextButton");
	["_UIScale8"] = Instance.new("UIScale");
	["_SamplePage1"] = Instance.new("Frame");
	["_UICorner18"] = Instance.new("UICorner");
	["_Label3"] = Instance.new("TextLabel");
	["_UIScale9"] = Instance.new("UIScale");
	["_Next1"] = Instance.new("TextButton");
	["_UIScale10"] = Instance.new("UIScale");
	["_PackEditor"] = Instance.new("Frame");
	["_UIGradient2"] = Instance.new("UIGradient");
	["_UIStroke11"] = Instance.new("UIStroke");
	["_UICorner19"] = Instance.new("UICorner");
	["_UIListLayout13"] = Instance.new("UIListLayout");
	["_TextLabel6"] = Instance.new("TextLabel");
	["_UIPadding21"] = Instance.new("UIPadding");
	["_Listing3"] = Instance.new("ScrollingFrame");
	["_UIFlexItem8"] = Instance.new("UIFlexItem");
	["_UIListLayout14"] = Instance.new("UIListLayout");
	["_UIPadding22"] = Instance.new("UIPadding");
	["_PackEditorScr"] = Instance.new("LocalScript");
	["_PackEditorUpdate"] = Instance.new("BindableEvent");
	["_Settings1"] = Instance.new("Frame");
	["_UIListLayout15"] = Instance.new("UIListLayout");
	["_Listing4"] = Instance.new("ScrollingFrame");
	["_UIFlexItem9"] = Instance.new("UIFlexItem");
	["_UIPadding23"] = Instance.new("UIPadding");
	["_UIListLayout16"] = Instance.new("UIListLayout");
	["_Samples"] = Instance.new("Frame");
	["_TextLabel7"] = Instance.new("TextLabel");
	["_Toggle"] = Instance.new("TextButton");
	["_ToggleTrack"] = Instance.new("Frame");
	["_UICorner20"] = Instance.new("UICorner");
	["_Ball"] = Instance.new("Frame");
	["_UIAspectRatioConstraint2"] = Instance.new("UIAspectRatioConstraint");
	["_UICorner21"] = Instance.new("UICorner");
	["_UIPadding24"] = Instance.new("UIPadding");
	["_UIListLayout17"] = Instance.new("UIListLayout");
	["_Label4"] = Instance.new("TextLabel");
	["_Select"] = Instance.new("Frame");
	["_UIListLayout18"] = Instance.new("UIListLayout");
	["_UIPadding25"] = Instance.new("UIPadding");
	["_UICorner22"] = Instance.new("UICorner");
	["_SelectButton"] = Instance.new("TextButton");
	["_UICorner23"] = Instance.new("UICorner");
	["_UIPadding26"] = Instance.new("UIPadding");
	["_TextLabel8"] = Instance.new("TextLabel");
	["_SettingsSetup"] = Instance.new("LocalScript");
	["_PaginationNSearch"] = Instance.new("LocalScript");
	["_AnimationController1"] = Instance.new("Frame");
	["_DockerSwitch"] = Instance.new("TextButton");
	["_UICorner24"] = Instance.new("UICorner");
	["_UIPadding27"] = Instance.new("UIPadding");
	["_UIStroke12"] = Instance.new("UIStroke");
	["_Docking"] = Instance.new("LocalScript");
	["_Dockable"] = Instance.new("Frame");
	["_UIListLayout19"] = Instance.new("UIListLayout");
	["_AnimContSetup"] = Instance.new("LocalScript");
	["_Samples1"] = Instance.new("Frame");
	["_TextLabel9"] = Instance.new("TextLabel");
	["_Toggle1"] = Instance.new("TextButton");
	["_ToggleTrack1"] = Instance.new("Frame");
	["_UICorner25"] = Instance.new("UICorner");
	["_Ball1"] = Instance.new("Frame");
	["_UIAspectRatioConstraint3"] = Instance.new("UIAspectRatioConstraint");
	["_UICorner26"] = Instance.new("UICorner");
	["_UIPadding28"] = Instance.new("UIPadding");
	["_UIListLayout20"] = Instance.new("UIListLayout");
	["_Label5"] = Instance.new("TextLabel");
	["_Select1"] = Instance.new("Frame");
	["_UIListLayout21"] = Instance.new("UIListLayout");
	["_UIPadding29"] = Instance.new("UIPadding");
	["_UICorner27"] = Instance.new("UICorner");
	["_SelectButton1"] = Instance.new("TextButton");
	["_UICorner28"] = Instance.new("UICorner");
	["_UIPadding30"] = Instance.new("UIPadding");
	["_TextLabel10"] = Instance.new("TextLabel");
	["_SelectTrack"] = Instance.new("Frame");
	["_UIGradient3"] = Instance.new("UIGradient");
	["_UICorner29"] = Instance.new("UICorner");
	["_UIStroke13"] = Instance.new("UIStroke");
	["_UIPadding31"] = Instance.new("UIPadding");
	["_UIListLayout22"] = Instance.new("UIListLayout");
	["_TextLabel11"] = Instance.new("TextLabel");
	["_Listing5"] = Instance.new("ScrollingFrame");
	["_UIListLayout23"] = Instance.new("UIListLayout");
	["_UIPadding32"] = Instance.new("UIPadding");
	["_Sample"] = Instance.new("TextButton");
	["_UICorner30"] = Instance.new("UICorner");
	["_UIPadding33"] = Instance.new("UIPadding");
	["_UIStroke14"] = Instance.new("UIStroke");
	["_UIListLayout24"] = Instance.new("UIListLayout");
	["_TextLabel12"] = Instance.new("TextLabel");
	["_TrackName"] = Instance.new("TextLabel");
	["_UIFlexItem10"] = Instance.new("UIFlexItem");
	["_Listing6"] = Instance.new("ScrollingFrame");
	["_UIFlexItem11"] = Instance.new("UIFlexItem");
	["_UIPadding34"] = Instance.new("UIPadding");
	["_UIListLayout25"] = Instance.new("UIListLayout");
	["_Seekbar"] = Instance.new("TextButton");
	["_Track"] = Instance.new("Frame");
	["_UICorner31"] = Instance.new("UICorner");
	["_Ball2"] = Instance.new("Frame");
	["_UIAspectRatioConstraint4"] = Instance.new("UIAspectRatioConstraint");
	["_UICorner32"] = Instance.new("UICorner");
	["_TimePos"] = Instance.new("TextLabel");
	["_UIPadding35"] = Instance.new("UIPadding");
	["_UIPadding36"] = Instance.new("UIPadding");
	["_Tactical"] = Instance.new("Frame");
	["_UIListLayout26"] = Instance.new("UIListLayout");
	["_Bar1"] = Instance.new("Frame");
	["_UICorner33"] = Instance.new("UICorner");
	["_Bar2"] = Instance.new("Frame");
	["_UICorner34"] = Instance.new("UICorner");
	["_Bar3"] = Instance.new("Frame");
	["_UICorner35"] = Instance.new("UICorner");
	["_Bar4"] = Instance.new("Frame");
	["_UICorner36"] = Instance.new("UICorner");
	["_Bar5"] = Instance.new("Frame");
	["_UICorner37"] = Instance.new("UICorner");
	["_Bar6"] = Instance.new("Frame");
	["_UICorner38"] = Instance.new("UICorner");
	["_Bar7"] = Instance.new("Frame");
	["_UICorner39"] = Instance.new("UICorner");
	["_Bar8"] = Instance.new("Frame");
	["_UICorner40"] = Instance.new("UICorner");
	["_Bar9"] = Instance.new("Frame");
	["_UICorner41"] = Instance.new("UICorner");
	["_Bar10"] = Instance.new("Frame");
	["_UICorner42"] = Instance.new("UICorner");
	["_Bar11"] = Instance.new("Frame");
	["_UICorner43"] = Instance.new("UICorner");
	["_UIListLayout27"] = Instance.new("UIListLayout");
	["_UICorner44"] = Instance.new("UICorner");
	["_UIPadding37"] = Instance.new("UIPadding");
	["_Handle"] = Instance.new("TextButton");
	["_UICorner45"] = Instance.new("UICorner");
	["_ItemListTemplate"] = Instance.new("Frame");
	["_UIPadding38"] = Instance.new("UIPadding");
	["_Clickable1"] = Instance.new("TextButton");
	["_UIPadding39"] = Instance.new("UIPadding");
	["_Details"] = Instance.new("Frame");
	["_Description"] = Instance.new("TextLabel");
	["_UIFlexItem12"] = Instance.new("UIFlexItem");
	["_Buttons"] = Instance.new("Frame");
	["_Loading"] = Instance.new("Frame");
	["_Progress"] = Instance.new("Frame");
	["_UICorner46"] = Instance.new("UICorner");
	["_UICorner47"] = Instance.new("UICorner");
	["_UIFlexItem13"] = Instance.new("UIFlexItem");
	["_Play"] = Instance.new("TextButton");
	["_UIPadding40"] = Instance.new("UIPadding");
	["_UICorner48"] = Instance.new("UICorner");
	["_OffSale"] = Instance.new("TextButton");
	["_UIPadding41"] = Instance.new("UIPadding");
	["_UICorner49"] = Instance.new("UICorner");
	["_UIFlexItem14"] = Instance.new("UIFlexItem");
	["_UIListLayout28"] = Instance.new("UIListLayout");
	["_Title"] = Instance.new("TextLabel");
	["_UIListLayout29"] = Instance.new("UIListLayout");
	["_UIFlexItem15"] = Instance.new("UIFlexItem");
	["_Thumbnail"] = Instance.new("ImageLabel");
	["_UIStroke15"] = Instance.new("UIStroke");
	["_UIAspectRatioConstraint5"] = Instance.new("UIAspectRatioConstraint");
	["_UICorner50"] = Instance.new("UICorner");
	["_UIFlexItem16"] = Instance.new("UIFlexItem");
	["_UIListLayout30"] = Instance.new("UIListLayout");
	["_UIStroke16"] = Instance.new("UIStroke");
	["_CustomEffect"] = Instance.new("UIGradient");
	["_UICorner51"] = Instance.new("UICorner");
	["_OffSaleEffect"] = Instance.new("UIGradient");
	["_UIScale11"] = Instance.new("UIScale");
	["_Tip1"] = Instance.new("TextLabel");
	["_MenuStateChange"] = Instance.new("BindableEvent");
	["_MenuSpringTakeover"] = Instance.new("BindableEvent");
	["_MenuDisplacement"] = Instance.new("LocalScript");
	["_ItemDetail"] = Instance.new("Frame");
	["_UIStroke17"] = Instance.new("UIStroke");
	["_CustomEffect1"] = Instance.new("UIGradient");
	["_UICorner52"] = Instance.new("UICorner");
	["_UIListLayout31"] = Instance.new("UIListLayout");
	["_UIPadding42"] = Instance.new("UIPadding");
	["_Item"] = Instance.new("Frame");
	["_UIFlexItem17"] = Instance.new("UIFlexItem");
	["_AvatarPreview"] = Instance.new("ViewportFrame");
	["_UIStroke18"] = Instance.new("UIStroke");
	["_UICorner53"] = Instance.new("UICorner");
	["_Preview"] = Instance.new("LocalScript");
	["_PlayEmote"] = Instance.new("BindableEvent");
	["_WorldModel"] = Instance.new("WorldModel");
	["_Drag"] = Instance.new("TextButton");
	["_UIFlexItem18"] = Instance.new("UIFlexItem");
	["_UIListLayout32"] = Instance.new("UIListLayout");
	["_Details1"] = Instance.new("Frame");
	["_UIListLayout33"] = Instance.new("UIListLayout");
	["_ItemName"] = Instance.new("TextLabel");
	["_ItemDescription"] = Instance.new("TextLabel");
	["_UIFlexItem19"] = Instance.new("UIFlexItem");
	["_Actions"] = Instance.new("Frame");
	["_UIListLayout34"] = Instance.new("UIListLayout");
	["_Favorites1"] = Instance.new("TextButton");
	["_UICorner54"] = Instance.new("UICorner");
	["_UIPadding43"] = Instance.new("UIPadding");
	["_UIStroke19"] = Instance.new("UIStroke");
	["_Play1"] = Instance.new("TextButton");
	["_UICorner55"] = Instance.new("UICorner");
	["_UIPadding44"] = Instance.new("UIPadding");
	["_UIStroke20"] = Instance.new("UIStroke");
	["_Spacer1"] = Instance.new("Frame");
	["_UIFlexItem20"] = Instance.new("UIFlexItem");
	["_Close"] = Instance.new("TextButton");
	["_UICorner56"] = Instance.new("UICorner");
	["_UIPadding45"] = Instance.new("UIPadding");
	["_UIStroke21"] = Instance.new("UIStroke");
	["_CopyAnimID"] = Instance.new("TextButton");
	["_UICorner57"] = Instance.new("UICorner");
	["_UIPadding46"] = Instance.new("UIPadding");
	["_UIStroke22"] = Instance.new("UIStroke");
	["_FloatingButton"] = Instance.new("TextButton");
	["_UICorner58"] = Instance.new("UICorner");
	["_UIPadding47"] = Instance.new("UIPadding");
	["_UIStroke23"] = Instance.new("UIStroke");
	["_Backdrop"] = Instance.new("Frame");
	["_ShamelessCredit"] = Instance.new("TextLabel");
	["_QuickSelectorIcon"] = Instance.new("BindableEvent");
	["_PointSave"] = Instance.new("ModuleScript");
	["_Modal"] = Instance.new("Frame");
	["_Container"] = Instance.new("CanvasGroup");
	["_UICorner59"] = Instance.new("UICorner");
	["_UIStroke24"] = Instance.new("UIStroke");
	["_UIListLayout35"] = Instance.new("UIListLayout");
	["_Visual"] = Instance.new("Frame");
	["_Desc"] = Instance.new("TextLabel");
	["_UIFlexItem21"] = Instance.new("UIFlexItem");
	["_Title1"] = Instance.new("TextLabel");
	["_UIPadding48"] = Instance.new("UIPadding");
	["_UIListLayout36"] = Instance.new("UIListLayout");
	["_UIFlexItem22"] = Instance.new("UIFlexItem");
	["_Buttons1"] = Instance.new("Frame");
	["_UIListLayout37"] = Instance.new("UIListLayout");
	["_Sample1"] = Instance.new("TextButton");
	["_UICorner60"] = Instance.new("UICorner");
	["_UIPadding49"] = Instance.new("UIPadding");
	["_UIFlexItem23"] = Instance.new("UIFlexItem");
	["_UIPadding50"] = Instance.new("UIPadding");
	["_UIScale12"] = Instance.new("UIScale");
	["_Input"] = Instance.new("Frame");
	["_TextBox"] = Instance.new("TextBox");
	["_UICorner61"] = Instance.new("UICorner");
	["_UIPadding51"] = Instance.new("UIPadding");
	["_UIStroke25"] = Instance.new("UIStroke");
	["_UIPadding52"] = Instance.new("UIPadding");
	["_GrabArea"] = Instance.new("TextButton");
	["_Open1"] = Instance.new("TextButton");
	["_ClickAndHold"] = Instance.new("ModuleScript");
	["_MarketplaceEmotes"] = Instance.new("ModuleScript");
	["_AIEngine"] = Instance.new("ModuleScript");
	["_Notifications"] = Instance.new("Frame");
	["_UIListLayout38"] = Instance.new("UIListLayout");
	["_NotificationContainer"] = Instance.new("Frame");
	["_Frame"] = Instance.new("Frame");
	["_UICorner62"] = Instance.new("UICorner");
	["_UIGradient4"] = Instance.new("UIGradient");
	["_UIStroke26"] = Instance.new("UIStroke");
	["_UIPadding53"] = Instance.new("UIPadding");
	["_UIListLayout39"] = Instance.new("UIListLayout");
	["_Title2"] = Instance.new("TextLabel");
	["_Body"] = Instance.new("TextLabel");
	["_UIPadding54"] = Instance.new("UIPadding");
	["_UIPadding55"] = Instance.new("UIPadding");
	["_ParticleEffects"] = Instance.new("ModuleScript");
	["_FloatingButtons"] = Instance.new("Frame");
	["_Sample2"] = Instance.new("TextButton");
	["_UICorner63"] = Instance.new("UICorner");
	["_UIPadding56"] = Instance.new("UIPadding");
	["_UIStroke27"] = Instance.new("UIStroke");
	["_ImageLabel"] = Instance.new("ImageLabel");
	["_UIPadding57"] = Instance.new("UIPadding");
	["_Update"] = Instance.new("BindableEvent");
	["_UIGridLayout2"] = Instance.new("UIGridLayout");
	["_QuickSelectorFrame"] = Instance.new("CanvasGroup");
	["_UIStroke28"] = Instance.new("UIStroke");
	["_UIPadding58"] = Instance.new("UIPadding");
	["_ScrollingFrame"] = Instance.new("ScrollingFrame");
	["_UIListLayout40"] = Instance.new("UIListLayout");
	["_Sample3"] = Instance.new("Frame");
	["_UIAspectRatioConstraint6"] = Instance.new("UIAspectRatioConstraint");
	["_UICorner64"] = Instance.new("UICorner");
	["_UIStroke29"] = Instance.new("UIStroke");
	["_UIPadding59"] = Instance.new("UIPadding");
	["_Thumbnail1"] = Instance.new("ImageLabel");
	["_UIScale13"] = Instance.new("UIScale");
	["_Tooltip"] = Instance.new("CanvasGroup");
	["_Highlight"] = Instance.new("Frame");
	["_UIStroke30"] = Instance.new("UIStroke");
	["_UICorner65"] = Instance.new("UICorner");
	["_UIPadding60"] = Instance.new("UIPadding");
	["_Text"] = Instance.new("Frame");
	["_UICorner66"] = Instance.new("UICorner");
	["_UIStroke31"] = Instance.new("UIStroke");
	["_TextLabel13"] = Instance.new("TextLabel");
	["_UIPadding61"] = Instance.new("UIPadding");
	["_UIScale14"] = Instance.new("UIScale");
}
-- Properties:
Converted["_AFEMMax"].DisplayOrder = 2
Converted["_AFEMMax"].IgnoreGuiInset = true
Converted["_AFEMMax"].ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
Converted["_AFEMMax"].ResetOnSpawn = false
Converted["_AFEMMax"].ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Converted["_AFEMMax"].Name = "AFEMMax"
Converted["_AFEMMax"].Parent = game:GetService("CoreGui")
Converted["_Menu"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Menu"].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Menu"].BackgroundTransparency = 0.5
Converted["_Menu"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Menu"].BorderSizePixel = 0
Converted["_Menu"].ClipsDescendants = true
Converted["_Menu"].Position = UDim2.new(0.5, 0, 0.5, 0)
Converted["_Menu"].Size = UDim2.new(1, 0, 1, 0)
Converted["_Menu"].Name = "Menu"
Converted["_Menu"].Parent = Converted["_AFEMMax"]
Converted["_UICorner"].CornerRadius = UDim.new(0, 0)
Converted["_UICorner"].Parent = Converted["_Menu"]
Converted["_Branding"].AutomaticSize = Enum.AutomaticSize.X
Converted["_Branding"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Branding"].BackgroundTransparency = 1
Converted["_Branding"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Branding"].Position = UDim2.new(0, 30, 0, 30)
Converted["_Branding"].Size = UDim2.new(0.174346209, 0, 0.08130081, 0)
Converted["_Branding"].Name = "Branding"
Converted["_Branding"].Parent = Converted["_Menu"]
Converted["_Icon"].Image = "rbxassetid://6567073136"
-- Converted["_Icon"].ImageContent = Content
Converted["_Icon"].ScaleType = Enum.ScaleType.Fit
Converted["_Icon"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Icon"].BackgroundTransparency = 1
Converted["_Icon"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Icon"].BorderSizePixel = 0
Converted["_Icon"].Size = UDim2.new(0, 30, 1, 0)
Converted["_Icon"].Name = "Icon"
Converted["_Icon"].Parent = Converted["_Branding"]
Converted["_UIListLayout"].Padding = UDim.new(0, 8)
Converted["_UIListLayout"].FillDirection = Enum.FillDirection.Horizontal
Converted["_UIListLayout"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIListLayout"].Parent = Converted["_Branding"]
Converted["_Naming"].AutomaticSize = Enum.AutomaticSize.X
Converted["_Naming"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Naming"].BackgroundTransparency = 1
Converted["_Naming"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Naming"].BorderSizePixel = 0
Converted["_Naming"].LayoutOrder = 1
Converted["_Naming"].Size = UDim2.new(0, 0, 1, 0)
Converted["_Naming"].Name = "Naming"
Converted["_Naming"].Parent = Converted["_Branding"]
Converted["_PriorityLine"].Font = Enum.Font.GothamBold
Converted["_PriorityLine"].Text = "AFEM"
Converted["_PriorityLine"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_PriorityLine"].TextScaled = true
Converted["_PriorityLine"].TextSize = 64
Converted["_PriorityLine"].TextWrapped = true
Converted["_PriorityLine"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_PriorityLine"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_PriorityLine"].BackgroundTransparency = 1
Converted["_PriorityLine"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_PriorityLine"].BorderSizePixel = 0
Converted["_PriorityLine"].Size = UDim2.new(0, 100, 0, 0)
Converted["_PriorityLine"].Name = "PriorityLine"
Converted["_PriorityLine"].Parent = Converted["_Naming"]
Converted["_UIFlexItem"].FlexMode = Enum.UIFlexMode.Custom
Converted["_UIFlexItem"].GrowRatio = 2
Converted["_UIFlexItem"].Parent = Converted["_PriorityLine"]
Converted["_UIListLayout1"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIListLayout1"].Parent = Converted["_Naming"]
Converted["_Line"].FontFace = Font.new("rbxassetid://12187365364")
Converted["_Line"].Text = "Max"
Converted["_Line"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Line"].TextScaled = true
Converted["_Line"].TextSize = 14
Converted["_Line"].TextWrapped = true
Converted["_Line"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_Line"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Line"].BackgroundTransparency = 1
Converted["_Line"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Line"].BorderSizePixel = 0
Converted["_Line"].Size = UDim2.new(0, 100, 0, 0)
Converted["_Line"].Name = "Line"
Converted["_Line"].Parent = Converted["_Naming"]
Converted["_UIFlexItem1"].FlexMode = Enum.UIFlexMode.Custom
Converted["_UIFlexItem1"].GrowRatio = 1
Converted["_UIFlexItem1"].Parent = Converted["_Line"]
Converted["_UIGradient"].Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(157.0000058412552, 157.0000058412552, 157.0000058412552)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
}
Converted["_UIGradient"].Rotation = 79
Converted["_UIGradient"].Parent = Converted["_Line"]
Converted["_UISizeConstraint"].MaxSize = Vector2.new(math.huge, 40)
Converted["_UISizeConstraint"].Parent = Converted["_Branding"]
Converted["_Bar"].Image = "rbxassetid://17333707046"
-- Converted["_Bar"].ImageContent = Content
Converted["_Bar"].ImageTransparency = 0.699999988079071
Converted["_Bar"].ScaleType = Enum.ScaleType.Slice
Converted["_Bar"].SliceCenter = Rect.new(112, 112, 113, 113)
Converted["_Bar"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Bar"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Bar"].BackgroundTransparency = 1
Converted["_Bar"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Bar"].BorderSizePixel = 0
Converted["_Bar"].Position = UDim2.new(0.5, 0, 0, 40)
Converted["_Bar"].Size = UDim2.new(0, 128, 0, 6)
Converted["_Bar"].Name = "Bar"
Converted["_Bar"].Parent = Converted["_Menu"]
Converted["_Tip"].Font = Enum.Font.Gotham
Converted["_Tip"].Text = "Swipe down or tap to close."
Converted["_Tip"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Tip"].TextScaled = true
Converted["_Tip"].TextSize = 14
Converted["_Tip"].TextWrapped = true
Converted["_Tip"].AnchorPoint = Vector2.new(0.5, 0)
Converted["_Tip"].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Tip"].BackgroundTransparency = 0.699999988079071
Converted["_Tip"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Tip"].BorderSizePixel = 0
Converted["_Tip"].Position = UDim2.new(0.5, 0, 1, 5)
Converted["_Tip"].Size = UDim2.new(1, 80, 0, 40)
Converted["_Tip"].Name = "Tip"
Converted["_Tip"].Parent = Converted["_Bar"]
Converted["_UICorner1"].Parent = Converted["_Tip"]
Converted["_UIPadding"].PaddingBottom = UDim.new(0, 6)
Converted["_UIPadding"].PaddingLeft = UDim.new(0, 12)
Converted["_UIPadding"].PaddingRight = UDim.new(0, 12)
Converted["_UIPadding"].PaddingTop = UDim.new(0, 6)
Converted["_UIPadding"].Parent = Converted["_Tip"]
Converted["_UIScale"].Parent = Converted["_Menu"]
Converted["_CanvasGroup"].GroupTransparency = 1
Converted["_CanvasGroup"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_CanvasGroup"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_CanvasGroup"].BorderSizePixel = 0
Converted["_CanvasGroup"].Interactable = false
Converted["_CanvasGroup"].Size = UDim2.new(1, 0, 1, 0)
Converted["_CanvasGroup"].ZIndex = 99
Converted["_CanvasGroup"].Parent = Converted["_Menu"]
Converted["_UICorner2"].CornerRadius = UDim.new(0, 0)
Converted["_UICorner2"].Parent = Converted["_CanvasGroup"]
Converted["_Icon1"].Image = "rbxassetid://6567073136"
Converted["_Icon1"].ImageColor3 = Color3.fromRGB(0, 0, 0)
-- Converted["_Icon1"].ImageContent = Content
Converted["_Icon1"].ScaleType = Enum.ScaleType.Fit
Converted["_Icon1"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Icon1"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Icon1"].BackgroundTransparency = 1
Converted["_Icon1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Icon1"].BorderSizePixel = 0
Converted["_Icon1"].Position = UDim2.new(0.5, 0, 0.5, 0)
Converted["_Icon1"].Size = UDim2.new(1, -200, 1, -200)
Converted["_Icon1"].Name = "Icon"
Converted["_Icon1"].Parent = Converted["_CanvasGroup"]
Converted["_Open"].Font = Enum.Font.SourceSans
Converted["_Open"].Text = ""
Converted["_Open"].TextColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Open"].TextSize = 14
Converted["_Open"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Open"].BackgroundTransparency = 1
Converted["_Open"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Open"].BorderSizePixel = 0
Converted["_Open"].Size = UDim2.new(1, 0, 1, 0)
Converted["_Open"].Name = "Open"
Converted["_Open"].Parent = Converted["_CanvasGroup"]
Converted["_Area"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Area"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Area"].BackgroundTransparency = 1
Converted["_Area"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Area"].BorderSizePixel = 0
Converted["_Area"].Position = UDim2.new(0.5, 0, 0.550000012, 0)
Converted["_Area"].Size = UDim2.new(1, -70, 1, -100)
Converted["_Area"].Name = "Area"
Converted["_Area"].Parent = Converted["_Menu"]
Converted["_UIListLayout2"].FillDirection = Enum.FillDirection.Horizontal
Converted["_UIListLayout2"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIListLayout2"].Parent = Converted["_Area"]
Converted["_CategorySelect"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_CategorySelect"].BackgroundTransparency = 1
Converted["_CategorySelect"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_CategorySelect"].BorderSizePixel = 0
Converted["_CategorySelect"].Size = UDim2.new(0, 0, 1, 0)
Converted["_CategorySelect"].Name = "CategorySelect"
Converted["_CategorySelect"].Parent = Converted["_Area"]
Converted["_UIFlexItem2"].FlexMode = Enum.UIFlexMode.Custom
Converted["_UIFlexItem2"].GrowRatio = 1.2000000476837158
Converted["_UIFlexItem2"].Parent = Converted["_CategorySelect"]
Converted["_UIListLayout3"].Padding = UDim.new(0, 8)
Converted["_UIListLayout3"].HorizontalAlignment = Enum.HorizontalAlignment.Center
Converted["_UIListLayout3"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIListLayout3"].VerticalAlignment = Enum.VerticalAlignment.Center
Converted["_UIListLayout3"].Parent = Converted["_CategorySelect"]
Converted["_Emotes"].Font = Enum.Font.Gotham
Converted["_Emotes"].Text = ""
Converted["_Emotes"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Emotes"].TextScaled = true
Converted["_Emotes"].TextSize = 14
Converted["_Emotes"].TextWrapped = true
Converted["_Emotes"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Emotes"].BackgroundTransparency = 0.20000000298023224
Converted["_Emotes"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Emotes"].BorderSizePixel = 0
Converted["_Emotes"].Size = UDim2.new(0, 50, 0, 75)
Converted["_Emotes"].Name = "Emotes"
Converted["_Emotes"].Parent = Converted["_CategorySelect"]
Converted["_UICorner3"].CornerRadius = UDim.new(0, 16)
Converted["_UICorner3"].Parent = Converted["_Emotes"]
Converted["_UIPadding1"].PaddingBottom = UDim.new(0, 7)
Converted["_UIPadding1"].PaddingLeft = UDim.new(0, 7)
Converted["_UIPadding1"].PaddingRight = UDim.new(0, 7)
Converted["_UIPadding1"].PaddingTop = UDim.new(0, 7)
Converted["_UIPadding1"].Parent = Converted["_Emotes"]
Converted["_Icon2"].Image = "rbxassetid://6567073136"
Converted["_Icon2"].ImageColor3 = Color3.fromRGB(0, 0, 0)
-- Converted["_Icon2"].ImageContent = Content
Converted["_Icon2"].ScaleType = Enum.ScaleType.Fit
Converted["_Icon2"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Icon2"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Icon2"].BackgroundTransparency = 1
Converted["_Icon2"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Icon2"].BorderSizePixel = 0
Converted["_Icon2"].Position = UDim2.new(0.5, 0, 0.5, 0)
Converted["_Icon2"].Size = UDim2.new(0, 30, 0, 30)
Converted["_Icon2"].Name = "Icon"
Converted["_Icon2"].Parent = Converted["_Emotes"]
Converted["_TextLabel"].Font = Enum.Font.GothamBold
Converted["_TextLabel"].Text = "EM"
Converted["_TextLabel"].TextColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextLabel"].TextScaled = true
Converted["_TextLabel"].TextSize = 14
Converted["_TextLabel"].TextWrapped = true
Converted["_TextLabel"].AnchorPoint = Vector2.new(1, 1)
Converted["_TextLabel"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel"].BackgroundTransparency = 1
Converted["_TextLabel"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextLabel"].BorderSizePixel = 0
Converted["_TextLabel"].Position = UDim2.new(1, 0, 1, 3)
Converted["_TextLabel"].Size = UDim2.new(0, 10, 0, 10)
Converted["_TextLabel"].Parent = Converted["_Emotes"]
Converted["_UIScale1"].Scale = 1.2000000476837158
Converted["_UIScale1"].Parent = Converted["_Emotes"]
Converted["_UIStroke"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Converted["_UIStroke"].Color = Color3.fromRGB(179.000004529953, 179.000004529953, 179.000004529953)
Converted["_UIStroke"].Parent = Converted["_Emotes"]
Converted["_Glass"].Rotation = -22
Converted["_Glass"].Transparency = NumberSequence.new{
	NumberSequenceKeypoint.new(0, 1),
	NumberSequenceKeypoint.new(0.46633419394493103, 0),
	NumberSequenceKeypoint.new(0.9476309418678284, 0.90625),
	NumberSequenceKeypoint.new(1, 1)
}
Converted["_Glass"].Name = "Glass"
Converted["_Glass"].Parent = Converted["_UIStroke"]
Converted["_AnimationPacks"].Font = Enum.Font.Gotham
Converted["_AnimationPacks"].Text = ""
Converted["_AnimationPacks"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_AnimationPacks"].TextScaled = true
Converted["_AnimationPacks"].TextSize = 14
Converted["_AnimationPacks"].TextWrapped = true
Converted["_AnimationPacks"].BackgroundColor3 = Color3.fromRGB(36.00000165402889, 36.00000165402889, 36.00000165402889)
Converted["_AnimationPacks"].BackgroundTransparency = 0.20000000298023224
Converted["_AnimationPacks"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_AnimationPacks"].BorderSizePixel = 0
Converted["_AnimationPacks"].LayoutOrder = 1
Converted["_AnimationPacks"].Size = UDim2.new(0, 50, 0, 50)
Converted["_AnimationPacks"].Name = "AnimationPacks"
Converted["_AnimationPacks"].Parent = Converted["_CategorySelect"]
Converted["_UICorner4"].CornerRadius = UDim.new(0, 32)
Converted["_UICorner4"].Parent = Converted["_AnimationPacks"]
Converted["_UIPadding2"].PaddingBottom = UDim.new(0, 7)
Converted["_UIPadding2"].PaddingLeft = UDim.new(0, 7)
Converted["_UIPadding2"].PaddingRight = UDim.new(0, 7)
Converted["_UIPadding2"].PaddingTop = UDim.new(0, 7)
Converted["_UIPadding2"].Parent = Converted["_AnimationPacks"]
Converted["_Icon3"].Image = "rbxassetid://6567073136"
-- Converted["_Icon3"].ImageContent = Content
Converted["_Icon3"].ScaleType = Enum.ScaleType.Fit
Converted["_Icon3"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Icon3"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Icon3"].BackgroundTransparency = 1
Converted["_Icon3"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Icon3"].BorderSizePixel = 0
Converted["_Icon3"].Position = UDim2.new(0.5, 0, 0.5, 0)
Converted["_Icon3"].Size = UDim2.new(0, 30, 0, 30)
Converted["_Icon3"].Name = "Icon"
Converted["_Icon3"].Parent = Converted["_AnimationPacks"]
Converted["_TextLabel1"].Font = Enum.Font.GothamBold
Converted["_TextLabel1"].Text = "AP"
Converted["_TextLabel1"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel1"].TextScaled = true
Converted["_TextLabel1"].TextSize = 14
Converted["_TextLabel1"].TextWrapped = true
Converted["_TextLabel1"].AnchorPoint = Vector2.new(1, 1)
Converted["_TextLabel1"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel1"].BackgroundTransparency = 1
Converted["_TextLabel1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextLabel1"].BorderSizePixel = 0
Converted["_TextLabel1"].Position = UDim2.new(1, 0, 1, 3)
Converted["_TextLabel1"].Size = UDim2.new(0, 10, 0, 10)
Converted["_TextLabel1"].Parent = Converted["_AnimationPacks"]
Converted["_UIScale2"].Parent = Converted["_AnimationPacks"]
Converted["_UIStroke1"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Converted["_UIStroke1"].Color = Color3.fromRGB(179.000004529953, 179.000004529953, 179.000004529953)
Converted["_UIStroke1"].Parent = Converted["_AnimationPacks"]
Converted["_Glass1"].Rotation = -22
Converted["_Glass1"].Transparency = NumberSequence.new{
	NumberSequenceKeypoint.new(0, 1),
	NumberSequenceKeypoint.new(0.46633419394493103, 0),
	NumberSequenceKeypoint.new(0.9476309418678284, 0.90625),
	NumberSequenceKeypoint.new(1, 1)
}
Converted["_Glass1"].Name = "Glass"
Converted["_Glass1"].Parent = Converted["_UIStroke1"]
Converted["_Settings"].Font = Enum.Font.Gotham
Converted["_Settings"].Text = ""
Converted["_Settings"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Settings"].TextScaled = true
Converted["_Settings"].TextSize = 14
Converted["_Settings"].TextWrapped = true
Converted["_Settings"].BackgroundColor3 = Color3.fromRGB(36.00000165402889, 36.00000165402889, 36.00000165402889)
Converted["_Settings"].BackgroundTransparency = 0.20000000298023224
Converted["_Settings"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Settings"].BorderSizePixel = 0
Converted["_Settings"].LayoutOrder = 3
Converted["_Settings"].Size = UDim2.new(0, 50, 0, 50)
Converted["_Settings"].Name = "Settings"
Converted["_Settings"].Parent = Converted["_CategorySelect"]
Converted["_UICorner5"].CornerRadius = UDim.new(0, 32)
Converted["_UICorner5"].Parent = Converted["_Settings"]
Converted["_UIPadding3"].PaddingBottom = UDim.new(0, 7)
Converted["_UIPadding3"].PaddingLeft = UDim.new(0, 7)
Converted["_UIPadding3"].PaddingRight = UDim.new(0, 7)
Converted["_UIPadding3"].PaddingTop = UDim.new(0, 7)
Converted["_UIPadding3"].Parent = Converted["_Settings"]
Converted["_Icon4"].Image = "rbxassetid://9405931578"
-- Converted["_Icon4"].ImageContent = Content
Converted["_Icon4"].ScaleType = Enum.ScaleType.Fit
Converted["_Icon4"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Icon4"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Icon4"].BackgroundTransparency = 1
Converted["_Icon4"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Icon4"].BorderSizePixel = 0
Converted["_Icon4"].Position = UDim2.new(0.5, 0, 0.5, 0)
Converted["_Icon4"].Size = UDim2.new(0, 30, 0, 30)
Converted["_Icon4"].Name = "Icon"
Converted["_Icon4"].Parent = Converted["_Settings"]
Converted["_UIScale3"].Parent = Converted["_Settings"]
Converted["_UIStroke2"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Converted["_UIStroke2"].Color = Color3.fromRGB(179.000004529953, 179.000004529953, 179.000004529953)
Converted["_UIStroke2"].Parent = Converted["_Settings"]
Converted["_Glass2"].Rotation = -22
Converted["_Glass2"].Transparency = NumberSequence.new{
	NumberSequenceKeypoint.new(0, 1),
	NumberSequenceKeypoint.new(0.46633419394493103, 0),
	NumberSequenceKeypoint.new(0.9476309418678284, 0.90625),
	NumberSequenceKeypoint.new(1, 1)
}
Converted["_Glass2"].Name = "Glass"
Converted["_Glass2"].Parent = Converted["_UIStroke2"]
Converted["_AnimationController"].Font = Enum.Font.Gotham
Converted["_AnimationController"].Text = ""
Converted["_AnimationController"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_AnimationController"].TextScaled = true
Converted["_AnimationController"].TextSize = 14
Converted["_AnimationController"].TextWrapped = true
Converted["_AnimationController"].BackgroundColor3 = Color3.fromRGB(36.00000165402889, 36.00000165402889, 36.00000165402889)
Converted["_AnimationController"].BackgroundTransparency = 0.20000000298023224
Converted["_AnimationController"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_AnimationController"].BorderSizePixel = 0
Converted["_AnimationController"].LayoutOrder = 2
Converted["_AnimationController"].Size = UDim2.new(0, 50, 0, 50)
Converted["_AnimationController"].Name = "AnimationController"
Converted["_AnimationController"].Parent = Converted["_CategorySelect"]
Converted["_UICorner6"].CornerRadius = UDim.new(0, 32)
Converted["_UICorner6"].Parent = Converted["_AnimationController"]
Converted["_UIPadding4"].PaddingBottom = UDim.new(0, 7)
Converted["_UIPadding4"].PaddingLeft = UDim.new(0, 7)
Converted["_UIPadding4"].PaddingRight = UDim.new(0, 7)
Converted["_UIPadding4"].PaddingTop = UDim.new(0, 7)
Converted["_UIPadding4"].Parent = Converted["_AnimationController"]
Converted["_Icon5"].Image = "rbxassetid://102776659673039"
-- Converted["_Icon5"].ImageContent = Content
Converted["_Icon5"].ScaleType = Enum.ScaleType.Fit
Converted["_Icon5"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Icon5"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Icon5"].BackgroundTransparency = 1
Converted["_Icon5"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Icon5"].BorderSizePixel = 0
Converted["_Icon5"].Position = UDim2.new(0.5, 0, 0.5, 0)
Converted["_Icon5"].Size = UDim2.new(0, 30, 0, 30)
Converted["_Icon5"].Name = "Icon"
Converted["_Icon5"].Parent = Converted["_AnimationController"]
Converted["_UIScale4"].Parent = Converted["_AnimationController"]
Converted["_UIStroke3"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Converted["_UIStroke3"].Color = Color3.fromRGB(179.000004529953, 179.000004529953, 179.000004529953)
Converted["_UIStroke3"].Parent = Converted["_AnimationController"]
Converted["_Glass3"].Rotation = -22
Converted["_Glass3"].Transparency = NumberSequence.new{
	NumberSequenceKeypoint.new(0, 1),
	NumberSequenceKeypoint.new(0.46633419394493103, 0),
	NumberSequenceKeypoint.new(0.9476309418678284, 0.90625),
	NumberSequenceKeypoint.new(1, 1)
}
Converted["_Glass3"].Name = "Glass"
Converted["_Glass3"].Parent = Converted["_UIStroke3"]
Converted["_ItemSelect"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_ItemSelect"].BackgroundTransparency = 1
Converted["_ItemSelect"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_ItemSelect"].BorderSizePixel = 0
Converted["_ItemSelect"].ClipsDescendants = true
Converted["_ItemSelect"].Size = UDim2.new(0, 0, 1, 0)
Converted["_ItemSelect"].Name = "ItemSelect"
Converted["_ItemSelect"].Parent = Converted["_Area"]
Converted["_UIFlexItem3"].FlexMode = Enum.UIFlexMode.Custom
Converted["_UIFlexItem3"].GrowRatio = 10
Converted["_UIFlexItem3"].Parent = Converted["_ItemSelect"]
Converted["_UIPageLayout"].EasingStyle = Enum.EasingStyle.Exponential
Converted["_UIPageLayout"].GamepadInputEnabled = false
Converted["_UIPageLayout"].Padding = UDim.new(0, 20)
Converted["_UIPageLayout"].ScrollWheelInputEnabled = false
Converted["_UIPageLayout"].TouchInputEnabled = false
Converted["_UIPageLayout"].TweenTime = 0.6000000238418579
Converted["_UIPageLayout"].FillDirection = Enum.FillDirection.Vertical
Converted["_UIPageLayout"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIPageLayout"].Parent = Converted["_ItemSelect"]
Converted["_Emotes1"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Emotes1"].BackgroundTransparency = 1
Converted["_Emotes1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Emotes1"].BorderSizePixel = 0
Converted["_Emotes1"].Size = UDim2.new(1, 0, 1, 0)
Converted["_Emotes1"].Name = "Emotes"
Converted["_Emotes1"].Parent = Converted["_ItemSelect"]
Converted["_UIListLayout4"].Padding = UDim.new(0, 8)
Converted["_UIListLayout4"].HorizontalAlignment = Enum.HorizontalAlignment.Center
Converted["_UIListLayout4"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIListLayout4"].Parent = Converted["_Emotes1"]
Converted["_TextLabel2"].Font = Enum.Font.GothamBold
Converted["_TextLabel2"].Text = "Emotes"
Converted["_TextLabel2"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel2"].TextScaled = true
Converted["_TextLabel2"].TextSize = 14
Converted["_TextLabel2"].TextWrapped = true
Converted["_TextLabel2"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_TextLabel2"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel2"].BackgroundTransparency = 1
Converted["_TextLabel2"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextLabel2"].BorderSizePixel = 0
Converted["_TextLabel2"].LayoutOrder = -10
Converted["_TextLabel2"].Size = UDim2.new(1, 0, 0, 20)
Converted["_TextLabel2"].Parent = Converted["_Emotes1"]
Converted["_Listing"].AutomaticCanvasSize = Enum.AutomaticSize.Y
Converted["_Listing"].CanvasSize = UDim2.new(0, 0, 0, 0)
Converted["_Listing"].ScrollBarThickness = 2
Converted["_Listing"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Listing"].BackgroundTransparency = 1
Converted["_Listing"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Listing"].BorderSizePixel = 0
Converted["_Listing"].Selectable = false
Converted["_Listing"].Size = UDim2.new(1, 0, 0, 0)
Converted["_Listing"].Name = "Listing"
Converted["_Listing"].Parent = Converted["_Emotes1"]
Converted["_UIFlexItem4"].FlexMode = Enum.UIFlexMode.Grow
Converted["_UIFlexItem4"].Parent = Converted["_Listing"]
Converted["_UIGridLayout"].CellPadding = UDim2.new(0, 10, 0, 10)
Converted["_UIGridLayout"].CellSize = UDim2.new(0.400000006, -3, 0, 100)
Converted["_UIGridLayout"].HorizontalAlignment = Enum.HorizontalAlignment.Center
Converted["_UIGridLayout"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIGridLayout"].Parent = Converted["_Listing"]
Converted["_UIPadding5"].PaddingBottom = UDim.new(0, 16)
Converted["_UIPadding5"].PaddingTop = UDim.new(0, 8)
Converted["_UIPadding5"].Parent = Converted["_Listing"]
Converted["_PaginationBar"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_PaginationBar"].BackgroundTransparency = 1
Converted["_PaginationBar"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_PaginationBar"].BorderSizePixel = 0
Converted["_PaginationBar"].Size = UDim2.new(1, 0, 0, 25)
Converted["_PaginationBar"].Name = "PaginationBar"
Converted["_PaginationBar"].Parent = Converted["_Emotes1"]
Converted["_UIListLayout5"].Padding = UDim.new(0, 8)
Converted["_UIListLayout5"].FillDirection = Enum.FillDirection.Horizontal
Converted["_UIListLayout5"].HorizontalAlignment = Enum.HorizontalAlignment.Center
Converted["_UIListLayout5"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIListLayout5"].VerticalAlignment = Enum.VerticalAlignment.Center
Converted["_UIListLayout5"].Parent = Converted["_PaginationBar"]
Converted["_SamplePage"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_SamplePage"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_SamplePage"].BorderSizePixel = 0
Converted["_SamplePage"].LayoutOrder = 1
Converted["_SamplePage"].Size = UDim2.new(0, 25, 0, 25)
Converted["_SamplePage"].Visible = false
Converted["_SamplePage"].Name = "SamplePage"
Converted["_SamplePage"].Parent = Converted["_PaginationBar"]
Converted["_UICorner7"].CornerRadius = UDim.new(1, 0)
Converted["_UICorner7"].Parent = Converted["_SamplePage"]
Converted["_Label"].Font = Enum.Font.GothamBold
Converted["_Label"].Text = "1"
Converted["_Label"].TextColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Label"].TextScaled = true
Converted["_Label"].TextSize = 14
Converted["_Label"].TextTransparency = 1
Converted["_Label"].TextWrapped = true
Converted["_Label"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Label"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Label"].BackgroundTransparency = 1
Converted["_Label"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Label"].BorderSizePixel = 0
Converted["_Label"].Position = UDim2.new(0.5, 0, 0.5, 0)
Converted["_Label"].Size = UDim2.new(1, -5, 1, -5)
Converted["_Label"].Name = "Label"
Converted["_Label"].Parent = Converted["_SamplePage"]
Converted["_UIScale5"].Scale = 0.30000001192092896
Converted["_UIScale5"].Parent = Converted["_SamplePage"]
Converted["_Next"].Font = Enum.Font.GothamBold
Converted["_Next"].Text = "Next"
Converted["_Next"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Next"].TextScaled = true
Converted["_Next"].TextSize = 14
Converted["_Next"].TextWrapped = true
Converted["_Next"].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Next"].BackgroundTransparency = 0.75
Converted["_Next"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Next"].BorderSizePixel = 0
Converted["_Next"].LayoutOrder = 999
Converted["_Next"].Size = UDim2.new(0, 40, 0, 25)
Converted["_Next"].Name = "Next"
Converted["_Next"].Parent = Converted["_PaginationBar"]
Converted["_UIScale6"].Parent = Converted["_Next"]
Converted["_UIPadding6"].PaddingLeft = UDim.new(0, 4)
Converted["_UIPadding6"].PaddingRight = UDim.new(0, 4)
Converted["_UIPadding6"].Parent = Converted["_Next"]
Converted["_UICorner8"].Parent = Converted["_Next"]
Converted["_UIStroke4"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Converted["_UIStroke4"].Color = Color3.fromRGB(179.000004529953, 179.000004529953, 179.000004529953)
Converted["_UIStroke4"].Parent = Converted["_Next"]
Converted["_UIPadding7"].PaddingBottom = UDim.new(0, 2)
Converted["_UIPadding7"].Parent = Converted["_PaginationBar"]
Converted["_Previous"].Font = Enum.Font.GothamBold
Converted["_Previous"].Text = "Previous"
Converted["_Previous"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Previous"].TextScaled = true
Converted["_Previous"].TextSize = 14
Converted["_Previous"].TextWrapped = true
Converted["_Previous"].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Previous"].BackgroundTransparency = 0.75
Converted["_Previous"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Previous"].BorderSizePixel = 0
Converted["_Previous"].LayoutOrder = -999
Converted["_Previous"].Size = UDim2.new(0, 60, 0, 25)
Converted["_Previous"].Name = "Previous"
Converted["_Previous"].Parent = Converted["_PaginationBar"]
Converted["_UIScale7"].Scale = 1.0000000116860974e-07
Converted["_UIScale7"].Parent = Converted["_Previous"]
Converted["_UIPadding8"].PaddingLeft = UDim.new(0, 4)
Converted["_UIPadding8"].PaddingRight = UDim.new(0, 4)
Converted["_UIPadding8"].Parent = Converted["_Previous"]
Converted["_UICorner9"].Parent = Converted["_Previous"]
Converted["_UIStroke5"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Converted["_UIStroke5"].Color = Color3.fromRGB(179.000004529953, 179.000004529953, 179.000004529953)
Converted["_UIStroke5"].Parent = Converted["_Previous"]
Converted["_ActionBar"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_ActionBar"].BackgroundTransparency = 1
Converted["_ActionBar"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_ActionBar"].BorderSizePixel = 0
Converted["_ActionBar"].LayoutOrder = -3
Converted["_ActionBar"].Size = UDim2.new(1, 0, 0, 25)
Converted["_ActionBar"].Name = "ActionBar"
Converted["_ActionBar"].Parent = Converted["_Emotes1"]
Converted["_Search"].Font = Enum.Font.Gotham
Converted["_Search"].PlaceholderText = "Search"
Converted["_Search"].Text = ""
Converted["_Search"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Search"].TextScaled = true
Converted["_Search"].TextSize = 14
Converted["_Search"].TextWrapped = true
Converted["_Search"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_Search"].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Search"].BackgroundTransparency = 0.550000011920929
Converted["_Search"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Search"].BorderSizePixel = 0
Converted["_Search"].Size = UDim2.new(1, 0, 1, 0)
Converted["_Search"].Name = "Search"
Converted["_Search"].Parent = Converted["_ActionBar"]
Converted["_UICorner10"].CornerRadius = UDim.new(0, 16)
Converted["_UICorner10"].Parent = Converted["_Search"]
Converted["_UIPadding9"].PaddingBottom = UDim.new(0, 7)
Converted["_UIPadding9"].PaddingLeft = UDim.new(0, 7)
Converted["_UIPadding9"].PaddingRight = UDim.new(0, 7)
Converted["_UIPadding9"].PaddingTop = UDim.new(0, 7)
Converted["_UIPadding9"].Parent = Converted["_Search"]
Converted["_UISizeConstraint1"].MaxSize = Vector2.new(200, math.huge)
Converted["_UISizeConstraint1"].Parent = Converted["_Search"]
Converted["_Favorites"].Font = Enum.Font.Gotham
Converted["_Favorites"].Text = ""
Converted["_Favorites"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Favorites"].TextScaled = true
Converted["_Favorites"].TextSize = 14
Converted["_Favorites"].TextWrapped = true
Converted["_Favorites"].AnchorPoint = Vector2.new(1, 0)
Converted["_Favorites"].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Favorites"].BackgroundTransparency = 0.550000011920929
Converted["_Favorites"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Favorites"].BorderSizePixel = 0
Converted["_Favorites"].ClipsDescendants = true
Converted["_Favorites"].LayoutOrder = 10
Converted["_Favorites"].Position = UDim2.new(1, -2, 0, 0)
Converted["_Favorites"].Size = UDim2.new(0, 75, 1, 0)
Converted["_Favorites"].Name = "Favorites"
Converted["_Favorites"].Parent = Converted["_ActionBar"]
Converted["_UICorner11"].CornerRadius = UDim.new(0, 16)
Converted["_UICorner11"].Parent = Converted["_Favorites"]
Converted["_UIPadding10"].PaddingBottom = UDim.new(0, 7)
Converted["_UIPadding10"].PaddingLeft = UDim.new(0, 7)
Converted["_UIPadding10"].PaddingRight = UDim.new(0, 7)
Converted["_UIPadding10"].PaddingTop = UDim.new(0, 7)
Converted["_UIPadding10"].Parent = Converted["_Favorites"]
Converted["_UIStroke6"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Converted["_UIStroke6"].Color = Color3.fromRGB(164.00000542402267, 179.000004529953, 0)
Converted["_UIStroke6"].Parent = Converted["_Favorites"]
Converted["_Label1"].Font = Enum.Font.Gotham
Converted["_Label1"].Text = "Favorites"
Converted["_Label1"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Label1"].TextScaled = true
Converted["_Label1"].TextSize = 14
Converted["_Label1"].TextWrapped = true
Converted["_Label1"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Label1"].BackgroundTransparency = 1
Converted["_Label1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Label1"].BorderSizePixel = 0
Converted["_Label1"].LayoutOrder = 1
Converted["_Label1"].Size = UDim2.new(1, 0, 1, 0)
Converted["_Label1"].Name = "Label"
Converted["_Label1"].Parent = Converted["_Favorites"]
Converted["_UIListLayout6"].Padding = UDim.new(0, 8)
Converted["_UIListLayout6"].FillDirection = Enum.FillDirection.Horizontal
Converted["_UIListLayout6"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIListLayout6"].Parent = Converted["_ActionBar"]
Converted["_Spacer"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Spacer"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Spacer"].BorderSizePixel = 0
Converted["_Spacer"].LayoutOrder = 9
Converted["_Spacer"].Name = "Spacer"
Converted["_Spacer"].Parent = Converted["_ActionBar"]
Converted["_UIFlexItem5"].FlexMode = Enum.UIFlexMode.Grow
Converted["_UIFlexItem5"].Parent = Converted["_Spacer"]
Converted["_Spinner"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Spinner"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Spinner"].BackgroundTransparency = 1
Converted["_Spinner"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Spinner"].BorderSizePixel = 0
Converted["_Spinner"].Position = UDim2.new(0.5, 0, 0.5, 0)
Converted["_Spinner"].Rotation = -180
Converted["_Spinner"].Size = UDim2.new(0, 0, 1, 0)
Converted["_Spinner"].Visible = false
Converted["_Spinner"].Name = "Spinner"
Converted["_Spinner"].Parent = Converted["_ActionBar"]
Converted["_UIAspectRatioConstraint"].AspectType = Enum.AspectType.ScaleWithParentSize
Converted["_UIAspectRatioConstraint"].DominantAxis = Enum.DominantAxis.Height
Converted["_UIAspectRatioConstraint"].Parent = Converted["_Spinner"]
Converted["_Spinner1"].Image = "rbxassetid://17119858971"
-- Converted["_Spinner1"].ImageContent = Content
Converted["_Spinner1"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Spinner1"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Spinner1"].BackgroundTransparency = 1
Converted["_Spinner1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Spinner1"].BorderSizePixel = 0
Converted["_Spinner1"].Position = UDim2.new(0.5, 0, 0.5, 0)
Converted["_Spinner1"].Rotation = -180
Converted["_Spinner1"].Size = UDim2.new(0, 0, 1, 0)
Converted["_Spinner1"].Name = "Spinner"
Converted["_Spinner1"].Parent = Converted["_Spinner"]
Converted["_UIAspectRatioConstraint1"].AspectType = Enum.AspectType.ScaleWithParentSize
Converted["_UIAspectRatioConstraint1"].DominantAxis = Enum.DominantAxis.Height
Converted["_UIAspectRatioConstraint1"].Parent = Converted["_Spinner1"]
Converted["_TextLabel3"].Font = Enum.Font.Gotham
Converted["_TextLabel3"].Text = ""
Converted["_TextLabel3"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel3"].TextScaled = true
Converted["_TextLabel3"].TextSize = 14
Converted["_TextLabel3"].TextTransparency = 0.8500000238418579
Converted["_TextLabel3"].TextWrapped = true
Converted["_TextLabel3"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel3"].BackgroundTransparency = 1
Converted["_TextLabel3"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextLabel3"].BorderSizePixel = 0
Converted["_TextLabel3"].LayoutOrder = 1
Converted["_TextLabel3"].Size = UDim2.new(0, 15, 1, 0)
Converted["_TextLabel3"].Parent = Converted["_ActionBar"]
Converted["_UIPadding11"].PaddingRight = UDim.new(0, 2)
Converted["_UIPadding11"].Parent = Converted["_ActionBar"]
Converted["_OldSwitch"].Font = Enum.Font.Gotham
Converted["_OldSwitch"].Text = ""
Converted["_OldSwitch"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_OldSwitch"].TextScaled = true
Converted["_OldSwitch"].TextSize = 14
Converted["_OldSwitch"].TextWrapped = true
Converted["_OldSwitch"].AnchorPoint = Vector2.new(1, 0)
Converted["_OldSwitch"].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Converted["_OldSwitch"].BackgroundTransparency = 0.550000011920929
Converted["_OldSwitch"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_OldSwitch"].BorderSizePixel = 0
Converted["_OldSwitch"].ClipsDescendants = true
Converted["_OldSwitch"].LayoutOrder = 10
Converted["_OldSwitch"].Position = UDim2.new(1, -2, 0, 0)
Converted["_OldSwitch"].Size = UDim2.new(0, 100, 1, 0)
Converted["_OldSwitch"].Visible = false
Converted["_OldSwitch"].Name = "OldSwitch"
Converted["_OldSwitch"].Parent = Converted["_ActionBar"]
Converted["_UICorner12"].CornerRadius = UDim.new(0, 16)
Converted["_UICorner12"].Parent = Converted["_OldSwitch"]
Converted["_UIPadding12"].PaddingBottom = UDim.new(0, 7)
Converted["_UIPadding12"].PaddingLeft = UDim.new(0, 7)
Converted["_UIPadding12"].PaddingRight = UDim.new(0, 7)
Converted["_UIPadding12"].PaddingTop = UDim.new(0, 7)
Converted["_UIPadding12"].Parent = Converted["_OldSwitch"]
Converted["_UIStroke7"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Converted["_UIStroke7"].Color = Color3.fromRGB(179.000004529953, 179.000004529953, 179.000004529953)
Converted["_UIStroke7"].Parent = Converted["_OldSwitch"]
Converted["_UIPageLayout1"].EasingStyle = Enum.EasingStyle.Quart
Converted["_UIPageLayout1"].GamepadInputEnabled = false
Converted["_UIPageLayout1"].Padding = UDim.new(0, 8)
Converted["_UIPageLayout1"].ScrollWheelInputEnabled = false
Converted["_UIPageLayout1"].TouchInputEnabled = false
Converted["_UIPageLayout1"].TweenTime = 0.5
Converted["_UIPageLayout1"].FillDirection = Enum.FillDirection.Vertical
Converted["_UIPageLayout1"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIPageLayout1"].Parent = Converted["_OldSwitch"]
Converted["_UGCEmote"].Font = Enum.Font.Gotham
Converted["_UGCEmote"].Text = "UGC Emotes"
Converted["_UGCEmote"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_UGCEmote"].TextScaled = true
Converted["_UGCEmote"].TextSize = 14
Converted["_UGCEmote"].TextWrapped = true
Converted["_UGCEmote"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_UGCEmote"].BackgroundTransparency = 1
Converted["_UGCEmote"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_UGCEmote"].BorderSizePixel = 0
Converted["_UGCEmote"].LayoutOrder = 1
Converted["_UGCEmote"].Size = UDim2.new(1, 0, 1, 0)
Converted["_UGCEmote"].Name = "UGCEmote"
Converted["_UGCEmote"].Parent = Converted["_OldSwitch"]
Converted["_RobloxEmotes"].Font = Enum.Font.Gotham
Converted["_RobloxEmotes"].Text = "Roblox Emotes"
Converted["_RobloxEmotes"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_RobloxEmotes"].TextScaled = true
Converted["_RobloxEmotes"].TextSize = 14
Converted["_RobloxEmotes"].TextWrapped = true
Converted["_RobloxEmotes"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_RobloxEmotes"].BackgroundTransparency = 1
Converted["_RobloxEmotes"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_RobloxEmotes"].BorderSizePixel = 0
Converted["_RobloxEmotes"].Size = UDim2.new(1, 0, 1, 0)
Converted["_RobloxEmotes"].Name = "RobloxEmotes"
Converted["_RobloxEmotes"].Parent = Converted["_OldSwitch"]
Converted["_SwitchTabs"].AutomaticSize = Enum.AutomaticSize.X
Converted["_SwitchTabs"].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Converted["_SwitchTabs"].BackgroundTransparency = 0.75
Converted["_SwitchTabs"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_SwitchTabs"].BorderSizePixel = 0
Converted["_SwitchTabs"].LayoutOrder = 10
Converted["_SwitchTabs"].Size = UDim2.new(0, 100, 1, 0)
Converted["_SwitchTabs"].Name = "SwitchTabs"
Converted["_SwitchTabs"].Parent = Converted["_ActionBar"]
Converted["_UICorner13"].CornerRadius = UDim.new(0, 16)
Converted["_UICorner13"].Parent = Converted["_SwitchTabs"]
Converted["_UIPadding13"].PaddingBottom = UDim.new(0, 2)
Converted["_UIPadding13"].PaddingLeft = UDim.new(0, 2)
Converted["_UIPadding13"].PaddingRight = UDim.new(0, 2)
Converted["_UIPadding13"].PaddingTop = UDim.new(0, 2)
Converted["_UIPadding13"].Parent = Converted["_SwitchTabs"]
Converted["_UIStroke8"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Converted["_UIStroke8"].Color = Color3.fromRGB(179.000004529953, 179.000004529953, 179.000004529953)
Converted["_UIStroke8"].Parent = Converted["_SwitchTabs"]
Converted["_Roblox"].Font = Enum.Font.Gotham
Converted["_Roblox"].Text = "Roblox"
Converted["_Roblox"].TextColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Roblox"].TextScaled = true
Converted["_Roblox"].TextSize = 14
Converted["_Roblox"].TextWrapped = true
Converted["_Roblox"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Roblox"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Roblox"].BorderSizePixel = 0
Converted["_Roblox"].Size = UDim2.new(0, 75, 1, 0)
Converted["_Roblox"].Name = "Roblox"
Converted["_Roblox"].Parent = Converted["_SwitchTabs"]
Converted["_UICorner14"].CornerRadius = UDim.new(0, 16)
Converted["_UICorner14"].Parent = Converted["_Roblox"]
Converted["_UIPadding14"].PaddingBottom = UDim.new(0, 3)
Converted["_UIPadding14"].PaddingTop = UDim.new(0, 3)
Converted["_UIPadding14"].Parent = Converted["_Roblox"]
Converted["_UIListLayout7"].Padding = UDim.new(0, 2)
Converted["_UIListLayout7"].FillDirection = Enum.FillDirection.Horizontal
Converted["_UIListLayout7"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIListLayout7"].Parent = Converted["_SwitchTabs"]
Converted["_UGC"].Font = Enum.Font.Gotham
Converted["_UGC"].Text = "UGC"
Converted["_UGC"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_UGC"].TextScaled = true
Converted["_UGC"].TextSize = 14
Converted["_UGC"].TextWrapped = true
Converted["_UGC"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_UGC"].BackgroundTransparency = 1
Converted["_UGC"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_UGC"].BorderSizePixel = 0
Converted["_UGC"].Size = UDim2.new(0, 50, 1, 0)
Converted["_UGC"].Name = "UGC"
Converted["_UGC"].Parent = Converted["_SwitchTabs"]
Converted["_UICorner15"].CornerRadius = UDim.new(0, 16)
Converted["_UICorner15"].Parent = Converted["_UGC"]
Converted["_UIPadding15"].PaddingBottom = UDim.new(0, 3)
Converted["_UIPadding15"].PaddingTop = UDim.new(0, 3)
Converted["_UIPadding15"].Parent = Converted["_UGC"]
Converted["_SearchSuggestion"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_SearchSuggestion"].BackgroundTransparency = 1
Converted["_SearchSuggestion"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_SearchSuggestion"].BorderSizePixel = 0
Converted["_SearchSuggestion"].ClipsDescendants = true
Converted["_SearchSuggestion"].LayoutOrder = -2
Converted["_SearchSuggestion"].Size = UDim2.new(1, 0, 0, 0)
Converted["_SearchSuggestion"].Name = "SearchSuggestion"
Converted["_SearchSuggestion"].Parent = Converted["_Emotes1"]
Converted["_UIListLayout8"].Padding = UDim.new(0, 8)
Converted["_UIListLayout8"].FillDirection = Enum.FillDirection.Horizontal
Converted["_UIListLayout8"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIListLayout8"].Parent = Converted["_SearchSuggestion"]
Converted["_UIPadding16"].PaddingBottom = UDim.new(0, 4)
Converted["_UIPadding16"].PaddingLeft = UDim.new(0, 3)
Converted["_UIPadding16"].PaddingRight = UDim.new(0, 3)
Converted["_UIPadding16"].PaddingTop = UDim.new(0, 1)
Converted["_UIPadding16"].Parent = Converted["_SearchSuggestion"]
Converted["_ChipSample"].AutomaticSize = Enum.AutomaticSize.X
Converted["_ChipSample"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_ChipSample"].BackgroundTransparency = 1
Converted["_ChipSample"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_ChipSample"].BorderSizePixel = 0
Converted["_ChipSample"].Size = UDim2.new(0, 0, 0, 25)
Converted["_ChipSample"].Visible = false
Converted["_ChipSample"].Name = "ChipSample"
Converted["_ChipSample"].Parent = Converted["_SearchSuggestion"]
Converted["_Clickable"].Font = Enum.Font.Gotham
Converted["_Clickable"].Text = ""
Converted["_Clickable"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Clickable"].TextScaled = true
Converted["_Clickable"].TextSize = 14
Converted["_Clickable"].TextWrapped = true
Converted["_Clickable"].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Clickable"].BackgroundTransparency = 0.550000011920929
Converted["_Clickable"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Clickable"].BorderSizePixel = 0
Converted["_Clickable"].ClipsDescendants = true
Converted["_Clickable"].LayoutOrder = 10
Converted["_Clickable"].Position = UDim2.new(0, 0, 0, 25)
Converted["_Clickable"].Size = UDim2.new(1, 0, 1, 0)
Converted["_Clickable"].Name = "Clickable"
Converted["_Clickable"].Parent = Converted["_ChipSample"]
Converted["_UICorner16"].CornerRadius = UDim.new(0, 16)
Converted["_UICorner16"].Parent = Converted["_Clickable"]
Converted["_UIPadding17"].PaddingBottom = UDim.new(0, 7)
Converted["_UIPadding17"].PaddingLeft = UDim.new(0, 9)
Converted["_UIPadding17"].PaddingRight = UDim.new(0, 9)
Converted["_UIPadding17"].PaddingTop = UDim.new(0, 7)
Converted["_UIPadding17"].Parent = Converted["_Clickable"]
Converted["_UIStroke9"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Converted["_UIStroke9"].Color = Color3.fromRGB(179.000004529953, 179.000004529953, 179.000004529953)
Converted["_UIStroke9"].Parent = Converted["_Clickable"]
Converted["_Label2"].Font = Enum.Font.Gotham
Converted["_Label2"].Text = "suggestion"
Converted["_Label2"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Label2"].TextScaled = true
Converted["_Label2"].TextSize = 14
Converted["_Label2"].TextWrapped = true
Converted["_Label2"].AutomaticSize = Enum.AutomaticSize.X
Converted["_Label2"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Label2"].BackgroundTransparency = 1
Converted["_Label2"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Label2"].BorderSizePixel = 0
Converted["_Label2"].LayoutOrder = 1
Converted["_Label2"].Size = UDim2.new(0, 0, 1, 0)
Converted["_Label2"].Name = "Label"
Converted["_Label2"].Parent = Converted["_Clickable"]
Converted["_FavoritesSection"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_FavoritesSection"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_FavoritesSection"].BorderSizePixel = 0
Converted["_FavoritesSection"].ClipsDescendants = true
Converted["_FavoritesSection"].LayoutOrder = -1
Converted["_FavoritesSection"].Size = UDim2.new(1, -4, 0, 0)
Converted["_FavoritesSection"].Name = "FavoritesSection"
Converted["_FavoritesSection"].Parent = Converted["_Emotes1"]
Converted["_UIGradient1"].Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 200.00000327825546, 0)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 200.00000327825546, 0))
}
Converted["_UIGradient1"].Rotation = -90
Converted["_UIGradient1"].Transparency = NumberSequence.new{
	NumberSequenceKeypoint.new(0, 0.7562500238418579),
	NumberSequenceKeypoint.new(1, 1)
}
Converted["_UIGradient1"].Parent = Converted["_FavoritesSection"]
Converted["_UIStroke10"].Color = Color3.fromRGB(255, 200.00001847743988, 0)
Converted["_UIStroke10"].Thickness = 0
Converted["_UIStroke10"].Parent = Converted["_FavoritesSection"]
Converted["_UICorner17"].CornerRadius = UDim.new(0, 16)
Converted["_UICorner17"].Parent = Converted["_FavoritesSection"]
Converted["_UIListLayout9"].Padding = UDim.new(0, 4)
Converted["_UIListLayout9"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIListLayout9"].Parent = Converted["_FavoritesSection"]
Converted["_TextLabel4"].Font = Enum.Font.GothamBold
Converted["_TextLabel4"].Text = "Favorites"
Converted["_TextLabel4"].TextColor3 = Color3.fromRGB(255, 200.00001847743988, 0)
Converted["_TextLabel4"].TextScaled = true
Converted["_TextLabel4"].TextSize = 14
Converted["_TextLabel4"].TextWrapped = true
Converted["_TextLabel4"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_TextLabel4"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel4"].BackgroundTransparency = 1
Converted["_TextLabel4"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextLabel4"].BorderSizePixel = 0
Converted["_TextLabel4"].Size = UDim2.new(0, 200, 0, 15)
Converted["_TextLabel4"].Parent = Converted["_FavoritesSection"]
Converted["_UIPadding18"].PaddingBottom = UDim.new(0, 8)
Converted["_UIPadding18"].PaddingLeft = UDim.new(0, 16)
Converted["_UIPadding18"].PaddingRight = UDim.new(0, 16)
Converted["_UIPadding18"].PaddingTop = UDim.new(0, 8)
Converted["_UIPadding18"].Parent = Converted["_FavoritesSection"]
Converted["_Listing1"].AutomaticCanvasSize = Enum.AutomaticSize.X
Converted["_Listing1"].CanvasSize = UDim2.new(0, 0, 0, 0)
Converted["_Listing1"].ScrollBarThickness = 2
Converted["_Listing1"].Active = true
Converted["_Listing1"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Listing1"].BackgroundTransparency = 1
Converted["_Listing1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Listing1"].BorderSizePixel = 0
Converted["_Listing1"].Size = UDim2.new(1, 0, 0, 0)
Converted["_Listing1"].Name = "Listing"
Converted["_Listing1"].Parent = Converted["_FavoritesSection"]
Converted["_UIFlexItem6"].FlexMode = Enum.UIFlexMode.Grow
Converted["_UIFlexItem6"].Parent = Converted["_Listing1"]
Converted["_UIListLayout10"].Padding = UDim.new(0, 8)
Converted["_UIListLayout10"].FillDirection = Enum.FillDirection.Horizontal
Converted["_UIListLayout10"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIListLayout10"].Parent = Converted["_Listing1"]
Converted["_UIPadding19"].PaddingBottom = UDim.new(0, 4)
Converted["_UIPadding19"].PaddingTop = UDim.new(0, 4)
Converted["_UIPadding19"].Parent = Converted["_Listing1"]
Converted["_AnimationPacks1"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_AnimationPacks1"].BackgroundTransparency = 1
Converted["_AnimationPacks1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_AnimationPacks1"].BorderSizePixel = 0
Converted["_AnimationPacks1"].LayoutOrder = 1
Converted["_AnimationPacks1"].Size = UDim2.new(1, 0, 1, 0)
Converted["_AnimationPacks1"].Name = "AnimationPacks"
Converted["_AnimationPacks1"].Parent = Converted["_ItemSelect"]
Converted["_UIListLayout11"].Padding = UDim.new(0, 8)
Converted["_UIListLayout11"].HorizontalAlignment = Enum.HorizontalAlignment.Center
Converted["_UIListLayout11"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIListLayout11"].Parent = Converted["_AnimationPacks1"]
Converted["_TextLabel5"].Font = Enum.Font.GothamBold
Converted["_TextLabel5"].Text = "Animation packs"
Converted["_TextLabel5"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel5"].TextScaled = true
Converted["_TextLabel5"].TextSize = 14
Converted["_TextLabel5"].TextWrapped = true
Converted["_TextLabel5"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_TextLabel5"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel5"].BackgroundTransparency = 1
Converted["_TextLabel5"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextLabel5"].BorderSizePixel = 0
Converted["_TextLabel5"].LayoutOrder = -10
Converted["_TextLabel5"].Size = UDim2.new(1, 0, 0, 20)
Converted["_TextLabel5"].Parent = Converted["_AnimationPacks1"]
Converted["_Listing2"].AutomaticCanvasSize = Enum.AutomaticSize.Y
Converted["_Listing2"].CanvasSize = UDim2.new(0, 0, 0, 0)
Converted["_Listing2"].ScrollBarThickness = 2
Converted["_Listing2"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Listing2"].BackgroundTransparency = 1
Converted["_Listing2"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Listing2"].BorderSizePixel = 0
Converted["_Listing2"].Selectable = false
Converted["_Listing2"].Size = UDim2.new(1, 0, 0, 0)
Converted["_Listing2"].Name = "Listing"
Converted["_Listing2"].Parent = Converted["_AnimationPacks1"]
Converted["_UIFlexItem7"].FlexMode = Enum.UIFlexMode.Grow
Converted["_UIFlexItem7"].Parent = Converted["_Listing2"]
Converted["_UIGridLayout1"].CellPadding = UDim2.new(0, 10, 0, 10)
Converted["_UIGridLayout1"].CellSize = UDim2.new(0.300000012, -3, 0, 100)
Converted["_UIGridLayout1"].HorizontalAlignment = Enum.HorizontalAlignment.Center
Converted["_UIGridLayout1"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIGridLayout1"].Parent = Converted["_Listing2"]
Converted["_UIPadding20"].PaddingBottom = UDim.new(0, 16)
Converted["_UIPadding20"].PaddingTop = UDim.new(0, 8)
Converted["_UIPadding20"].Parent = Converted["_Listing2"]
Converted["_PaginationBar1"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_PaginationBar1"].BackgroundTransparency = 1
Converted["_PaginationBar1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_PaginationBar1"].BorderSizePixel = 0
Converted["_PaginationBar1"].Size = UDim2.new(1, 0, 0, 25)
Converted["_PaginationBar1"].Name = "PaginationBar"
Converted["_PaginationBar1"].Parent = Converted["_AnimationPacks1"]
Converted["_UIListLayout12"].Padding = UDim.new(0, 8)
Converted["_UIListLayout12"].FillDirection = Enum.FillDirection.Horizontal
Converted["_UIListLayout12"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIListLayout12"].VerticalAlignment = Enum.VerticalAlignment.Center
Converted["_UIListLayout12"].Parent = Converted["_PaginationBar1"]
Converted["_Previous1"].Font = Enum.Font.GothamBold
Converted["_Previous1"].Text = "<"
Converted["_Previous1"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Previous1"].TextScaled = true
Converted["_Previous1"].TextSize = 14
Converted["_Previous1"].TextWrapped = true
Converted["_Previous1"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Previous1"].BackgroundTransparency = 1
Converted["_Previous1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Previous1"].BorderSizePixel = 0
Converted["_Previous1"].LayoutOrder = -999
Converted["_Previous1"].Size = UDim2.new(0, 25, 0, 25)
Converted["_Previous1"].Name = "Previous"
Converted["_Previous1"].Parent = Converted["_PaginationBar1"]
Converted["_UIScale8"].Scale = 1.0000000116860974e-07
Converted["_UIScale8"].Parent = Converted["_Previous1"]
Converted["_SamplePage1"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_SamplePage1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_SamplePage1"].BorderSizePixel = 0
Converted["_SamplePage1"].LayoutOrder = 1
Converted["_SamplePage1"].Size = UDim2.new(0, 25, 0, 25)
Converted["_SamplePage1"].Visible = false
Converted["_SamplePage1"].Name = "SamplePage"
Converted["_SamplePage1"].Parent = Converted["_PaginationBar1"]
Converted["_UICorner18"].CornerRadius = UDim.new(1, 0)
Converted["_UICorner18"].Parent = Converted["_SamplePage1"]
Converted["_Label3"].Font = Enum.Font.GothamBold
Converted["_Label3"].Text = "1"
Converted["_Label3"].TextColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Label3"].TextScaled = true
Converted["_Label3"].TextSize = 14
Converted["_Label3"].TextWrapped = true
Converted["_Label3"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Label3"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Label3"].BackgroundTransparency = 1
Converted["_Label3"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Label3"].BorderSizePixel = 0
Converted["_Label3"].Position = UDim2.new(0.5, 0, 0.5, 0)
Converted["_Label3"].Size = UDim2.new(1, -5, 1, -5)
Converted["_Label3"].Name = "Label"
Converted["_Label3"].Parent = Converted["_SamplePage1"]
Converted["_UIScale9"].Parent = Converted["_SamplePage1"]
Converted["_Next1"].Font = Enum.Font.GothamBold
Converted["_Next1"].Text = ">"
Converted["_Next1"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Next1"].TextScaled = true
Converted["_Next1"].TextSize = 14
Converted["_Next1"].TextWrapped = true
Converted["_Next1"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Next1"].BackgroundTransparency = 1
Converted["_Next1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Next1"].BorderSizePixel = 0
Converted["_Next1"].LayoutOrder = 999
Converted["_Next1"].Size = UDim2.new(0, 25, 0, 25)
Converted["_Next1"].Name = "Next"
Converted["_Next1"].Parent = Converted["_PaginationBar1"]
Converted["_UIScale10"].Parent = Converted["_Next1"]
Converted["_PackEditor"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_PackEditor"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_PackEditor"].BorderSizePixel = 0
Converted["_PackEditor"].ClipsDescendants = true
Converted["_PackEditor"].LayoutOrder = -1
Converted["_PackEditor"].Size = UDim2.new(1, -4, 0, 125)
Converted["_PackEditor"].Name = "PackEditor"
Converted["_PackEditor"].Parent = Converted["_AnimationPacks1"]
Converted["_UIGradient2"].Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
}
Converted["_UIGradient2"].Rotation = -90
Converted["_UIGradient2"].Transparency = NumberSequence.new{
	NumberSequenceKeypoint.new(0, 0.7562500238418579),
	NumberSequenceKeypoint.new(1, 1)
}
Converted["_UIGradient2"].Parent = Converted["_PackEditor"]
Converted["_UIStroke11"].Color = Color3.fromRGB(255, 255, 255)
Converted["_UIStroke11"].Parent = Converted["_PackEditor"]
Converted["_UICorner19"].CornerRadius = UDim.new(0, 16)
Converted["_UICorner19"].Parent = Converted["_PackEditor"]
Converted["_UIListLayout13"].Padding = UDim.new(0, 4)
Converted["_UIListLayout13"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIListLayout13"].Parent = Converted["_PackEditor"]
Converted["_TextLabel6"].Font = Enum.Font.GothamBold
Converted["_TextLabel6"].Text = "Pack Editor"
Converted["_TextLabel6"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel6"].TextScaled = true
Converted["_TextLabel6"].TextSize = 14
Converted["_TextLabel6"].TextWrapped = true
Converted["_TextLabel6"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_TextLabel6"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel6"].BackgroundTransparency = 1
Converted["_TextLabel6"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextLabel6"].BorderSizePixel = 0
Converted["_TextLabel6"].Size = UDim2.new(0, 200, 0, 15)
Converted["_TextLabel6"].Parent = Converted["_PackEditor"]
Converted["_UIPadding21"].PaddingBottom = UDim.new(0, 8)
Converted["_UIPadding21"].PaddingLeft = UDim.new(0, 16)
Converted["_UIPadding21"].PaddingRight = UDim.new(0, 16)
Converted["_UIPadding21"].PaddingTop = UDim.new(0, 8)
Converted["_UIPadding21"].Parent = Converted["_PackEditor"]
Converted["_Listing3"].AutomaticCanvasSize = Enum.AutomaticSize.X
Converted["_Listing3"].CanvasSize = UDim2.new(0, 0, 0, 0)
Converted["_Listing3"].ScrollBarThickness = 2
Converted["_Listing3"].Active = true
Converted["_Listing3"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Listing3"].BackgroundTransparency = 1
Converted["_Listing3"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Listing3"].BorderSizePixel = 0
Converted["_Listing3"].Size = UDim2.new(1, 0, 0, 0)
Converted["_Listing3"].Name = "Listing"
Converted["_Listing3"].Parent = Converted["_PackEditor"]
Converted["_UIFlexItem8"].FlexMode = Enum.UIFlexMode.Grow
Converted["_UIFlexItem8"].Parent = Converted["_Listing3"]
Converted["_UIListLayout14"].Padding = UDim.new(0, 8)
Converted["_UIListLayout14"].FillDirection = Enum.FillDirection.Horizontal
Converted["_UIListLayout14"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIListLayout14"].Parent = Converted["_Listing3"]
Converted["_UIPadding22"].PaddingBottom = UDim.new(0, 4)
Converted["_UIPadding22"].PaddingTop = UDim.new(0, 4)
Converted["_UIPadding22"].Parent = Converted["_Listing3"]
Converted["_PackEditorUpdate"].Name = "PackEditorUpdate"
Converted["_PackEditorUpdate"].Parent = Converted["_AnimationPacks1"]
Converted["_Settings1"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Settings1"].BackgroundTransparency = 1
Converted["_Settings1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Settings1"].BorderSizePixel = 0
Converted["_Settings1"].LayoutOrder = 3
Converted["_Settings1"].Size = UDim2.new(1, 0, 1, 0)
Converted["_Settings1"].Name = "Settings"
Converted["_Settings1"].Parent = Converted["_ItemSelect"]
Converted["_UIListLayout15"].Padding = UDim.new(0, 8)
Converted["_UIListLayout15"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIListLayout15"].Parent = Converted["_Settings1"]
Converted["_Listing4"].AutomaticCanvasSize = Enum.AutomaticSize.Y
Converted["_Listing4"].CanvasSize = UDim2.new(0, 0, 0, 0)
Converted["_Listing4"].ScrollBarThickness = 2
Converted["_Listing4"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Listing4"].BackgroundTransparency = 1
Converted["_Listing4"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Listing4"].BorderSizePixel = 0
Converted["_Listing4"].Selectable = false
Converted["_Listing4"].Size = UDim2.new(1, 0, 0, 0)
Converted["_Listing4"].Name = "Listing"
Converted["_Listing4"].Parent = Converted["_Settings1"]
Converted["_UIFlexItem9"].FlexMode = Enum.UIFlexMode.Grow
Converted["_UIFlexItem9"].Parent = Converted["_Listing4"]
Converted["_UIPadding23"].PaddingBottom = UDim.new(0, 16)
Converted["_UIPadding23"].PaddingTop = UDim.new(0, 8)
Converted["_UIPadding23"].Parent = Converted["_Listing4"]
Converted["_UIListLayout16"].Padding = UDim.new(0, 8)
Converted["_UIListLayout16"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIListLayout16"].Parent = Converted["_Listing4"]
Converted["_Samples"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Samples"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Samples"].BorderSizePixel = 0
Converted["_Samples"].Size = UDim2.new(0, 100, 0, 100)
Converted["_Samples"].Visible = false
Converted["_Samples"].Name = "Samples"
Converted["_Samples"].Parent = Converted["_Settings1"]
Converted["_TextLabel7"].Font = Enum.Font.GothamBold
Converted["_TextLabel7"].Text = "Sample"
Converted["_TextLabel7"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel7"].TextScaled = true
Converted["_TextLabel7"].TextSize = 14
Converted["_TextLabel7"].TextWrapped = true
Converted["_TextLabel7"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_TextLabel7"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel7"].BackgroundTransparency = 1
Converted["_TextLabel7"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextLabel7"].BorderSizePixel = 0
Converted["_TextLabel7"].Size = UDim2.new(1, 0, 0, 15)
Converted["_TextLabel7"].Parent = Converted["_Samples"]
Converted["_Toggle"].Text = ""
Converted["_Toggle"].Active = false
Converted["_Toggle"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Toggle"].BackgroundTransparency = 1
Converted["_Toggle"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Toggle"].BorderSizePixel = 0
Converted["_Toggle"].Selectable = false
Converted["_Toggle"].Size = UDim2.new(1, 0, 0, 25)
Converted["_Toggle"].Name = "Toggle"
Converted["_Toggle"].Parent = Converted["_Samples"]
Converted["_ToggleTrack"].BackgroundColor3 = Color3.fromRGB(48.00000473856926, 48.00000473856926, 48.00000473856926)
Converted["_ToggleTrack"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_ToggleTrack"].BorderSizePixel = 0
Converted["_ToggleTrack"].Size = UDim2.new(0, 50, 1, 0)
Converted["_ToggleTrack"].Name = "ToggleTrack"
Converted["_ToggleTrack"].Parent = Converted["_Toggle"]
Converted["_UICorner20"].CornerRadius = UDim.new(1, 0)
Converted["_UICorner20"].Parent = Converted["_ToggleTrack"]
Converted["_Ball"].BackgroundColor3 = Color3.fromRGB(220.00000208616257, 220.00000208616257, 220.00000208616257)
Converted["_Ball"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Ball"].BorderSizePixel = 0
Converted["_Ball"].Size = UDim2.new(0, 0, 1, 0)
Converted["_Ball"].Name = "Ball"
Converted["_Ball"].Parent = Converted["_ToggleTrack"]
Converted["_UIAspectRatioConstraint2"].AspectType = Enum.AspectType.ScaleWithParentSize
Converted["_UIAspectRatioConstraint2"].DominantAxis = Enum.DominantAxis.Height
Converted["_UIAspectRatioConstraint2"].Parent = Converted["_Ball"]
Converted["_UICorner21"].CornerRadius = UDim.new(1, 0)
Converted["_UICorner21"].Parent = Converted["_Ball"]
Converted["_UIPadding24"].PaddingBottom = UDim.new(0, 3)
Converted["_UIPadding24"].PaddingLeft = UDim.new(0, 3)
Converted["_UIPadding24"].PaddingRight = UDim.new(0, 3)
Converted["_UIPadding24"].PaddingTop = UDim.new(0, 3)
Converted["_UIPadding24"].Parent = Converted["_ToggleTrack"]
Converted["_UIListLayout17"].Padding = UDim.new(0, 8)
Converted["_UIListLayout17"].FillDirection = Enum.FillDirection.Horizontal
Converted["_UIListLayout17"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIListLayout17"].VerticalAlignment = Enum.VerticalAlignment.Center
Converted["_UIListLayout17"].Parent = Converted["_Toggle"]
Converted["_Label4"].Font = Enum.Font.Gotham
Converted["_Label4"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Label4"].TextScaled = true
Converted["_Label4"].TextSize = 14
Converted["_Label4"].TextWrapped = true
Converted["_Label4"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_Label4"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Label4"].BackgroundTransparency = 1
Converted["_Label4"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Label4"].BorderSizePixel = 0
Converted["_Label4"].Size = UDim2.new(0, 200, 1, -10)
Converted["_Label4"].Name = "Label"
Converted["_Label4"].Parent = Converted["_Toggle"]
Converted["_Select"].AutomaticSize = Enum.AutomaticSize.X
Converted["_Select"].BackgroundColor3 = Color3.fromRGB(36.00000165402889, 36.00000165402889, 36.00000165402889)
Converted["_Select"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Select"].BorderSizePixel = 0
Converted["_Select"].Size = UDim2.new(0, 0, 0, 35)
Converted["_Select"].Name = "Select"
Converted["_Select"].Parent = Converted["_Samples"]
Converted["_UIListLayout18"].Padding = UDim.new(0, 4)
Converted["_UIListLayout18"].FillDirection = Enum.FillDirection.Horizontal
Converted["_UIListLayout18"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIListLayout18"].Parent = Converted["_Select"]
Converted["_UIPadding25"].PaddingBottom = UDim.new(0, 4)
Converted["_UIPadding25"].PaddingLeft = UDim.new(0, 4)
Converted["_UIPadding25"].PaddingRight = UDim.new(0, 4)
Converted["_UIPadding25"].PaddingTop = UDim.new(0, 4)
Converted["_UIPadding25"].Parent = Converted["_Select"]
Converted["_UICorner22"].Parent = Converted["_Select"]
Converted["_SelectButton"].Font = Enum.Font.Gotham
Converted["_SelectButton"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_SelectButton"].TextSize = 14
Converted["_SelectButton"].AutomaticSize = Enum.AutomaticSize.X
Converted["_SelectButton"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_SelectButton"].BackgroundTransparency = 1
Converted["_SelectButton"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_SelectButton"].BorderSizePixel = 0
Converted["_SelectButton"].Size = UDim2.new(0, 0, 1, 0)
Converted["_SelectButton"].Name = "SelectButton"
Converted["_SelectButton"].Parent = Converted["_Samples"]
Converted["_UICorner23"].Parent = Converted["_SelectButton"]
Converted["_UIPadding26"].PaddingBottom = UDim.new(0, 3)
Converted["_UIPadding26"].PaddingLeft = UDim.new(0, 8)
Converted["_UIPadding26"].PaddingRight = UDim.new(0, 8)
Converted["_UIPadding26"].PaddingTop = UDim.new(0, 3)
Converted["_UIPadding26"].Parent = Converted["_SelectButton"]
Converted["_TextLabel8"].Font = Enum.Font.GothamBold
Converted["_TextLabel8"].Text = "Settings"
Converted["_TextLabel8"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel8"].TextScaled = true
Converted["_TextLabel8"].TextSize = 14
Converted["_TextLabel8"].TextWrapped = true
Converted["_TextLabel8"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_TextLabel8"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel8"].BackgroundTransparency = 1
Converted["_TextLabel8"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextLabel8"].BorderSizePixel = 0
Converted["_TextLabel8"].LayoutOrder = -10
Converted["_TextLabel8"].Size = UDim2.new(1, 0, 0, 20)
Converted["_TextLabel8"].Parent = Converted["_Settings1"]
Converted["_AnimationController1"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_AnimationController1"].BackgroundTransparency = 1
Converted["_AnimationController1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_AnimationController1"].BorderSizePixel = 0
Converted["_AnimationController1"].LayoutOrder = 2
Converted["_AnimationController1"].Size = UDim2.new(1, 0, 1, 0)
Converted["_AnimationController1"].Name = "AnimationController"
Converted["_AnimationController1"].Parent = Converted["_ItemSelect"]
Converted["_DockerSwitch"].Font = Enum.Font.Gotham
Converted["_DockerSwitch"].Text = "Undock"
Converted["_DockerSwitch"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_DockerSwitch"].TextScaled = true
Converted["_DockerSwitch"].TextSize = 14
Converted["_DockerSwitch"].TextWrapped = true
Converted["_DockerSwitch"].AnchorPoint = Vector2.new(1, 0)
Converted["_DockerSwitch"].BackgroundColor3 = Color3.fromRGB(46.000001057982445, 46.000001057982445, 46.000001057982445)
Converted["_DockerSwitch"].BackgroundTransparency = 0.5
Converted["_DockerSwitch"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_DockerSwitch"].BorderSizePixel = 0
Converted["_DockerSwitch"].Position = UDim2.new(1, -2, 0, 2)
Converted["_DockerSwitch"].Size = UDim2.new(0, 50, 0, 20)
Converted["_DockerSwitch"].Name = "DockerSwitch"
Converted["_DockerSwitch"].Parent = Converted["_AnimationController1"]
Converted["_UICorner24"].Parent = Converted["_DockerSwitch"]
Converted["_UIPadding27"].PaddingBottom = UDim.new(0, 4)
Converted["_UIPadding27"].PaddingLeft = UDim.new(0, 4)
Converted["_UIPadding27"].PaddingRight = UDim.new(0, 4)
Converted["_UIPadding27"].PaddingTop = UDim.new(0, 4)
Converted["_UIPadding27"].Parent = Converted["_DockerSwitch"]
Converted["_UIStroke12"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Converted["_UIStroke12"].Color = Color3.fromRGB(179.000004529953, 179.000004529953, 179.000004529953)
Converted["_UIStroke12"].Parent = Converted["_DockerSwitch"]
Converted["_Dockable"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Dockable"].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Dockable"].BackgroundTransparency = 1
Converted["_Dockable"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Dockable"].BorderSizePixel = 0
Converted["_Dockable"].Position = UDim2.new(0.5, 0, 0.5, 0)
Converted["_Dockable"].Size = UDim2.new(1, 0, 1, 0)
Converted["_Dockable"].Name = "Dockable"
Converted["_Dockable"].Parent = Converted["_AnimationController1"]
Converted["_UIListLayout19"].Padding = UDim.new(0, 8)
Converted["_UIListLayout19"].HorizontalAlignment = Enum.HorizontalAlignment.Center
Converted["_UIListLayout19"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIListLayout19"].Parent = Converted["_Dockable"]
Converted["_Samples1"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Samples1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Samples1"].BorderSizePixel = 0
Converted["_Samples1"].Size = UDim2.new(0, 100, 0, 100)
Converted["_Samples1"].Visible = false
Converted["_Samples1"].Name = "Samples"
Converted["_Samples1"].Parent = Converted["_Dockable"]
Converted["_TextLabel9"].Font = Enum.Font.GothamBold
Converted["_TextLabel9"].Text = "Sample"
Converted["_TextLabel9"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel9"].TextScaled = true
Converted["_TextLabel9"].TextSize = 14
Converted["_TextLabel9"].TextWrapped = true
Converted["_TextLabel9"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_TextLabel9"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel9"].BackgroundTransparency = 1
Converted["_TextLabel9"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextLabel9"].BorderSizePixel = 0
Converted["_TextLabel9"].Size = UDim2.new(1, 0, 0, 15)
Converted["_TextLabel9"].Parent = Converted["_Samples1"]
Converted["_Toggle1"].Text = ""
Converted["_Toggle1"].Active = false
Converted["_Toggle1"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Toggle1"].BackgroundTransparency = 1
Converted["_Toggle1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Toggle1"].BorderSizePixel = 0
Converted["_Toggle1"].Selectable = false
Converted["_Toggle1"].Size = UDim2.new(1, 0, 0, 25)
Converted["_Toggle1"].Name = "Toggle"
Converted["_Toggle1"].Parent = Converted["_Samples1"]
Converted["_ToggleTrack1"].BackgroundColor3 = Color3.fromRGB(48.00000473856926, 48.00000473856926, 48.00000473856926)
Converted["_ToggleTrack1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_ToggleTrack1"].BorderSizePixel = 0
Converted["_ToggleTrack1"].Size = UDim2.new(0, 50, 1, 0)
Converted["_ToggleTrack1"].Name = "ToggleTrack"
Converted["_ToggleTrack1"].Parent = Converted["_Toggle1"]
Converted["_UICorner25"].CornerRadius = UDim.new(1, 0)
Converted["_UICorner25"].Parent = Converted["_ToggleTrack1"]
Converted["_Ball1"].BackgroundColor3 = Color3.fromRGB(220.00000208616257, 220.00000208616257, 220.00000208616257)
Converted["_Ball1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Ball1"].BorderSizePixel = 0
Converted["_Ball1"].Size = UDim2.new(0, 0, 1, 0)
Converted["_Ball1"].Name = "Ball"
Converted["_Ball1"].Parent = Converted["_ToggleTrack1"]
Converted["_UIAspectRatioConstraint3"].AspectType = Enum.AspectType.ScaleWithParentSize
Converted["_UIAspectRatioConstraint3"].DominantAxis = Enum.DominantAxis.Height
Converted["_UIAspectRatioConstraint3"].Parent = Converted["_Ball1"]
Converted["_UICorner26"].CornerRadius = UDim.new(1, 0)
Converted["_UICorner26"].Parent = Converted["_Ball1"]
Converted["_UIPadding28"].PaddingBottom = UDim.new(0, 3)
Converted["_UIPadding28"].PaddingLeft = UDim.new(0, 3)
Converted["_UIPadding28"].PaddingRight = UDim.new(0, 3)
Converted["_UIPadding28"].PaddingTop = UDim.new(0, 3)
Converted["_UIPadding28"].Parent = Converted["_ToggleTrack1"]
Converted["_UIListLayout20"].Padding = UDim.new(0, 8)
Converted["_UIListLayout20"].FillDirection = Enum.FillDirection.Horizontal
Converted["_UIListLayout20"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIListLayout20"].VerticalAlignment = Enum.VerticalAlignment.Center
Converted["_UIListLayout20"].Parent = Converted["_Toggle1"]
Converted["_Label5"].Font = Enum.Font.Gotham
Converted["_Label5"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Label5"].TextScaled = true
Converted["_Label5"].TextSize = 14
Converted["_Label5"].TextWrapped = true
Converted["_Label5"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_Label5"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Label5"].BackgroundTransparency = 1
Converted["_Label5"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Label5"].BorderSizePixel = 0
Converted["_Label5"].Size = UDim2.new(0, 200, 1, -10)
Converted["_Label5"].Name = "Label"
Converted["_Label5"].Parent = Converted["_Toggle1"]
Converted["_Select1"].AutomaticSize = Enum.AutomaticSize.X
Converted["_Select1"].BackgroundColor3 = Color3.fromRGB(36.00000165402889, 36.00000165402889, 36.00000165402889)
Converted["_Select1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Select1"].BorderSizePixel = 0
Converted["_Select1"].Size = UDim2.new(0, 0, 0, 35)
Converted["_Select1"].Name = "Select"
Converted["_Select1"].Parent = Converted["_Samples1"]
Converted["_UIListLayout21"].Padding = UDim.new(0, 4)
Converted["_UIListLayout21"].FillDirection = Enum.FillDirection.Horizontal
Converted["_UIListLayout21"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIListLayout21"].Parent = Converted["_Select1"]
Converted["_UIPadding29"].PaddingBottom = UDim.new(0, 4)
Converted["_UIPadding29"].PaddingLeft = UDim.new(0, 4)
Converted["_UIPadding29"].PaddingRight = UDim.new(0, 4)
Converted["_UIPadding29"].PaddingTop = UDim.new(0, 4)
Converted["_UIPadding29"].Parent = Converted["_Select1"]
Converted["_UICorner27"].Parent = Converted["_Select1"]
Converted["_SelectButton1"].Font = Enum.Font.Gotham
Converted["_SelectButton1"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_SelectButton1"].TextSize = 14
Converted["_SelectButton1"].AutomaticSize = Enum.AutomaticSize.X
Converted["_SelectButton1"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_SelectButton1"].BackgroundTransparency = 1
Converted["_SelectButton1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_SelectButton1"].BorderSizePixel = 0
Converted["_SelectButton1"].Size = UDim2.new(0, 0, 1, 0)
Converted["_SelectButton1"].Name = "SelectButton"
Converted["_SelectButton1"].Parent = Converted["_Samples1"]
Converted["_UICorner28"].Parent = Converted["_SelectButton1"]
Converted["_UIPadding30"].PaddingBottom = UDim.new(0, 3)
Converted["_UIPadding30"].PaddingLeft = UDim.new(0, 8)
Converted["_UIPadding30"].PaddingRight = UDim.new(0, 8)
Converted["_UIPadding30"].PaddingTop = UDim.new(0, 3)
Converted["_UIPadding30"].Parent = Converted["_SelectButton1"]
Converted["_TextLabel10"].Font = Enum.Font.GothamBold
Converted["_TextLabel10"].Text = "Animation controller"
Converted["_TextLabel10"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel10"].TextScaled = true
Converted["_TextLabel10"].TextSize = 14
Converted["_TextLabel10"].TextWrapped = true
Converted["_TextLabel10"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_TextLabel10"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel10"].BackgroundTransparency = 1
Converted["_TextLabel10"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextLabel10"].BorderSizePixel = 0
Converted["_TextLabel10"].LayoutOrder = -10
Converted["_TextLabel10"].Size = UDim2.new(1, 0, 0, 20)
Converted["_TextLabel10"].Parent = Converted["_Dockable"]
Converted["_SelectTrack"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_SelectTrack"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_SelectTrack"].BorderSizePixel = 0
Converted["_SelectTrack"].ClipsDescendants = true
Converted["_SelectTrack"].Size = UDim2.new(1, -4, 0, 125)
Converted["_SelectTrack"].Name = "SelectTrack"
Converted["_SelectTrack"].Parent = Converted["_Dockable"]
Converted["_UIGradient3"].Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(48.000000938773155, 48.000000938773155, 48.000000938773155))
}
Converted["_UIGradient3"].Rotation = -90
Converted["_UIGradient3"].Transparency = NumberSequence.new{
	NumberSequenceKeypoint.new(0, 0.7562500238418579),
	NumberSequenceKeypoint.new(1, 1)
}
Converted["_UIGradient3"].Parent = Converted["_SelectTrack"]
Converted["_UICorner29"].CornerRadius = UDim.new(0, 16)
Converted["_UICorner29"].Parent = Converted["_SelectTrack"]
Converted["_UIStroke13"].Color = Color3.fromRGB(159.0000057220459, 159.0000057220459, 159.0000057220459)
Converted["_UIStroke13"].Parent = Converted["_SelectTrack"]
Converted["_UIPadding31"].PaddingBottom = UDim.new(0, 8)
Converted["_UIPadding31"].PaddingLeft = UDim.new(0, 12)
Converted["_UIPadding31"].PaddingRight = UDim.new(0, 12)
Converted["_UIPadding31"].PaddingTop = UDim.new(0, 8)
Converted["_UIPadding31"].Parent = Converted["_SelectTrack"]
Converted["_UIListLayout22"].Padding = UDim.new(0, 4)
Converted["_UIListLayout22"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIListLayout22"].Parent = Converted["_SelectTrack"]
Converted["_TextLabel11"].Font = Enum.Font.GothamBold
Converted["_TextLabel11"].Text = "Select track to control"
Converted["_TextLabel11"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel11"].TextScaled = true
Converted["_TextLabel11"].TextSize = 14
Converted["_TextLabel11"].TextTransparency = 0.1899999976158142
Converted["_TextLabel11"].TextWrapped = true
Converted["_TextLabel11"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_TextLabel11"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel11"].BackgroundTransparency = 1
Converted["_TextLabel11"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextLabel11"].BorderSizePixel = 0
Converted["_TextLabel11"].Size = UDim2.new(0, 200, 0, 15)
Converted["_TextLabel11"].Parent = Converted["_SelectTrack"]
Converted["_Listing5"].AutomaticCanvasSize = Enum.AutomaticSize.X
Converted["_Listing5"].CanvasSize = UDim2.new(0, 0, 0, 0)
Converted["_Listing5"].ScrollBarImageTransparency = 0.4000000059604645
Converted["_Listing5"].ScrollBarThickness = 2
Converted["_Listing5"].Active = true
Converted["_Listing5"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Listing5"].BackgroundTransparency = 1
Converted["_Listing5"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Listing5"].BorderSizePixel = 0
Converted["_Listing5"].Size = UDim2.new(1, 0, 0, 90)
Converted["_Listing5"].Name = "Listing"
Converted["_Listing5"].Parent = Converted["_SelectTrack"]
Converted["_UIListLayout23"].Padding = UDim.new(0, 8)
Converted["_UIListLayout23"].FillDirection = Enum.FillDirection.Horizontal
Converted["_UIListLayout23"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIListLayout23"].Parent = Converted["_Listing5"]
Converted["_UIPadding32"].PaddingBottom = UDim.new(0, 6)
Converted["_UIPadding32"].PaddingLeft = UDim.new(0, 4)
Converted["_UIPadding32"].PaddingRight = UDim.new(0, 4)
Converted["_UIPadding32"].PaddingTop = UDim.new(0, 4)
Converted["_UIPadding32"].Parent = Converted["_Listing5"]
Converted["_Sample"].Font = Enum.Font.Gotham
Converted["_Sample"].Text = ""
Converted["_Sample"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Sample"].TextScaled = true
Converted["_Sample"].TextSize = 14
Converted["_Sample"].TextWrapped = true
Converted["_Sample"].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Sample"].BackgroundTransparency = 0.699999988079071
Converted["_Sample"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Sample"].BorderSizePixel = 0
Converted["_Sample"].Size = UDim2.new(0, 200, 1, 0)
Converted["_Sample"].Visible = false
Converted["_Sample"].Name = "Sample"
Converted["_Sample"].Parent = Converted["_Listing5"]
Converted["_UICorner30"].CornerRadius = UDim.new(0, 16)
Converted["_UICorner30"].Parent = Converted["_Sample"]
Converted["_UIPadding33"].PaddingBottom = UDim.new(0, 7)
Converted["_UIPadding33"].PaddingLeft = UDim.new(0, 12)
Converted["_UIPadding33"].PaddingRight = UDim.new(0, 12)
Converted["_UIPadding33"].PaddingTop = UDim.new(0, 7)
Converted["_UIPadding33"].Parent = Converted["_Sample"]
Converted["_UIStroke14"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Converted["_UIStroke14"].Color = Color3.fromRGB(179.000004529953, 179.000004529953, 179.000004529953)
Converted["_UIStroke14"].Thickness = 2.299999952316284
Converted["_UIStroke14"].Parent = Converted["_Sample"]
Converted["_UIListLayout24"].Padding = UDim.new(0, 4)
Converted["_UIListLayout24"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIListLayout24"].Parent = Converted["_Sample"]
Converted["_TextLabel12"].Font = Enum.Font.Gotham
Converted["_TextLabel12"].Text = "Track name"
Converted["_TextLabel12"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel12"].TextScaled = true
Converted["_TextLabel12"].TextSize = 14
Converted["_TextLabel12"].TextTransparency = 0.5400000214576721
Converted["_TextLabel12"].TextWrapped = true
Converted["_TextLabel12"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_TextLabel12"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel12"].BackgroundTransparency = 1
Converted["_TextLabel12"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextLabel12"].BorderSizePixel = 0
Converted["_TextLabel12"].Size = UDim2.new(0, 200, 0, 10)
Converted["_TextLabel12"].Parent = Converted["_Sample"]
Converted["_TrackName"].Font = Enum.Font.GothamBold
Converted["_TrackName"].Text = "Track name"
Converted["_TrackName"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TrackName"].TextSize = 14
Converted["_TrackName"].TextWrapped = true
Converted["_TrackName"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_TrackName"].TextYAlignment = Enum.TextYAlignment.Top
Converted["_TrackName"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TrackName"].BackgroundTransparency = 1
Converted["_TrackName"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TrackName"].BorderSizePixel = 0
Converted["_TrackName"].Size = UDim2.new(1, 0, 0, 15)
Converted["_TrackName"].Name = "TrackName"
Converted["_TrackName"].Parent = Converted["_Sample"]
Converted["_UIFlexItem10"].FlexMode = Enum.UIFlexMode.Grow
Converted["_UIFlexItem10"].Parent = Converted["_TrackName"]
Converted["_Listing6"].AutomaticCanvasSize = Enum.AutomaticSize.Y
Converted["_Listing6"].CanvasSize = UDim2.new(0, 0, 0, 0)
Converted["_Listing6"].ScrollBarThickness = 2
Converted["_Listing6"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Listing6"].BackgroundTransparency = 1
Converted["_Listing6"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Listing6"].BorderSizePixel = 0
Converted["_Listing6"].LayoutOrder = 2
Converted["_Listing6"].Selectable = false
Converted["_Listing6"].Size = UDim2.new(1, 0, 0, 0)
Converted["_Listing6"].Name = "Listing"
Converted["_Listing6"].Parent = Converted["_Dockable"]
Converted["_UIFlexItem11"].FlexMode = Enum.UIFlexMode.Grow
Converted["_UIFlexItem11"].Parent = Converted["_Listing6"]
Converted["_UIPadding34"].PaddingBottom = UDim.new(0, 16)
Converted["_UIPadding34"].PaddingTop = UDim.new(0, 8)
Converted["_UIPadding34"].Parent = Converted["_Listing6"]
Converted["_UIListLayout25"].Padding = UDim.new(0, 8)
Converted["_UIListLayout25"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIListLayout25"].Parent = Converted["_Listing6"]
Converted["_Seekbar"].Text = ""
Converted["_Seekbar"].Modal = true
Converted["_Seekbar"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Seekbar"].BackgroundTransparency = 1
Converted["_Seekbar"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Seekbar"].BorderSizePixel = 0
Converted["_Seekbar"].LayoutOrder = 1
Converted["_Seekbar"].Selectable = false
Converted["_Seekbar"].Size = UDim2.new(1, 0, 0, 25)
Converted["_Seekbar"].Visible = false
Converted["_Seekbar"].Name = "Seekbar"
Converted["_Seekbar"].Parent = Converted["_Dockable"]
Converted["_Track"].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Track"].BackgroundTransparency = 0.699999988079071
Converted["_Track"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Track"].BorderSizePixel = 0
Converted["_Track"].Size = UDim2.new(1, 0, 1, 0)
Converted["_Track"].Name = "Track"
Converted["_Track"].Parent = Converted["_Seekbar"]
Converted["_UICorner31"].CornerRadius = UDim.new(1, 0)
Converted["_UICorner31"].Parent = Converted["_Track"]
Converted["_Ball2"].BackgroundColor3 = Color3.fromRGB(220.00000208616257, 220.00000208616257, 220.00000208616257)
Converted["_Ball2"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Ball2"].BorderSizePixel = 0
Converted["_Ball2"].Size = UDim2.new(0, 0, 1, 0)
Converted["_Ball2"].Name = "Ball"
Converted["_Ball2"].Parent = Converted["_Track"]
Converted["_UIAspectRatioConstraint4"].AspectType = Enum.AspectType.ScaleWithParentSize
Converted["_UIAspectRatioConstraint4"].DominantAxis = Enum.DominantAxis.Height
Converted["_UIAspectRatioConstraint4"].Parent = Converted["_Ball2"]
Converted["_UICorner32"].CornerRadius = UDim.new(1, 0)
Converted["_UICorner32"].Parent = Converted["_Ball2"]
Converted["_TimePos"].Font = Enum.Font.GothamBold
Converted["_TimePos"].Text = "2.12"
Converted["_TimePos"].TextColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TimePos"].TextScaled = true
Converted["_TimePos"].TextSize = 14
Converted["_TimePos"].TextTransparency = 1
Converted["_TimePos"].TextWrapped = true
Converted["_TimePos"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TimePos"].BackgroundTransparency = 1
Converted["_TimePos"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TimePos"].BorderSizePixel = 0
Converted["_TimePos"].Size = UDim2.new(1, 0, 1, 0)
Converted["_TimePos"].Name = "TimePos"
Converted["_TimePos"].Parent = Converted["_Ball2"]
Converted["_UIPadding35"].PaddingBottom = UDim.new(0, 4)
Converted["_UIPadding35"].PaddingLeft = UDim.new(0, 4)
Converted["_UIPadding35"].PaddingRight = UDim.new(0, 4)
Converted["_UIPadding35"].PaddingTop = UDim.new(0, 4)
Converted["_UIPadding35"].Parent = Converted["_Ball2"]
Converted["_UIPadding36"].PaddingBottom = UDim.new(0, 3)
Converted["_UIPadding36"].PaddingLeft = UDim.new(0, 3)
Converted["_UIPadding36"].PaddingRight = UDim.new(0, 3)
Converted["_UIPadding36"].PaddingTop = UDim.new(0, 3)
Converted["_UIPadding36"].Parent = Converted["_Track"]
Converted["_Tactical"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Tactical"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Tactical"].BackgroundTransparency = 1
Converted["_Tactical"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Tactical"].BorderSizePixel = 0
Converted["_Tactical"].Position = UDim2.new(0.5, 0, 0.5, 0)
Converted["_Tactical"].Size = UDim2.new(1, -20, 1, -5)
Converted["_Tactical"].Name = "Tactical"
Converted["_Tactical"].Parent = Converted["_Track"]
Converted["_UIListLayout26"].HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween
Converted["_UIListLayout26"].FillDirection = Enum.FillDirection.Horizontal
Converted["_UIListLayout26"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIListLayout26"].VerticalAlignment = Enum.VerticalAlignment.Center
Converted["_UIListLayout26"].Parent = Converted["_Tactical"]
Converted["_Bar1"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Bar1"].BackgroundTransparency = 0.8999999761581421
Converted["_Bar1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Bar1"].BorderSizePixel = 0
Converted["_Bar1"].Size = UDim2.new(0, 4, 0, 4)
Converted["_Bar1"].Name = "Bar"
Converted["_Bar1"].Parent = Converted["_Tactical"]
Converted["_UICorner33"].CornerRadius = UDim.new(0, 99)
Converted["_UICorner33"].Parent = Converted["_Bar1"]
Converted["_Bar2"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Bar2"].BackgroundTransparency = 0.8999999761581421
Converted["_Bar2"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Bar2"].BorderSizePixel = 0
Converted["_Bar2"].Size = UDim2.new(0, 4, 0, 4)
Converted["_Bar2"].Name = "Bar"
Converted["_Bar2"].Parent = Converted["_Tactical"]
Converted["_UICorner34"].CornerRadius = UDim.new(0, 99)
Converted["_UICorner34"].Parent = Converted["_Bar2"]
Converted["_Bar3"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Bar3"].BackgroundTransparency = 0.8999999761581421
Converted["_Bar3"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Bar3"].BorderSizePixel = 0
Converted["_Bar3"].Size = UDim2.new(0, 4, 0, 4)
Converted["_Bar3"].Name = "Bar"
Converted["_Bar3"].Parent = Converted["_Tactical"]
Converted["_UICorner35"].CornerRadius = UDim.new(0, 99)
Converted["_UICorner35"].Parent = Converted["_Bar3"]
Converted["_Bar4"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Bar4"].BackgroundTransparency = 0.8999999761581421
Converted["_Bar4"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Bar4"].BorderSizePixel = 0
Converted["_Bar4"].Size = UDim2.new(0, 4, 0, 4)
Converted["_Bar4"].Name = "Bar"
Converted["_Bar4"].Parent = Converted["_Tactical"]
Converted["_UICorner36"].CornerRadius = UDim.new(0, 99)
Converted["_UICorner36"].Parent = Converted["_Bar4"]
Converted["_Bar5"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Bar5"].BackgroundTransparency = 0.8999999761581421
Converted["_Bar5"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Bar5"].BorderSizePixel = 0
Converted["_Bar5"].Size = UDim2.new(0, 4, 0, 4)
Converted["_Bar5"].Name = "Bar"
Converted["_Bar5"].Parent = Converted["_Tactical"]
Converted["_UICorner37"].CornerRadius = UDim.new(0, 99)
Converted["_UICorner37"].Parent = Converted["_Bar5"]
Converted["_Bar6"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Bar6"].BackgroundTransparency = 0.8999999761581421
Converted["_Bar6"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Bar6"].BorderSizePixel = 0
Converted["_Bar6"].Size = UDim2.new(0, 4, 0, 4)
Converted["_Bar6"].Name = "Bar"
Converted["_Bar6"].Parent = Converted["_Tactical"]
Converted["_UICorner38"].CornerRadius = UDim.new(0, 99)
Converted["_UICorner38"].Parent = Converted["_Bar6"]
Converted["_Bar7"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Bar7"].BackgroundTransparency = 0.8999999761581421
Converted["_Bar7"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Bar7"].BorderSizePixel = 0
Converted["_Bar7"].Size = UDim2.new(0, 4, 0, 4)
Converted["_Bar7"].Name = "Bar"
Converted["_Bar7"].Parent = Converted["_Tactical"]
Converted["_UICorner39"].CornerRadius = UDim.new(0, 99)
Converted["_UICorner39"].Parent = Converted["_Bar7"]
Converted["_Bar8"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Bar8"].BackgroundTransparency = 0.8999999761581421
Converted["_Bar8"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Bar8"].BorderSizePixel = 0
Converted["_Bar8"].Size = UDim2.new(0, 4, 0, 4)
Converted["_Bar8"].Name = "Bar"
Converted["_Bar8"].Parent = Converted["_Tactical"]
Converted["_UICorner40"].CornerRadius = UDim.new(0, 99)
Converted["_UICorner40"].Parent = Converted["_Bar8"]
Converted["_Bar9"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Bar9"].BackgroundTransparency = 0.8999999761581421
Converted["_Bar9"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Bar9"].BorderSizePixel = 0
Converted["_Bar9"].Size = UDim2.new(0, 4, 0, 4)
Converted["_Bar9"].Name = "Bar"
Converted["_Bar9"].Parent = Converted["_Tactical"]
Converted["_UICorner41"].CornerRadius = UDim.new(0, 99)
Converted["_UICorner41"].Parent = Converted["_Bar9"]
Converted["_Bar10"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Bar10"].BackgroundTransparency = 0.8999999761581421
Converted["_Bar10"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Bar10"].BorderSizePixel = 0
Converted["_Bar10"].Size = UDim2.new(0, 4, 0, 4)
Converted["_Bar10"].Name = "Bar"
Converted["_Bar10"].Parent = Converted["_Tactical"]
Converted["_UICorner42"].CornerRadius = UDim.new(0, 99)
Converted["_UICorner42"].Parent = Converted["_Bar10"]
Converted["_Bar11"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Bar11"].BackgroundTransparency = 0.8999999761581421
Converted["_Bar11"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Bar11"].BorderSizePixel = 0
Converted["_Bar11"].Size = UDim2.new(0, 4, 0, 4)
Converted["_Bar11"].Name = "Bar"
Converted["_Bar11"].Parent = Converted["_Tactical"]
Converted["_UICorner43"].CornerRadius = UDim.new(0, 99)
Converted["_UICorner43"].Parent = Converted["_Bar11"]
Converted["_UIListLayout27"].Padding = UDim.new(0, 8)
Converted["_UIListLayout27"].FillDirection = Enum.FillDirection.Horizontal
Converted["_UIListLayout27"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIListLayout27"].VerticalAlignment = Enum.VerticalAlignment.Center
Converted["_UIListLayout27"].Parent = Converted["_Seekbar"]
Converted["_UICorner44"].CornerRadius = UDim.new(0, 16)
Converted["_UICorner44"].Parent = Converted["_Dockable"]
Converted["_UIPadding37"].Parent = Converted["_Dockable"]
Converted["_Handle"].Text = ""
Converted["_Handle"].Modal = true
Converted["_Handle"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Handle"].BackgroundTransparency = 0.699999988079071
Converted["_Handle"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Handle"].BorderSizePixel = 0
Converted["_Handle"].LayoutOrder = -100
Converted["_Handle"].Selectable = false
Converted["_Handle"].Size = UDim2.new(0, 100, 0, 10)
Converted["_Handle"].Visible = false
Converted["_Handle"].Name = "Handle"
Converted["_Handle"].Parent = Converted["_Dockable"]
Converted["_UICorner45"].Parent = Converted["_Handle"]
Converted["_ItemListTemplate"].Active = true
Converted["_ItemListTemplate"].BackgroundColor3 = Color3.fromRGB(20.000000707805157, 20.000000707805157, 20.000000707805157)
Converted["_ItemListTemplate"].BackgroundTransparency = 1
Converted["_ItemListTemplate"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_ItemListTemplate"].BorderSizePixel = 0
Converted["_ItemListTemplate"].ClipsDescendants = true
Converted["_ItemListTemplate"].Selectable = true
Converted["_ItemListTemplate"].Size = UDim2.new(0, 200, 0, 50)
Converted["_ItemListTemplate"].Visible = false
Converted["_ItemListTemplate"].Name = "ItemListTemplate"
Converted["_ItemListTemplate"].Parent = Converted["_ItemSelect"]
Converted["_UIPadding38"].PaddingBottom = UDim.new(0, 2)
Converted["_UIPadding38"].PaddingLeft = UDim.new(0, 2)
Converted["_UIPadding38"].PaddingRight = UDim.new(0, 2)
Converted["_UIPadding38"].PaddingTop = UDim.new(0, 2)
Converted["_UIPadding38"].Parent = Converted["_ItemListTemplate"]
Converted["_Clickable1"].Font = Enum.Font.SourceSans
Converted["_Clickable1"].Text = ""
Converted["_Clickable1"].TextColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Clickable1"].TextSize = 14
Converted["_Clickable1"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Clickable1"].BackgroundColor3 = Color3.fromRGB(20.000000707805157, 20.000000707805157, 20.000000707805157)
Converted["_Clickable1"].BackgroundTransparency = 0.550000011920929
Converted["_Clickable1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Clickable1"].BorderSizePixel = 0
Converted["_Clickable1"].Position = UDim2.new(0.5, 0, 0.5, 0)
Converted["_Clickable1"].Size = UDim2.new(1, 0, 1, 0)
Converted["_Clickable1"].Name = "Clickable"
Converted["_Clickable1"].Parent = Converted["_ItemListTemplate"]
Converted["_UIPadding39"].PaddingBottom = UDim.new(0, 7)
Converted["_UIPadding39"].PaddingLeft = UDim.new(0, 7)
Converted["_UIPadding39"].PaddingRight = UDim.new(0, 7)
Converted["_UIPadding39"].PaddingTop = UDim.new(0, 7)
Converted["_UIPadding39"].Parent = Converted["_Clickable1"]
Converted["_Details"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Details"].BackgroundTransparency = 1
Converted["_Details"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Details"].BorderSizePixel = 0
Converted["_Details"].Size = UDim2.new(0, 0, 1, 0)
Converted["_Details"].Name = "Details"
Converted["_Details"].Parent = Converted["_Clickable1"]
Converted["_Description"].Font = Enum.Font.Gotham
Converted["_Description"].Text = ""
Converted["_Description"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Description"].TextSize = 14
Converted["_Description"].TextTransparency = 0.4000000059604645
Converted["_Description"].TextTruncate = Enum.TextTruncate.AtEnd
Converted["_Description"].TextWrapped = true
Converted["_Description"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_Description"].TextYAlignment = Enum.TextYAlignment.Top
Converted["_Description"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Description"].BackgroundTransparency = 1
Converted["_Description"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Description"].BorderSizePixel = 0
Converted["_Description"].LayoutOrder = 1
Converted["_Description"].Size = UDim2.new(1, 0, 0, 15)
Converted["_Description"].Name = "Description"
Converted["_Description"].Parent = Converted["_Details"]
Converted["_UIFlexItem12"].FlexMode = Enum.UIFlexMode.Grow
Converted["_UIFlexItem12"].Parent = Converted["_Description"]
Converted["_Buttons"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Buttons"].BackgroundTransparency = 1
Converted["_Buttons"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Buttons"].BorderSizePixel = 0
Converted["_Buttons"].LayoutOrder = 10
Converted["_Buttons"].Size = UDim2.new(1, 0, 0, 0)
Converted["_Buttons"].Name = "Buttons"
Converted["_Buttons"].Parent = Converted["_Details"]
Converted["_Loading"].BackgroundColor3 = Color3.fromRGB(65.0000037252903, 65.0000037252903, 65.0000037252903)
Converted["_Loading"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Loading"].BorderSizePixel = 0
Converted["_Loading"].LayoutOrder = -10
Converted["_Loading"].Size = UDim2.new(0, 0, 0, 10)
Converted["_Loading"].Visible = false
Converted["_Loading"].Name = "Loading"
Converted["_Loading"].Parent = Converted["_Buttons"]
Converted["_Progress"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Progress"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Progress"].BorderSizePixel = 0
Converted["_Progress"].LayoutOrder = -10
Converted["_Progress"].Size = UDim2.new(0, 10, 0, 10)
Converted["_Progress"].Name = "Progress"
Converted["_Progress"].Parent = Converted["_Loading"]
Converted["_UICorner46"].Parent = Converted["_Progress"]
Converted["_UICorner47"].Parent = Converted["_Loading"]
Converted["_UIFlexItem13"].FlexMode = Enum.UIFlexMode.Grow
Converted["_UIFlexItem13"].Parent = Converted["_Loading"]
Converted["_Play"].Font = Enum.Font.GothamBold
Converted["_Play"].Text = "PLAY"
Converted["_Play"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Play"].TextScaled = true
Converted["_Play"].TextSize = 14
Converted["_Play"].TextWrapped = true
Converted["_Play"].BackgroundColor3 = Color3.fromRGB(46.000001057982445, 46.000001057982445, 46.000001057982445)
Converted["_Play"].BackgroundTransparency = 0.30000001192092896
Converted["_Play"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Play"].BorderSizePixel = 0
Converted["_Play"].Size = UDim2.new(0, 40, 0, 15)
Converted["_Play"].Name = "Play"
Converted["_Play"].Parent = Converted["_Buttons"]
Converted["_UIPadding40"].PaddingBottom = UDim.new(0, 4)
Converted["_UIPadding40"].PaddingLeft = UDim.new(0, 4)
Converted["_UIPadding40"].PaddingRight = UDim.new(0, 4)
Converted["_UIPadding40"].PaddingTop = UDim.new(0, 3)
Converted["_UIPadding40"].Parent = Converted["_Play"]
Converted["_UICorner48"].CornerRadius = UDim.new(0, 6)
Converted["_UICorner48"].Parent = Converted["_Play"]
Converted["_OffSale"].Font = Enum.Font.GothamBold
Converted["_OffSale"].Text = "OFF-SALE"
Converted["_OffSale"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_OffSale"].TextScaled = true
Converted["_OffSale"].TextSize = 14
Converted["_OffSale"].TextWrapped = true
Converted["_OffSale"].BackgroundColor3 = Color3.fromRGB(190.0000038743019, 0, 3.0000002961605787)
Converted["_OffSale"].BackgroundTransparency = 0.30000001192092896
Converted["_OffSale"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_OffSale"].BorderSizePixel = 0
Converted["_OffSale"].Interactable = false
Converted["_OffSale"].LayoutOrder = -1
Converted["_OffSale"].Size = UDim2.new(0, 60, 0, 15)
Converted["_OffSale"].Visible = false
Converted["_OffSale"].Name = "OffSale"
Converted["_OffSale"].Parent = Converted["_Buttons"]
Converted["_UIPadding41"].PaddingBottom = UDim.new(0, 4)
Converted["_UIPadding41"].PaddingLeft = UDim.new(0, 4)
Converted["_UIPadding41"].PaddingRight = UDim.new(0, 4)
Converted["_UIPadding41"].PaddingTop = UDim.new(0, 3)
Converted["_UIPadding41"].Parent = Converted["_OffSale"]
Converted["_UICorner49"].CornerRadius = UDim.new(0, 6)
Converted["_UICorner49"].Parent = Converted["_OffSale"]
Converted["_UIFlexItem14"].FlexMode = Enum.UIFlexMode.Grow
Converted["_UIFlexItem14"].Parent = Converted["_Buttons"]
Converted["_UIListLayout28"].Padding = UDim.new(0, 8)
Converted["_UIListLayout28"].FillDirection = Enum.FillDirection.Horizontal
Converted["_UIListLayout28"].HorizontalAlignment = Enum.HorizontalAlignment.Right
Converted["_UIListLayout28"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIListLayout28"].VerticalAlignment = Enum.VerticalAlignment.Center
Converted["_UIListLayout28"].Parent = Converted["_Buttons"]
Converted["_Title"].Font = Enum.Font.GothamBold
Converted["_Title"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Title"].TextSize = 14
Converted["_Title"].TextWrapped = true
Converted["_Title"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_Title"].AutomaticSize = Enum.AutomaticSize.Y
Converted["_Title"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Title"].BackgroundTransparency = 1
Converted["_Title"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Title"].BorderSizePixel = 0
Converted["_Title"].Size = UDim2.new(1, 0, 0, 15)
Converted["_Title"].Name = "Title"
Converted["_Title"].Parent = Converted["_Details"]
Converted["_UIListLayout29"].Padding = UDim.new(0, 4)
Converted["_UIListLayout29"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIListLayout29"].Parent = Converted["_Details"]
Converted["_UIFlexItem15"].FlexMode = Enum.UIFlexMode.Grow
Converted["_UIFlexItem15"].Parent = Converted["_Details"]
Converted["_Thumbnail"].Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
-- Converted["_Thumbnail"].ImageContent = Content
Converted["_Thumbnail"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Thumbnail"].BackgroundTransparency = 1
Converted["_Thumbnail"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Thumbnail"].BorderSizePixel = 0
Converted["_Thumbnail"].LayoutOrder = -1
Converted["_Thumbnail"].Size = UDim2.new(0, 0, 1, 0)
Converted["_Thumbnail"].Name = "Thumbnail"
Converted["_Thumbnail"].Parent = Converted["_Clickable1"]
Converted["_UIStroke15"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Converted["_UIStroke15"].Color = Color3.fromRGB(179.000004529953, 179.000004529953, 179.000004529953)
Converted["_UIStroke15"].Parent = Converted["_Thumbnail"]
Converted["_UIAspectRatioConstraint5"].Parent = Converted["_Thumbnail"]
Converted["_UICorner50"].CornerRadius = UDim.new(0, 12)
Converted["_UICorner50"].Parent = Converted["_Thumbnail"]
Converted["_UIFlexItem16"].FlexMode = Enum.UIFlexMode.Grow
Converted["_UIFlexItem16"].Parent = Converted["_Thumbnail"]
Converted["_UIListLayout30"].Padding = UDim.new(0, 8)
Converted["_UIListLayout30"].FillDirection = Enum.FillDirection.Horizontal
Converted["_UIListLayout30"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIListLayout30"].Parent = Converted["_Clickable1"]
Converted["_UIStroke16"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Converted["_UIStroke16"].Color = Color3.fromRGB(179.000004529953, 179.000004529953, 179.000004529953)
Converted["_UIStroke16"].Thickness = 2.299999952316284
Converted["_UIStroke16"].Parent = Converted["_Clickable1"]
Converted["_CustomEffect"].Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 111.00000098347664, 224.000001847744)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(160.00000566244125, 219.0000021457672, 255))
}
Converted["_CustomEffect"].Enabled = false
Converted["_CustomEffect"].Rotation = -37
Converted["_CustomEffect"].Name = "CustomEffect"
Converted["_CustomEffect"].Parent = Converted["_UIStroke16"]
Converted["_UICorner51"].CornerRadius = UDim.new(0, 16)
Converted["_UICorner51"].Parent = Converted["_Clickable1"]
Converted["_OffSaleEffect"].Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
	ColorSequenceKeypoint.new(0.49653980135917664, Color3.fromRGB(255, 255, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))
}
Converted["_OffSaleEffect"].Enabled = false
Converted["_OffSaleEffect"].Name = "OffSaleEffect"
Converted["_OffSaleEffect"].Parent = Converted["_Clickable1"]
Converted["_UIScale11"].Parent = Converted["_Area"]
Converted["_Tip1"].Font = Enum.Font.GothamBold
Converted["_Tip1"].RichText = true
Converted["_Tip1"].Text = "ALL UGC EMOTES                           FE                           MANY FEATURES"
Converted["_Tip1"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Tip1"].TextScaled = true
Converted["_Tip1"].TextSize = 14
Converted["_Tip1"].TextTransparency = 1
Converted["_Tip1"].TextWrapped = true
Converted["_Tip1"].AnchorPoint = Vector2.new(0.5, 1)
Converted["_Tip1"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Tip1"].BackgroundTransparency = 1
Converted["_Tip1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Tip1"].BorderSizePixel = 0
Converted["_Tip1"].Position = UDim2.new(0.5, 0, 1, -20)
Converted["_Tip1"].Size = UDim2.new(0, 600, 0, 10)
Converted["_Tip1"].Name = "Tip"
Converted["_Tip1"].Parent = Converted["_Menu"]
Converted["_MenuStateChange"].Name = "MenuStateChange"
Converted["_MenuStateChange"].Parent = Converted["_Menu"]
Converted["_MenuSpringTakeover"].Name = "MenuSpringTakeover"
Converted["_MenuSpringTakeover"].Parent = Converted["_Menu"]
Converted["_ItemDetail"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_ItemDetail"].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Converted["_ItemDetail"].BackgroundTransparency = 0.6499999761581421
Converted["_ItemDetail"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_ItemDetail"].BorderSizePixel = 0
Converted["_ItemDetail"].ClipsDescendants = true
Converted["_ItemDetail"].Position = UDim2.new(0.5, 0, 0.5, 0)
Converted["_ItemDetail"].Size = UDim2.new(0, 400, 0, 350)
Converted["_ItemDetail"].Visible = false
Converted["_ItemDetail"].ZIndex = 100
Converted["_ItemDetail"].Name = "ItemDetail"
Converted["_ItemDetail"].Parent = Converted["_Menu"]
Converted["_UIStroke17"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Converted["_UIStroke17"].Color = Color3.fromRGB(179.000004529953, 179.000004529953, 179.000004529953)
Converted["_UIStroke17"].Thickness = 2.299999952316284
Converted["_UIStroke17"].Parent = Converted["_ItemDetail"]
Converted["_CustomEffect1"].Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 111.00000098347664, 224.000001847744)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(160.00000566244125, 219.0000021457672, 255))
}
Converted["_CustomEffect1"].Enabled = false
Converted["_CustomEffect1"].Rotation = -37
Converted["_CustomEffect1"].Name = "CustomEffect"
Converted["_CustomEffect1"].Parent = Converted["_UIStroke17"]
Converted["_UICorner52"].CornerRadius = UDim.new(0, 16)
Converted["_UICorner52"].Parent = Converted["_ItemDetail"]
Converted["_UIListLayout31"].Padding = UDim.new(0, 8)
Converted["_UIListLayout31"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIListLayout31"].Parent = Converted["_ItemDetail"]
Converted["_UIPadding42"].PaddingBottom = UDim.new(0, 8)
Converted["_UIPadding42"].PaddingLeft = UDim.new(0, 8)
Converted["_UIPadding42"].PaddingRight = UDim.new(0, 8)
Converted["_UIPadding42"].PaddingTop = UDim.new(0, 8)
Converted["_UIPadding42"].Parent = Converted["_ItemDetail"]
Converted["_Item"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Item"].BackgroundTransparency = 1
Converted["_Item"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Item"].BorderSizePixel = 0
Converted["_Item"].Size = UDim2.new(1, 0, 0, 0)
Converted["_Item"].Name = "Item"
Converted["_Item"].Parent = Converted["_ItemDetail"]
Converted["_UIFlexItem17"].FlexMode = Enum.UIFlexMode.Grow
Converted["_UIFlexItem17"].Parent = Converted["_Item"]
Converted["_AvatarPreview"].Ambient = Color3.fromRGB(227.00001686811447, 227.00001686811447, 227.00001686811447)
Converted["_AvatarPreview"].LightColor = Color3.fromRGB(107.00000882148743, 146.00000649690628, 255)
Converted["_AvatarPreview"].LightDirection = Vector3.new(0.5, -0.5, -0.5)
Converted["_AvatarPreview"].AnchorPoint = Vector2.new(1, 0)
Converted["_AvatarPreview"].BackgroundColor3 = Color3.fromRGB(25.000002309679985, 25.000002309679985, 25.000002309679985)
Converted["_AvatarPreview"].BackgroundTransparency = 0.10000000149011612
Converted["_AvatarPreview"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_AvatarPreview"].BorderSizePixel = 0
Converted["_AvatarPreview"].Position = UDim2.new(1, -20, 0, 20)
Converted["_AvatarPreview"].Size = UDim2.new(1, 0, 0, 0)
Converted["_AvatarPreview"].Name = "AvatarPreview"
Converted["_AvatarPreview"].Parent = Converted["_Item"]
Converted["_UIStroke18"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Converted["_UIStroke18"].Color = Color3.fromRGB(179.000004529953, 179.000004529953, 179.000004529953)
Converted["_UIStroke18"].Thickness = 2.299999952316284
Converted["_UIStroke18"].Parent = Converted["_AvatarPreview"]
Converted["_UICorner53"].CornerRadius = UDim.new(0, 16)
Converted["_UICorner53"].Parent = Converted["_AvatarPreview"]
Converted["_PlayEmote"].Name = "PlayEmote"
Converted["_PlayEmote"].Parent = Converted["_AvatarPreview"]
Converted["_WorldModel"].Parent = Converted["_AvatarPreview"]
Converted["_Drag"].Font = Enum.Font.SourceSans
Converted["_Drag"].Text = ""
Converted["_Drag"].TextColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Drag"].TextSize = 14
Converted["_Drag"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Drag"].BackgroundTransparency = 1
Converted["_Drag"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Drag"].BorderSizePixel = 0
Converted["_Drag"].Size = UDim2.new(1, 0, 1, 0)
Converted["_Drag"].Name = "Drag"
Converted["_Drag"].Parent = Converted["_AvatarPreview"]
Converted["_UIFlexItem18"].FlexMode = Enum.UIFlexMode.Custom
Converted["_UIFlexItem18"].GrowRatio = 1
Converted["_UIFlexItem18"].Parent = Converted["_AvatarPreview"]
Converted["_UIListLayout32"].Padding = UDim.new(0, 8)
Converted["_UIListLayout32"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIListLayout32"].Parent = Converted["_Item"]
Converted["_Details1"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Details1"].BackgroundTransparency = 1
Converted["_Details1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Details1"].BorderSizePixel = 0
Converted["_Details1"].Size = UDim2.new(1, 0, 0, 0)
Converted["_Details1"].Name = "Details"
Converted["_Details1"].Parent = Converted["_Item"]
Converted["_UIListLayout33"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIListLayout33"].Parent = Converted["_Details1"]
Converted["_ItemName"].Font = Enum.Font.GothamBold
Converted["_ItemName"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_ItemName"].TextSize = 20
Converted["_ItemName"].TextWrapped = true
Converted["_ItemName"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_ItemName"].AutomaticSize = Enum.AutomaticSize.Y
Converted["_ItemName"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_ItemName"].BackgroundTransparency = 1
Converted["_ItemName"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_ItemName"].BorderSizePixel = 0
Converted["_ItemName"].Size = UDim2.new(1, 0, 0, 20)
Converted["_ItemName"].Name = "ItemName"
Converted["_ItemName"].Parent = Converted["_Details1"]
Converted["_ItemDescription"].Font = Enum.Font.Gotham
Converted["_ItemDescription"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_ItemDescription"].TextSize = 16
Converted["_ItemDescription"].TextTransparency = 0.49000000953674316
Converted["_ItemDescription"].TextTruncate = Enum.TextTruncate.AtEnd
Converted["_ItemDescription"].TextWrapped = true
Converted["_ItemDescription"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_ItemDescription"].AutomaticSize = Enum.AutomaticSize.Y
Converted["_ItemDescription"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_ItemDescription"].BackgroundTransparency = 1
Converted["_ItemDescription"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_ItemDescription"].BorderSizePixel = 0
Converted["_ItemDescription"].Size = UDim2.new(1, 0, 0, 20)
Converted["_ItemDescription"].Name = "ItemDescription"
Converted["_ItemDescription"].Parent = Converted["_Details1"]
Converted["_UIFlexItem19"].FlexMode = Enum.UIFlexMode.Custom
Converted["_UIFlexItem19"].GrowRatio = 0.6000000238418579
Converted["_UIFlexItem19"].Parent = Converted["_Details1"]
Converted["_Actions"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Actions"].BackgroundTransparency = 1
Converted["_Actions"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Actions"].BorderSizePixel = 0
Converted["_Actions"].Size = UDim2.new(1, 0, 0, 20)
Converted["_Actions"].SelectionGroup = true
Converted["_Actions"].Name = "Actions"
Converted["_Actions"].Parent = Converted["_ItemDetail"]
Converted["_UIListLayout34"].Padding = UDim.new(0, 6)
Converted["_UIListLayout34"].FillDirection = Enum.FillDirection.Horizontal
Converted["_UIListLayout34"].HorizontalAlignment = Enum.HorizontalAlignment.Right
Converted["_UIListLayout34"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIListLayout34"].Parent = Converted["_Actions"]
Converted["_Favorites1"].Font = Enum.Font.Gotham
Converted["_Favorites1"].Text = "FAVORITE"
Converted["_Favorites1"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Favorites1"].TextSize = 12
Converted["_Favorites1"].AutomaticSize = Enum.AutomaticSize.X
Converted["_Favorites1"].BackgroundColor3 = Color3.fromRGB(46.000001057982445, 46.000001057982445, 46.000001057982445)
Converted["_Favorites1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Favorites1"].BorderSizePixel = 0
Converted["_Favorites1"].LayoutOrder = 2
Converted["_Favorites1"].Size = UDim2.new(0, 0, 1, 0)
Converted["_Favorites1"].Name = "Favorites"
Converted["_Favorites1"].Parent = Converted["_Actions"]
Converted["_UICorner54"].CornerRadius = UDim.new(0, 16)
Converted["_UICorner54"].Parent = Converted["_Favorites1"]
Converted["_UIPadding43"].PaddingBottom = UDim.new(0, 9)
Converted["_UIPadding43"].PaddingLeft = UDim.new(0, 9)
Converted["_UIPadding43"].PaddingRight = UDim.new(0, 9)
Converted["_UIPadding43"].PaddingTop = UDim.new(0, 9)
Converted["_UIPadding43"].Parent = Converted["_Favorites1"]
Converted["_UIStroke19"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Converted["_UIStroke19"].Color = Color3.fromRGB(179.000004529953, 179.000004529953, 179.000004529953)
Converted["_UIStroke19"].Thickness = 1.600000023841858
Converted["_UIStroke19"].Parent = Converted["_Favorites1"]
Converted["_Play1"].Font = Enum.Font.Gotham
Converted["_Play1"].Text = "PLAY"
Converted["_Play1"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Play1"].TextSize = 12
Converted["_Play1"].TextWrapped = true
Converted["_Play1"].AutomaticSize = Enum.AutomaticSize.X
Converted["_Play1"].BackgroundColor3 = Color3.fromRGB(46.000001057982445, 46.000001057982445, 46.000001057982445)
Converted["_Play1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Play1"].BorderSizePixel = 0
Converted["_Play1"].LayoutOrder = 3
Converted["_Play1"].Size = UDim2.new(0, 0, 1, 0)
Converted["_Play1"].Name = "Play"
Converted["_Play1"].Parent = Converted["_Actions"]
Converted["_UICorner55"].CornerRadius = UDim.new(0, 16)
Converted["_UICorner55"].Parent = Converted["_Play1"]
Converted["_UIPadding44"].PaddingBottom = UDim.new(0, 9)
Converted["_UIPadding44"].PaddingLeft = UDim.new(0, 7)
Converted["_UIPadding44"].PaddingRight = UDim.new(0, 7)
Converted["_UIPadding44"].PaddingTop = UDim.new(0, 9)
Converted["_UIPadding44"].Parent = Converted["_Play1"]
Converted["_UIStroke20"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Converted["_UIStroke20"].Color = Color3.fromRGB(179.000004529953, 179.000004529953, 179.000004529953)
Converted["_UIStroke20"].Thickness = 1.600000023841858
Converted["_UIStroke20"].Parent = Converted["_Play1"]
Converted["_Spacer1"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Spacer1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Spacer1"].BorderSizePixel = 0
Converted["_Spacer1"].LayoutOrder = -99
Converted["_Spacer1"].Name = "Spacer"
Converted["_Spacer1"].Parent = Converted["_Actions"]
Converted["_UIFlexItem20"].FlexMode = Enum.UIFlexMode.Grow
Converted["_UIFlexItem20"].Parent = Converted["_Spacer1"]
Converted["_Close"].Font = Enum.Font.Gotham
Converted["_Close"].Text = "CLOSE"
Converted["_Close"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Close"].TextSize = 12
Converted["_Close"].TextWrapped = true
Converted["_Close"].AutomaticSize = Enum.AutomaticSize.X
Converted["_Close"].BackgroundColor3 = Color3.fromRGB(46.000001057982445, 0, 0)
Converted["_Close"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Close"].BorderSizePixel = 0
Converted["_Close"].LayoutOrder = -100
Converted["_Close"].Size = UDim2.new(0, 0, 1, 0)
Converted["_Close"].Name = "Close"
Converted["_Close"].Parent = Converted["_Actions"]
Converted["_UICorner56"].CornerRadius = UDim.new(0, 16)
Converted["_UICorner56"].Parent = Converted["_Close"]
Converted["_UIPadding45"].PaddingBottom = UDim.new(0, 9)
Converted["_UIPadding45"].PaddingLeft = UDim.new(0, 7)
Converted["_UIPadding45"].PaddingRight = UDim.new(0, 7)
Converted["_UIPadding45"].PaddingTop = UDim.new(0, 9)
Converted["_UIPadding45"].Parent = Converted["_Close"]
Converted["_UIStroke21"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Converted["_UIStroke21"].Color = Color3.fromRGB(179.000004529953, 0, 0)
Converted["_UIStroke21"].Thickness = 1.600000023841858
Converted["_UIStroke21"].Parent = Converted["_Close"]
Converted["_CopyAnimID"].Font = Enum.Font.Gotham
Converted["_CopyAnimID"].Text = "COPY ANIM. ID"
Converted["_CopyAnimID"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_CopyAnimID"].TextSize = 12
Converted["_CopyAnimID"].TextWrapped = true
Converted["_CopyAnimID"].AutomaticSize = Enum.AutomaticSize.X
Converted["_CopyAnimID"].BackgroundColor3 = Color3.fromRGB(46.000001057982445, 46.000001057982445, 46.000001057982445)
Converted["_CopyAnimID"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_CopyAnimID"].BorderSizePixel = 0
Converted["_CopyAnimID"].Size = UDim2.new(0, 0, 1, 0)
Converted["_CopyAnimID"].Name = "CopyAnimID"
Converted["_CopyAnimID"].Parent = Converted["_Actions"]
Converted["_UICorner57"].CornerRadius = UDim.new(0, 16)
Converted["_UICorner57"].Parent = Converted["_CopyAnimID"]
Converted["_UIPadding46"].PaddingBottom = UDim.new(0, 9)
Converted["_UIPadding46"].PaddingLeft = UDim.new(0, 9)
Converted["_UIPadding46"].PaddingRight = UDim.new(0, 9)
Converted["_UIPadding46"].PaddingTop = UDim.new(0, 9)
Converted["_UIPadding46"].Parent = Converted["_CopyAnimID"]
Converted["_UIStroke22"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Converted["_UIStroke22"].Color = Color3.fromRGB(179.000004529953, 179.000004529953, 179.000004529953)
Converted["_UIStroke22"].Thickness = 1.600000023841858
Converted["_UIStroke22"].Parent = Converted["_CopyAnimID"]
Converted["_FloatingButton"].Font = Enum.Font.Gotham
Converted["_FloatingButton"].Text = "FLOATING B."
Converted["_FloatingButton"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_FloatingButton"].TextSize = 12
Converted["_FloatingButton"].TextWrapped = true
Converted["_FloatingButton"].AutomaticSize = Enum.AutomaticSize.X
Converted["_FloatingButton"].BackgroundColor3 = Color3.fromRGB(46.000001057982445, 46.000001057982445, 46.000001057982445)
Converted["_FloatingButton"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_FloatingButton"].BorderSizePixel = 0
Converted["_FloatingButton"].LayoutOrder = 1
Converted["_FloatingButton"].Size = UDim2.new(0, 0, 1, 0)
Converted["_FloatingButton"].Name = "FloatingButton"
Converted["_FloatingButton"].Parent = Converted["_Actions"]
Converted["_UICorner58"].CornerRadius = UDim.new(0, 16)
Converted["_UICorner58"].Parent = Converted["_FloatingButton"]
Converted["_UIPadding47"].PaddingBottom = UDim.new(0, 9)
Converted["_UIPadding47"].PaddingLeft = UDim.new(0, 9)
Converted["_UIPadding47"].PaddingRight = UDim.new(0, 9)
Converted["_UIPadding47"].PaddingTop = UDim.new(0, 9)
Converted["_UIPadding47"].Parent = Converted["_FloatingButton"]
Converted["_UIStroke23"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Converted["_UIStroke23"].Color = Color3.fromRGB(179.000004529953, 179.000004529953, 179.000004529953)
Converted["_UIStroke23"].Thickness = 1.600000023841858
Converted["_UIStroke23"].Parent = Converted["_FloatingButton"]
Converted["_Backdrop"].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Backdrop"].BackgroundTransparency = 1
Converted["_Backdrop"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Backdrop"].BorderSizePixel = 0
Converted["_Backdrop"].Size = UDim2.new(1, 0, 1, 0)
Converted["_Backdrop"].ZIndex = 10
Converted["_Backdrop"].Name = "Backdrop"
Converted["_Backdrop"].Parent = Converted["_Menu"]
Converted["_ShamelessCredit"].Font = Enum.Font.Gotham
Converted["_ShamelessCredit"].Text = ""
Converted["_ShamelessCredit"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_ShamelessCredit"].TextSize = 14
Converted["_ShamelessCredit"].TextTransparency = 0.7400000095367432
Converted["_ShamelessCredit"].TextWrapped = true
Converted["_ShamelessCredit"].TextXAlignment = Enum.TextXAlignment.Right
Converted["_ShamelessCredit"].AnchorPoint = Vector2.new(1, 0)
Converted["_ShamelessCredit"].AutomaticSize = Enum.AutomaticSize.XY
Converted["_ShamelessCredit"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_ShamelessCredit"].BackgroundTransparency = 1
Converted["_ShamelessCredit"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_ShamelessCredit"].BorderSizePixel = 0
Converted["_ShamelessCredit"].Position = UDim2.new(1, -10, 0, 10)
Converted["_ShamelessCredit"].Name = "ShamelessCredit"
Converted["_ShamelessCredit"].Parent = Converted["_Menu"]
Converted["_QuickSelectorIcon"].Name = "QuickSelectorIcon"
Converted["_QuickSelectorIcon"].Parent = Converted["_Menu"]
Converted["_Modal"].AutomaticSize = Enum.AutomaticSize.Y
Converted["_Modal"].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Modal"].BackgroundTransparency = 1
Converted["_Modal"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Modal"].BorderSizePixel = 0
Converted["_Modal"].Size = UDim2.new(1, 0, 1, 0)
Converted["_Modal"].ZIndex = 10
Converted["_Modal"].Name = "Modal"
Converted["_Modal"].Parent = Converted["_AFEMMax"]
Converted["_Container"].GroupTransparency = 1
Converted["_Container"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Container"].AutomaticSize = Enum.AutomaticSize.Y
Converted["_Container"].BackgroundColor3 = Color3.fromRGB(59.00000408291817, 59.00000408291817, 59.00000408291817)
Converted["_Container"].BackgroundTransparency = 0.25
Converted["_Container"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Container"].BorderSizePixel = 0
Converted["_Container"].Interactable = false
Converted["_Container"].Position = UDim2.new(0.5, 0, 0.5, 0)
Converted["_Container"].Size = UDim2.new(0, 300, 0, 200)
Converted["_Container"].Name = "Container"
Converted["_Container"].Parent = Converted["_Modal"]
Converted["_UICorner59"].CornerRadius = UDim.new(0, 16)
Converted["_UICorner59"].Parent = Converted["_Container"]
Converted["_UIStroke24"].Color = Color3.fromRGB(255, 255, 255)
Converted["_UIStroke24"].Parent = Converted["_Container"]
Converted["_UIListLayout35"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIListLayout35"].Parent = Converted["_Container"]
Converted["_Visual"].AutomaticSize = Enum.AutomaticSize.Y
Converted["_Visual"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Visual"].BackgroundTransparency = 1
Converted["_Visual"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Visual"].BorderSizePixel = 0
Converted["_Visual"].Size = UDim2.new(1, 0, 0, 0)
Converted["_Visual"].Name = "Visual"
Converted["_Visual"].Parent = Converted["_Container"]
Converted["_Desc"].Font = Enum.Font.Gotham
Converted["_Desc"].RichText = true
Converted["_Desc"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Desc"].TextSize = 20
Converted["_Desc"].TextWrapped = true
Converted["_Desc"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_Desc"].TextYAlignment = Enum.TextYAlignment.Top
Converted["_Desc"].AutomaticSize = Enum.AutomaticSize.Y
Converted["_Desc"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Desc"].BackgroundTransparency = 1
Converted["_Desc"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Desc"].BorderSizePixel = 0
Converted["_Desc"].Size = UDim2.new(1, 0, 0, 0)
Converted["_Desc"].Name = "Desc"
Converted["_Desc"].Parent = Converted["_Visual"]
Converted["_UIFlexItem21"].FlexMode = Enum.UIFlexMode.Grow
Converted["_UIFlexItem21"].Parent = Converted["_Desc"]
Converted["_Title1"].Font = Enum.Font.GothamBold
Converted["_Title1"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Title1"].TextScaled = true
Converted["_Title1"].TextSize = 14
Converted["_Title1"].TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Title1"].TextWrapped = true
Converted["_Title1"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_Title1"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Title1"].BackgroundTransparency = 1
Converted["_Title1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Title1"].BorderSizePixel = 0
Converted["_Title1"].LayoutOrder = -10
Converted["_Title1"].Size = UDim2.new(1, 0, 0, 20)
Converted["_Title1"].Name = "Title"
Converted["_Title1"].Parent = Converted["_Visual"]
Converted["_UIPadding48"].PaddingBottom = UDim.new(0, 16)
Converted["_UIPadding48"].PaddingLeft = UDim.new(0, 16)
Converted["_UIPadding48"].PaddingRight = UDim.new(0, 16)
Converted["_UIPadding48"].PaddingTop = UDim.new(0, 16)
Converted["_UIPadding48"].Parent = Converted["_Visual"]
Converted["_UIListLayout36"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIListLayout36"].Parent = Converted["_Visual"]
Converted["_UIFlexItem22"].FlexMode = Enum.UIFlexMode.Grow
Converted["_UIFlexItem22"].Parent = Converted["_Visual"]
Converted["_Buttons1"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Buttons1"].BackgroundTransparency = 0.8999999761581421
Converted["_Buttons1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Buttons1"].BorderSizePixel = 0
Converted["_Buttons1"].LayoutOrder = 2
Converted["_Buttons1"].Size = UDim2.new(1, 0, 0, 50)
Converted["_Buttons1"].Name = "Buttons"
Converted["_Buttons1"].Parent = Converted["_Container"]
Converted["_UIListLayout37"].Padding = UDim.new(0, 8)
Converted["_UIListLayout37"].FillDirection = Enum.FillDirection.Horizontal
Converted["_UIListLayout37"].HorizontalAlignment = Enum.HorizontalAlignment.Center
Converted["_UIListLayout37"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIListLayout37"].VerticalAlignment = Enum.VerticalAlignment.Center
Converted["_UIListLayout37"].Parent = Converted["_Buttons1"]
Converted["_Sample1"].Font = Enum.Font.Gotham
Converted["_Sample1"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Sample1"].TextScaled = true
Converted["_Sample1"].TextSize = 14
Converted["_Sample1"].TextWrapped = true
Converted["_Sample1"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Sample1"].BackgroundTransparency = 0.8999999761581421
Converted["_Sample1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Sample1"].BorderSizePixel = 0
Converted["_Sample1"].Size = UDim2.new(0, 0, 1, 0)
Converted["_Sample1"].Visible = false
Converted["_Sample1"].Name = "Sample"
Converted["_Sample1"].Parent = Converted["_Buttons1"]
Converted["_UICorner60"].Parent = Converted["_Sample1"]
Converted["_UIPadding49"].PaddingBottom = UDim.new(0, 7)
Converted["_UIPadding49"].PaddingLeft = UDim.new(0, 7)
Converted["_UIPadding49"].PaddingRight = UDim.new(0, 7)
Converted["_UIPadding49"].PaddingTop = UDim.new(0, 7)
Converted["_UIPadding49"].Parent = Converted["_Sample1"]
Converted["_UIFlexItem23"].FlexMode = Enum.UIFlexMode.Grow
Converted["_UIFlexItem23"].Parent = Converted["_Sample1"]
Converted["_UIPadding50"].PaddingBottom = UDim.new(0, 8)
Converted["_UIPadding50"].PaddingLeft = UDim.new(0, 8)
Converted["_UIPadding50"].PaddingRight = UDim.new(0, 8)
Converted["_UIPadding50"].PaddingTop = UDim.new(0, 8)
Converted["_UIPadding50"].Parent = Converted["_Buttons1"]
Converted["_UIScale12"].Scale = 1.100000023841858
Converted["_UIScale12"].Parent = Converted["_Container"]
Converted["_Input"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Input"].BackgroundTransparency = 1
Converted["_Input"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Input"].BorderSizePixel = 0
Converted["_Input"].Size = UDim2.new(1, 0, 0, 50)
Converted["_Input"].Visible = false
Converted["_Input"].Name = "Input"
Converted["_Input"].Parent = Converted["_Container"]
Converted["_TextBox"].ClearTextOnFocus = false
Converted["_TextBox"].Font = Enum.Font.Gotham
Converted["_TextBox"].PlaceholderText = "Input..."
Converted["_TextBox"].Text = ""
Converted["_TextBox"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextBox"].TextScaled = true
Converted["_TextBox"].TextSize = 14
Converted["_TextBox"].TextWrapped = true
Converted["_TextBox"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_TextBox"].BackgroundColor3 = Color3.fromRGB(46.000001057982445, 46.000001057982445, 46.000001057982445)
Converted["_TextBox"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextBox"].BorderSizePixel = 0
Converted["_TextBox"].Size = UDim2.new(1, 0, 1, 0)
Converted["_TextBox"].Parent = Converted["_Input"]
Converted["_UICorner61"].Parent = Converted["_TextBox"]
Converted["_UIPadding51"].PaddingBottom = UDim.new(0, 7)
Converted["_UIPadding51"].PaddingLeft = UDim.new(0, 16)
Converted["_UIPadding51"].PaddingRight = UDim.new(0, 16)
Converted["_UIPadding51"].PaddingTop = UDim.new(0, 7)
Converted["_UIPadding51"].Parent = Converted["_TextBox"]
Converted["_UIStroke25"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Converted["_UIStroke25"].Color = Color3.fromRGB(255, 255, 255)
Converted["_UIStroke25"].Thickness = 0.800000011920929
Converted["_UIStroke25"].Parent = Converted["_TextBox"]
Converted["_UIPadding52"].PaddingBottom = UDim.new(0, 8)
Converted["_UIPadding52"].PaddingLeft = UDim.new(0, 8)
Converted["_UIPadding52"].PaddingRight = UDim.new(0, 8)
Converted["_UIPadding52"].PaddingTop = UDim.new(0, 8)
Converted["_UIPadding52"].Parent = Converted["_Input"]
Converted["_GrabArea"].Font = Enum.Font.SourceSans
Converted["_GrabArea"].Text = ""
Converted["_GrabArea"].TextColor3 = Color3.fromRGB(0, 0, 0)
Converted["_GrabArea"].TextSize = 14
Converted["_GrabArea"].AnchorPoint = Vector2.new(0.5, 0)
Converted["_GrabArea"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_GrabArea"].BackgroundTransparency = 1
Converted["_GrabArea"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_GrabArea"].BorderSizePixel = 0
Converted["_GrabArea"].Position = UDim2.new(0.5, 0, 0, 0)
Converted["_GrabArea"].Size = UDim2.new(0, 200, 0, 65)
Converted["_GrabArea"].Name = "GrabArea"
Converted["_GrabArea"].Parent = Converted["_AFEMMax"]
Converted["_Open1"].Font = Enum.Font.SourceSans
Converted["_Open1"].Text = ""
Converted["_Open1"].TextColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Open1"].TextSize = 14
Converted["_Open1"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Open1"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Open1"].BackgroundTransparency = 1
Converted["_Open1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Open1"].BorderSizePixel = 0
Converted["_Open1"].Interactable = false
Converted["_Open1"].Position = UDim2.new(0.5, 0, 0.5, 0)
Converted["_Open1"].Size = UDim2.new(0, 70, 0, 70)
Converted["_Open1"].ZIndex = 99
Converted["_Open1"].Name = "Open"
Converted["_Open1"].Parent = Converted["_AFEMMax"]
Converted["_Notifications"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Notifications"].BackgroundTransparency = 1
Converted["_Notifications"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Notifications"].BorderSizePixel = 0
Converted["_Notifications"].Size = UDim2.new(1, 0, 1, 0)
Converted["_Notifications"].Name = "Notifications"
Converted["_Notifications"].Parent = Converted["_AFEMMax"]
Converted["_UIListLayout38"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIListLayout38"].VerticalAlignment = Enum.VerticalAlignment.Bottom
Converted["_UIListLayout38"].Parent = Converted["_Notifications"]
Converted["_NotificationContainer"].AnchorPoint = Vector2.new(0, 1)
Converted["_NotificationContainer"].AutomaticSize = Enum.AutomaticSize.X
Converted["_NotificationContainer"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_NotificationContainer"].BackgroundTransparency = 1
Converted["_NotificationContainer"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_NotificationContainer"].BorderSizePixel = 0
Converted["_NotificationContainer"].Visible = false
Converted["_NotificationContainer"].Name = "NotificationContainer"
Converted["_NotificationContainer"].Parent = Converted["_Notifications"]
Converted["_Frame"].AnchorPoint = Vector2.new(0, 1)
Converted["_Frame"].AutomaticSize = Enum.AutomaticSize.XY
Converted["_Frame"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Frame"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Frame"].BorderSizePixel = 0
Converted["_Frame"].Position = UDim2.new(-1.5, 0, 1, 0)
Converted["_Frame"].Size = UDim2.new(0, 200, 0, 100)
Converted["_Frame"].Parent = Converted["_NotificationContainer"]
Converted["_UICorner62"].CornerRadius = UDim.new(0, 16)
Converted["_UICorner62"].Parent = Converted["_Frame"]
Converted["_UIGradient4"].Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
}
Converted["_UIGradient4"].Rotation = -90
Converted["_UIGradient4"].Transparency = NumberSequence.new{
	NumberSequenceKeypoint.new(0, 0.45625001192092896),
	NumberSequenceKeypoint.new(1, 1)
}
Converted["_UIGradient4"].Parent = Converted["_Frame"]
Converted["_UIStroke26"].Color = Color3.fromRGB(255, 255, 255)
Converted["_UIStroke26"].Thickness = 1.600000023841858
Converted["_UIStroke26"].Parent = Converted["_Frame"]
Converted["_UIPadding53"].PaddingBottom = UDim.new(0, 10)
Converted["_UIPadding53"].PaddingLeft = UDim.new(0, 12)
Converted["_UIPadding53"].PaddingRight = UDim.new(0, 12)
Converted["_UIPadding53"].PaddingTop = UDim.new(0, 10)
Converted["_UIPadding53"].Parent = Converted["_Frame"]
Converted["_UIListLayout39"].Padding = UDim.new(0, 6)
Converted["_UIListLayout39"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIListLayout39"].Parent = Converted["_Frame"]
Converted["_Title2"].Font = Enum.Font.GothamBold
Converted["_Title2"].Text = "Notification"
Converted["_Title2"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Title2"].TextSize = 20
Converted["_Title2"].TextWrapped = true
Converted["_Title2"].AutomaticSize = Enum.AutomaticSize.XY
Converted["_Title2"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Title2"].BackgroundTransparency = 1
Converted["_Title2"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Title2"].BorderSizePixel = 0
Converted["_Title2"].Name = "Title"
Converted["_Title2"].Parent = Converted["_Frame"]
Converted["_Body"].Font = Enum.Font.Gotham
Converted["_Body"].Text = "Notification bodyNotification bodyNotification bodyNotification bodyNotification bodyNotification bodyNotification bodyNotification bodyNotification bodyNotification bodyNotification bodyNotification bodyNotification bodyNotification bodyNotification bodyNotification bodyNotification bodyNotification bodyNotification bodyNotification bodyNotification bodyNotification bodyNotification bodyNotification bodyNotification bodyNotification bodyNotification body"
Converted["_Body"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Body"].TextSize = 12
Converted["_Body"].TextWrapped = true
Converted["_Body"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_Body"].AutomaticSize = Enum.AutomaticSize.Y
Converted["_Body"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Body"].BackgroundTransparency = 1
Converted["_Body"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Body"].BorderSizePixel = 0
Converted["_Body"].Size = UDim2.new(0, 250, 0, 0)
Converted["_Body"].Name = "Body"
Converted["_Body"].Parent = Converted["_Frame"]
Converted["_UIPadding54"].Parent = Converted["_NotificationContainer"]
Converted["_UIPadding55"].PaddingBottom = UDim.new(0, 16)
Converted["_UIPadding55"].PaddingLeft = UDim.new(0, 16)
Converted["_UIPadding55"].PaddingRight = UDim.new(0, 16)
Converted["_UIPadding55"].PaddingTop = UDim.new(0, 16)
Converted["_UIPadding55"].Parent = Converted["_Notifications"]
Converted["_FloatingButtons"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_FloatingButtons"].BackgroundTransparency = 1
Converted["_FloatingButtons"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_FloatingButtons"].BorderSizePixel = 0
Converted["_FloatingButtons"].Size = UDim2.new(1, 0, 1, 0)
Converted["_FloatingButtons"].ZIndex = -1
Converted["_FloatingButtons"].Name = "FloatingButtons"
Converted["_FloatingButtons"].Parent = Converted["_AFEMMax"]
Converted["_Sample2"].Font = Enum.Font.Gotham
Converted["_Sample2"].Text = ""
Converted["_Sample2"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Sample2"].TextScaled = true
Converted["_Sample2"].TextSize = 14
Converted["_Sample2"].TextWrapped = true
Converted["_Sample2"].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Sample2"].BackgroundTransparency = 0.6499999761581421
Converted["_Sample2"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Sample2"].BorderSizePixel = 0
Converted["_Sample2"].Size = UDim2.new(0, 200, 0, 50)
Converted["_Sample2"].Visible = false
Converted["_Sample2"].Name = "Sample"
Converted["_Sample2"].Parent = Converted["_FloatingButtons"]
Converted["_UICorner63"].CornerRadius = UDim.new(0, 10)
Converted["_UICorner63"].Parent = Converted["_Sample2"]
Converted["_UIPadding56"].PaddingBottom = UDim.new(0, 3)
Converted["_UIPadding56"].PaddingLeft = UDim.new(0, 3)
Converted["_UIPadding56"].PaddingRight = UDim.new(0, 3)
Converted["_UIPadding56"].PaddingTop = UDim.new(0, 3)
Converted["_UIPadding56"].Parent = Converted["_Sample2"]
Converted["_UIStroke27"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Converted["_UIStroke27"].Color = Color3.fromRGB(255, 255, 255)
Converted["_UIStroke27"].Thickness = 2
Converted["_UIStroke27"].Parent = Converted["_Sample2"]
Converted["_ImageLabel"].Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
-- Converted["_ImageLabel"].ImageContent = Content
Converted["_ImageLabel"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_ImageLabel"].BackgroundTransparency = 1
Converted["_ImageLabel"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_ImageLabel"].BorderSizePixel = 0
Converted["_ImageLabel"].Size = UDim2.new(1, 0, 1, 0)
Converted["_ImageLabel"].Parent = Converted["_Sample2"]
Converted["_UIPadding57"].PaddingBottom = UDim.new(0, 32)
Converted["_UIPadding57"].PaddingLeft = UDim.new(0, 32)
Converted["_UIPadding57"].PaddingRight = UDim.new(0, 32)
Converted["_UIPadding57"].PaddingTop = UDim.new(0, 32)
Converted["_UIPadding57"].Parent = Converted["_FloatingButtons"]
Converted["_Update"].Name = "Update"
Converted["_Update"].Parent = Converted["_FloatingButtons"]
Converted["_UIGridLayout2"].CellPadding = UDim2.new(0, 8, 0, 8)
Converted["_UIGridLayout2"].CellSize = UDim2.new(0, 40, 0, 40)
Converted["_UIGridLayout2"].FillDirectionMaxCells = 5
Converted["_UIGridLayout2"].HorizontalAlignment = Enum.HorizontalAlignment.Right
Converted["_UIGridLayout2"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIGridLayout2"].Parent = Converted["_FloatingButtons"]
Converted["_QuickSelectorFrame"].GroupTransparency = 1
Converted["_QuickSelectorFrame"].AnchorPoint = Vector2.new(0.5, 0)
Converted["_QuickSelectorFrame"].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Converted["_QuickSelectorFrame"].BackgroundTransparency = 0.5
Converted["_QuickSelectorFrame"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_QuickSelectorFrame"].BorderSizePixel = 0
Converted["_QuickSelectorFrame"].Interactable = false
Converted["_QuickSelectorFrame"].Position = UDim2.new(0.5, 0, 0, -160)
Converted["_QuickSelectorFrame"].Size = UDim2.new(1, 0, 0, 150)
Converted["_QuickSelectorFrame"].Name = "QuickSelectorFrame"
Converted["_QuickSelectorFrame"].Parent = Converted["_AFEMMax"]
Converted["_UIStroke28"].Color = Color3.fromRGB(255, 255, 255)
Converted["_UIStroke28"].Thickness = 2.700000047683716
Converted["_UIStroke28"].Parent = Converted["_QuickSelectorFrame"]
Converted["_UIPadding58"].PaddingBottom = UDim.new(0, 16)
Converted["_UIPadding58"].PaddingLeft = UDim.new(0, 8)
Converted["_UIPadding58"].PaddingRight = UDim.new(0, 8)
Converted["_UIPadding58"].PaddingTop = UDim.new(0, 16)
Converted["_UIPadding58"].Parent = Converted["_QuickSelectorFrame"]
Converted["_ScrollingFrame"].AutomaticCanvasSize = Enum.AutomaticSize.X
Converted["_ScrollingFrame"].CanvasSize = UDim2.new(0, 0, 0, 0)
Converted["_ScrollingFrame"].ScrollBarThickness = 0
Converted["_ScrollingFrame"].Active = true
Converted["_ScrollingFrame"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_ScrollingFrame"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_ScrollingFrame"].BackgroundTransparency = 1
Converted["_ScrollingFrame"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_ScrollingFrame"].BorderSizePixel = 0
Converted["_ScrollingFrame"].ClipsDescendants = false
Converted["_ScrollingFrame"].Position = UDim2.new(0.5, 0, 0.5, 0)
Converted["_ScrollingFrame"].Size = UDim2.new(1, 0, 1, 0)
Converted["_ScrollingFrame"].Parent = Converted["_QuickSelectorFrame"]
Converted["_UIListLayout40"].Padding = UDim.new(0, 16)
Converted["_UIListLayout40"].FillDirection = Enum.FillDirection.Horizontal
Converted["_UIListLayout40"].HorizontalAlignment = Enum.HorizontalAlignment.Center
Converted["_UIListLayout40"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIListLayout40"].VerticalAlignment = Enum.VerticalAlignment.Center
Converted["_UIListLayout40"].Parent = Converted["_ScrollingFrame"]
Converted["_Sample3"].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Sample3"].BackgroundTransparency = 0.699999988079071
Converted["_Sample3"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Sample3"].BorderSizePixel = 0
Converted["_Sample3"].Size = UDim2.new(0, 100, 1, 0)
Converted["_Sample3"].Visible = false
Converted["_Sample3"].Name = "Sample"
Converted["_Sample3"].Parent = Converted["_ScrollingFrame"]
Converted["_UIAspectRatioConstraint6"].AspectType = Enum.AspectType.ScaleWithParentSize
Converted["_UIAspectRatioConstraint6"].DominantAxis = Enum.DominantAxis.Height
Converted["_UIAspectRatioConstraint6"].Parent = Converted["_Sample3"]
Converted["_UICorner64"].CornerRadius = UDim.new(0, 16)
Converted["_UICorner64"].Parent = Converted["_Sample3"]
Converted["_UIStroke29"].Color = Color3.fromRGB(255, 255, 255)
Converted["_UIStroke29"].Thickness = 2.700000047683716
Converted["_UIStroke29"].Parent = Converted["_Sample3"]
Converted["_UIPadding59"].PaddingBottom = UDim.new(0, 8)
Converted["_UIPadding59"].PaddingLeft = UDim.new(0, 8)
Converted["_UIPadding59"].PaddingRight = UDim.new(0, 8)
Converted["_UIPadding59"].PaddingTop = UDim.new(0, 8)
Converted["_UIPadding59"].Parent = Converted["_Sample3"]
Converted["_Thumbnail1"].Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
-- Converted["_Thumbnail1"].ImageContent = Content
Converted["_Thumbnail1"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Thumbnail1"].BackgroundTransparency = 1
Converted["_Thumbnail1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Thumbnail1"].BorderSizePixel = 0
Converted["_Thumbnail1"].Size = UDim2.new(1, 0, 1, 0)
Converted["_Thumbnail1"].Name = "Thumbnail"
Converted["_Thumbnail1"].Parent = Converted["_Sample3"]
Converted["_UIScale13"].Parent = Converted["_Sample3"]
Converted["_Tooltip"].GroupTransparency = 1
Converted["_Tooltip"].AnchorPoint = Vector2.new(0.5, 0.7799999713897705)
Converted["_Tooltip"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Tooltip"].BackgroundTransparency = 1
Converted["_Tooltip"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Tooltip"].BorderSizePixel = 0
Converted["_Tooltip"].Size = UDim2.new(0, 150, 0, 102)
Converted["_Tooltip"].Name = "Tooltip"
Converted["_Tooltip"].Parent = Converted["_AFEMMax"]
Converted["_Highlight"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Highlight"].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Highlight"].BackgroundTransparency = 1
Converted["_Highlight"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Highlight"].BorderSizePixel = 0
Converted["_Highlight"].Position = UDim2.new(0.5, 0, 0.810000002, 0)
Converted["_Highlight"].Size = UDim2.new(0, 50, 0, 50)
Converted["_Highlight"].Name = "Highlight"
Converted["_Highlight"].Parent = Converted["_Tooltip"]
Converted["_UIStroke30"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Converted["_UIStroke30"].Color = Color3.fromRGB(255, 255, 255)
Converted["_UIStroke30"].Thickness = 2
Converted["_UIStroke30"].Parent = Converted["_Highlight"]
Converted["_UICorner65"].CornerRadius = UDim.new(0, 16)
Converted["_UICorner65"].Parent = Converted["_Highlight"]
Converted["_UIPadding60"].PaddingBottom = UDim.new(0, 2)
Converted["_UIPadding60"].Parent = Converted["_Tooltip"]
Converted["_Text"].AnchorPoint = Vector2.new(0.5, 0)
Converted["_Text"].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Text"].BackgroundTransparency = 0.6499999761581421
Converted["_Text"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Text"].BorderSizePixel = 0
Converted["_Text"].Position = UDim2.new(0.5, 0, 0, 5)
Converted["_Text"].Size = UDim2.new(1, -20, 0, 50)
Converted["_Text"].Name = "Text"
Converted["_Text"].Parent = Converted["_Tooltip"]
Converted["_UICorner66"].CornerRadius = UDim.new(0, 16)
Converted["_UICorner66"].Parent = Converted["_Text"]
Converted["_UIStroke31"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Converted["_UIStroke31"].Color = Color3.fromRGB(255, 255, 255)
Converted["_UIStroke31"].Parent = Converted["_Text"]
Converted["_TextLabel13"].Font = Enum.Font.Gotham
Converted["_TextLabel13"].RichText = true
Converted["_TextLabel13"].Text = "Text"
Converted["_TextLabel13"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel13"].TextScaled = true
Converted["_TextLabel13"].TextSize = 14
Converted["_TextLabel13"].TextWrapped = true
Converted["_TextLabel13"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel13"].BackgroundTransparency = 1
Converted["_TextLabel13"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextLabel13"].BorderSizePixel = 0
Converted["_TextLabel13"].Size = UDim2.new(1, 0, 1, 0)
Converted["_TextLabel13"].Parent = Converted["_Text"]
Converted["_UIPadding61"].PaddingBottom = UDim.new(0, 8)
Converted["_UIPadding61"].PaddingLeft = UDim.new(0, 8)
Converted["_UIPadding61"].PaddingRight = UDim.new(0, 8)
Converted["_UIPadding61"].PaddingTop = UDim.new(0, 8)
Converted["_UIPadding61"].Parent = Converted["_Text"]
Converted["_UIScale14"].Scale = 1.2000000476837158
Converted["_UIScale14"].Parent = Converted["_Tooltip"]
-- Module Scripts:
local module_scripts = {}
do -- Module: StarterGui.AFEMMax.FUNCTIONS
    local script = Instance.new("ModuleScript")
    script.Name = "FUNCTIONS"
    script.Parent = Converted["_AFEMMax"]
    local function module_script()
		local FUNCTIONSmodule = {}
		
		
		repeat task.wait() until getgenv().AFEMLibraries and getgenv().AFEMLibraries.MKE
		local ts = game:GetService("TweenService") -- so what
		local psv = getgenv().AFEMLibraries.PSV
		local dgb = getgenv().AFEMLibraries.DGB
		local sbt = getgenv().AFEMLibraries.SBT
		local cah = getgenv().AFEMLibraries.CAH
		local mke = getgenv().AFEMLibraries.MKE
		local aig = getgenv().AFEMLibraries.AIG
		local prf = getgenv().AFEMLibraries.PRF
		
		local pointSaveAFEM = psv.new("AFEMMaxConf")
		
		local mainEquippedPack = nil
		local categoryEquippedPacks = {} 
		
		local perf_useScale = true
		if pointSaveAFEM:get("settings_perfAvoidScale") == "1" then
			perf_useScale = false
		end
		
		local pickerProvider = "floating"
		
		local hts = game:GetService("HttpService")
		
		
		function FUNCTIONSmodule.playanim(id)
			local anim
			anim = Instance.new("Animation")
			anim.Name = "AFEMInvokedEmote"
			anim.AnimationId = id
		
		
			local animator = game.Players.LocalPlayer.Character.Humanoid:FindFirstChild("Animator")
			local animate = game.Players.LocalPlayer.Character:FindFirstChild("Animate")
			--for _, tr in pairs(animator:GetPlayingAnimationTracks()) do
			--	tr:Stop(0)
			--end
		
			animate.PlayEmote:Invoke(anim)
		
		
		
		end
		
		
		function FUNCTIONSmodule.pullList()
			--task.wait(5)
			local http = game:GetService("HttpService")
		
		
			local emList
			local packList
		
			local s = pcall(function()
				print("[AFEM] -  Pulling emotes from GitHub...")
				emList = http:JSONDecode(game:HttpGet("https://raw.githubusercontent.com/Joystickplays/AFEM/refs/heads/main/emotes.json"))
			end)
			if not s then
				print("[AFEM] - Getting from website failed. Using fallback...")
				emList = http:JSONDecode('[{"id":14353423348,"animationid":"http://www.roblox.com/asset/?id=14352343065","name":"BabyQueen-BouncyTwirl"},{"id":14353421343,"animationid":"http://www.roblox.com/asset/?id=14352340648","name":"BabyQueen-FaceFrame"},{"id":16553249658,"animationid":"http://www.roblox.com/asset/?id=16553163212","name":"MaeStephens-PianoHands"}]')
			end
			print("[AFEM] - Emote list listed.")
		
			local s = pcall(function()
				print("[AFEM] -  Pulling animation packs from GitHub...")
				packList = http:JSONDecode(game:HttpGet("https://raw.githubusercontent.com/Joystickplays/AFEM/refs/heads/main/animationpacks.json"))
			end)
			if not s then
				print("[AFEM] - Getting from website failed. Using fallback...")
				packList = http:JSONDecode('[{"_comment":"All animation IDs has been pulled independently by the YARHM Team. If you are gonna use this for your own emotes menu, please credit us. We will be updating this list periodically and automatically."},{"Animations":{"idle":{"Animation2":"http://www.roblox.com/asset/?id=10921248831","Animation1":"http://www.roblox.com/asset/?id=10921248039"},"climb":{"ClimbAnim":"http://www.roblox.com/asset/?id=10921247141"},"run":{"RunAnim":"http://www.roblox.com/asset/?id=10921250460"},"swim":{"Swim":"http://www.roblox.com/asset/?id=10921253142"},"swimidle":{"SwimIdle":"http://www.roblox.com/asset/?id=10921253767"},"jump":{"JumpAnim":"http://www.roblox.com/asset/?id=10921252123"},"fall":{"FallAnim":"http://www.roblox.com/asset/?id=10921251156"},"pose":{"RobotPose":"http://www.roblox.com/asset/?id=10921249579"},"walk":{"WalkAnim":"http://www.roblox.com/asset/?id=10921255446"}},"BundleId":82,"Name":"Robot ","ProductId":8429510719773869}]')
			end
			print("[AFEM] - Animation packs listed.")
		
			print("[AFEM] - Finding added custom emotes...")
			if pointSaveAFEM:get("ExtraEmotes") then
				local extraEmotes = http:JSONDecode(pointSaveAFEM:get("ExtraEmotes"), "[]")
		
				table.move(extraEmotes, 1, #extraEmotes, #emList + 1, emList)	
			end
		
		
			getgenv().AFEMListing = {}
		
			getgenv().AFEMListing.Emotes = emList
			getgenv().AFEMListing.AnimationPacks = packList
		end
		
		local itemsel = script.Parent.Menu.Area.ItemSelect
		
		local emotesCurrentPage = 1
		local emoteSearchQuery = ""
		local animPacksCurrentPage = 1
		local itemsPerPage = 21
		
		local function getPagination(list, perPage, currentPage)
			local totalItems = #list
			local totalPages = math.ceil(totalItems / perPage)
			return {
				totalPages = totalPages,
				currentPage = currentPage
			}
		end
		
		function FUNCTIONSmodule.getEmotePagination()
			repeat task.wait() until getgenv().AFEMListing
			local emoteList = getgenv().AFEMListing and getgenv().AFEMListing.Emotes or {}
			return getPagination(emoteList, itemsPerPage, emotesCurrentPage)
		end
		
		function FUNCTIONSmodule.getAnimPackPagination()
			repeat task.wait() until getgenv().AFEMListing
			local animPackList = getgenv().AFEMListing and getgenv().AFEMListing.AnimationPacks or {}
			return getPagination(animPackList, itemsPerPage, animPacksCurrentPage)
		end
		
		function levenshtein(str1, str2)
			local len1 = #str1
			local len2 = #str2
			local matrix = {}
		
			for i = 0, len1 do
				matrix[i] = {}
				matrix[i][0] = i
			end
			for j = 0, len2 do
				matrix[0][j] = j
			end
		
			for i = 1, len1 do
				for j = 1, len2 do
					local cost = (str1:sub(i, i) == str2:sub(j, j)) and 0 or 1
					matrix[i][j] = math.min(
						matrix[i - 1][j] + 1,     -- Deletion
						matrix[i][j - 1] + 1,     -- Insertion
						matrix[i - 1][j - 1] + cost  -- Substitution
					)
				end
			end
		
			return matrix[len1][len2]
		end
		
		local function getInitials(str)
			local initials = ""
			for word in str:gmatch("%w+") do
				initials = initials .. word:sub(1,1)
			end
			return initials
		end
		
		local function splitWords(str)
			local words = {}
			for word in str:gmatch("%w+") do
				table.insert(words, word)
			end
			return words
		end
		
		function fuzzySearch(query, items, minConfidence)
			query = query:lower()
			minConfidence = minConfidence or 0.5
			local results = {}
		
			for _, item in ipairs(items) do
				local normalized = item:lower()
				local words = splitWords(normalized)
				local initials = getInitials(normalized)
				local start = normalized:find(query, 1, true)
		
				local relevant = start and normalized:sub(start, start + #query - 1) or normalized
				local distance = levenshtein(query, relevant)
				local maxLen = math.max(#query, #relevant)
				local confidence = 1 - (distance / maxLen)
		
				if normalized == query then
					confidence = confidence + 0.5
				elseif normalized:sub(1, #query) == query then
					confidence = confidence + 0.25
				elseif start then
					confidence = confidence + 0.15
				end
		
				if initials == query then
					confidence = confidence + 0.5
				elseif initials:sub(1, #query) == query then
					confidence = confidence + 0.2
				end
		
				for _, word in ipairs(words) do
					if word:sub(1, #query) == query then
						confidence = confidence + 0.1
						break
					end
				end
		
				if confidence >= minConfidence then
					table.insert(results, {
						item = item,
						confidence = math.min(confidence, 1),
						isExact = normalized == query
					})
				end
			end
		
			table.sort(results, function(a, b)
				if a.isExact ~= b.isExact then
					return a.isExact
				elseif a.confidence ~= b.confidence then
					return a.confidence > b.confidence
				else
					return a.item < b.item
				end
			end)
		
			local sortedItems = {}
			for _, result in ipairs(results) do
				table.insert(sortedItems, { item = result.item, confidence = result.confidence })
			end
		
			return sortedItems
		end
		
		function FUNCTIONSmodule.searchEmotes(query, minConfidence)
			local emoteList = getgenv().AFEMListing and getgenv().AFEMListing.Emotes or {}
			local names = {}
			for _, emote in ipairs(emoteList) do
				if not emote["_comment"] then
					table.insert(names, emote.name)
				end
			end
			local results = fuzzySearch(query, names, minConfidence)
			local filtered = {}
			for _, result in ipairs(results) do
				for _, emote in ipairs(emoteList) do
					if emote.name == result.item then
						table.insert(filtered, emote)
						break
					end
				end
			end
			return filtered
		end
		
		local function createPaginatedListing(list, area, page, perPage, searchQuery, buttonSetup)
			local filteredList = list
			if searchQuery and #searchQuery > 0 then
				local names = {}
				for _, item in ipairs(list) do
					if not item["_comment"] then
						table.insert(names, item.name)
					end
				end
				local results = fuzzySearch(searchQuery, names)
				local temp = {}
				for _, result in ipairs(results) do
					for _, item in ipairs(list) do
						if item.name == result.item then
							table.insert(temp, item)
							break
						end
					end
				end
				filteredList = temp
			end
			local totalItems = #filteredList
			local totalPages = math.ceil(totalItems / perPage)
			if page < 1 then page = 1 end
			if page > totalPages then page = totalPages end
		
			for _, v in ipairs(area:GetChildren()) do
				if v:IsA("Frame") or v.Name == "NextPageButton" or v.Name == "PrevPageButton" then
					v:Destroy()
				end
			end
		
			local startIdx = (page - 1) * perPage + 1
			local endIdx = math.min(page * perPage, totalItems)
		
			for i = startIdx, endIdx do
				local item = filteredList[i]
				if item and not item["_comment"] then
					buttonSetup(item, area, i)
				end
			end
		end
		
		local function clearEmotesPaginationPages(amountOfPages)
			amountOfPages = amountOfPages or FUNCTIONSmodule.getEmotePagination().totalPages
			local paginationUIBar = itemsel.Emotes.PaginationBar
			for _, v in ipairs(paginationUIBar:GetChildren()) do
				if v:IsA("Frame") and v.Name:sub(1,4) == "Page" then
					local pageNum = tonumber(v.Name:sub(5))
					if pageNum and pageNum > amountOfPages then
						v:Destroy()
					end
				end
			end
		end
		
		local itemDetailFrame = script.Parent.Menu.ItemDetail
		local iDFPosT = sbt.new(itemDetailFrame, "Position", 0.5, 26, 100)
		local iDFAPointT = sbt.new(itemDetailFrame, "AnchorPoint", 0.5, 26, 100)
		local iDFSizeT = sbt.new(itemDetailFrame, "Size", 1, 18, 100)
		
		local lastOrigin = Instance.new("TextButton")
		
		local emoteDetailPageConnections = {
			favorite = nil,
			play = nil
		}
		
		function FUNCTIONSmodule.emoteDetailPage(emote, origin, alternateAnimID, playFunc)
			itemDetailFrame.Item.Details.ItemName.Text = emote["name"]
			if emote["description"] then
				itemDetailFrame.Item.Details.ItemDescription.Text = emote["description"]
			else
				itemDetailFrame.Item.Details.ItemDescription.Text = ""
			end
			itemDetailFrame.Item.AvatarPreview.PlayEmote:Fire(emote["animationid"] or alternateAnimID)
		
			lastOrigin = origin
		
			script.Parent.Menu.Area.Interactable = false
		
		
			iDFAPointT:Start() iDFPosT:Start() iDFSizeT:Start()
		
			iDFAPointT:SetOffset(Vector2.zero)
			iDFPosT:SetOffset(UDim2.fromOffset(origin.AbsolutePosition.X, origin.AbsolutePosition.Y + game:GetService("GuiService"):GetGuiInset().Y))
			iDFSizeT:SetOffset(UDim2.fromOffset(origin.AbsoluteSize.X, origin.AbsoluteSize.Y))
		
			iDFAPointT:SetGoal(Vector2.zero)
			iDFPosT:SetGoal(UDim2.fromOffset(origin.AbsolutePosition.X, origin.AbsolutePosition.Y + game:GetService("GuiService"):GetGuiInset().Y))
			iDFSizeT:SetGoal(UDim2.fromOffset(origin.AbsoluteSize.X, origin.AbsoluteSize.Y))
		
			task.spawn(function()
				origin.Position = UDim2.new(0.5, 0, 1.6, 0)
			end)
		
			itemDetailFrame.Visible = true
			--task.wait()
		
			iDFAPointT:SetGoal(Vector2.new(0.5, 0.5))
			iDFPosT:SetGoal(UDim2.fromScale(0.5, 0.5))
			iDFSizeT:SetGoal(UDim2.fromOffset(400, 350))
		
			if perf_useScale then
				ts:Create(script.Parent.Menu.Area.UIScale, TweenInfo.new(0.7, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
					Scale = 0.95
				}):Play()
			else
				ts:Create(script.Parent.Menu.Area, TweenInfo.new(0.7, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
					Position = UDim2.fromScale(0.5, 0.65)
				}):Play()
			end
			ts:Create(script.Parent.Menu.Backdrop, TweenInfo.new(0.7, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
				BackgroundTransparency = 0.5
			}):Play()
		
			itemDetailFrame.Actions.Close.MouseButton1Click:Connect(function()
				FUNCTIONSmodule.closeEmoteDetailPage()
			end)
			
			local favoritesData = {}
			if pointSaveAFEM:get("favoriteEmoteEntries") then
				favoritesData = hts:JSONDecode(pointSaveAFEM:get("favoriteEmoteEntries"))
			end
			
			local function finderEmote(data, emoteToFind)
				for idx, emote in ipairs(data) do
					if emote.name == emoteToFind.name  then
						return idx
					end
				end
				return nil
			end
			
			
			
			if finderEmote(favoritesData, emote) then
				itemDetailFrame.Actions.Favorites.Text = "FAVORITED"
			else
				itemDetailFrame.Actions.Favorites.Text = "FAVORITE"
			end
			
			emoteDetailPageConnections.copyAnimId = itemDetailFrame.Actions.CopyAnimID.MouseButton1Click:Connect(function()
				local success = pcall(function() setclipboard(emote["animationid"] or alternateAnimID) end)
				if not success then
					warn(emote["animationid"])
				end
				FUNCTIONSmodule.notification("Animation ID copied", "The animation ID has been copied to your clipboard!")
			end)
			
			emoteDetailPageConnections.floatingButton = itemDetailFrame.Actions.FloatingButton.MouseButton1Click:Connect(function()
				local emoteClone = emote
				emoteClone["animationid"] = emote["animationid"] or alternateAnimID
				if pickerProvider == "floating" then
					FUNCTIONSmodule.createFloatingButton(emoteClone, true)
					return
				end
				
				if pickerProvider == "quicks" then
					FUNCTIONSmodule.createQuickSelectorEntry(emoteClone, true)
					return
				end
			end)
			emoteDetailPageConnections.favorite = itemDetailFrame.Actions.Favorites.MouseButton1Click:Connect(function()
				local favoritesData = {}
				if pointSaveAFEM:get("favoriteEmoteEntries") then
					favoritesData = hts:JSONDecode(pointSaveAFEM:get("favoriteEmoteEntries"))
				end
				
				local emoteClone = emote
				emoteClone["animationid"] = emote["animationid"] or alternateAnimID
				
				
				local inserting = true
				
				
				if not finderEmote(favoritesData, emoteClone) then
					table.insert(favoritesData, emoteClone)
					
					local mouseLoc = game:GetService("UserInputService"):GetMouseLocation()
					prf.new(script.Parent, {
						Origin = UDim2.new(0, mouseLoc.X, 0, mouseLoc.Y),
						Text = "â­",
						Amount = 10,
						Velocity = Vector2.new(0, -200),
						VelocitySpread = 200,
						Gravity = Vector2.new(0, 400)
					})
				else
					inserting = false
					table.remove(favoritesData, finderEmote(favoritesData, emoteClone))
				end
				
				if inserting then
					itemDetailFrame.Actions.Favorites.Text = "FAVORITED"
				else
					itemDetailFrame.Actions.Favorites.Text = "FAVORITE"
				end
				
				pointSaveAFEM:set("favoriteEmoteEntries", hts:JSONEncode(favoritesData))
				FUNCTIONSmodule.refreshEmotes(nil, nil, nil, nil, nil, true) -- holy nil
			end)
			emoteDetailPageConnections.play = itemDetailFrame.Actions.Play.MouseButton1Click:Connect(function()
				playFunc()
				FUNCTIONSmodule.notification("Playing", "Played animation in the background.")
			end)
		
		end
		
		function FUNCTIONSmodule.closeEmoteDetailPage()
			iDFPosT:SetGoal(UDim2.fromScale(0.5, 2))
			task.wait(0.1)
		
			itemDetailFrame.Visible = false
		
			ts:Create(lastOrigin, TweenInfo.new(0.7, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
				Position = UDim2.fromScale(0.5, 0.5)
			}):Play()
		
			script.Parent.Menu.Area.Interactable = true
			if perf_useScale then
				ts:Create(script.Parent.Menu.Area.UIScale, TweenInfo.new(0.7, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
					Scale = 1
				}):Play()
			else
				ts:Create(script.Parent.Menu.Area, TweenInfo.new(0.7, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
					Position = UDim2.fromScale(0.5, 0.55)
				}):Play()
			end
			ts:Create(script.Parent.Menu.Backdrop, TweenInfo.new(0.7, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
				BackgroundTransparency = 1
			}):Play()
		
			iDFAPointT:Stop() iDFPosT:Stop() iDFSizeT:Stop()
			
			if emoteDetailPageConnections.play then
				emoteDetailPageConnections.play:Disconnect()
				emoteDetailPageConnections.play = nil
			end
			
			if emoteDetailPageConnections.floatingButton then
				emoteDetailPageConnections.floatingButton:Disconnect()
				emoteDetailPageConnections.floatingButton = nil
			end
			
			if emoteDetailPageConnections.copyAnimId then
				emoteDetailPageConnections.copyAnimId:Disconnect()
				emoteDetailPageConnections.copyAnimId = nil
			end
			
			if emoteDetailPageConnections.favorite then
				emoteDetailPageConnections.favorite:Disconnect()
				emoteDetailPageConnections.favorite = nil
			end
		end
		
		function getAnimationPackFromBundleId(bID)
			if bID == nil then return nil end
			repeat task.wait() until getgenv().AFEMListing
			local animPackList = getgenv().AFEMListing and getgenv().AFEMListing.AnimationPacks or {}
			for _, v in ipairs(animPackList) do
				if v["BundleId"] == bID then
					return v
				end
			end
			return nil
		end
		
		-- expose
		function FUNCTIONSmodule.getPackFromID(bID)
			return getAnimationPackFromBundleId(bID)
		end
		
		function getAnimatorScript()
			local char = game.Players.LocalPlayer.Character
			if not char then warn("[AFEM] - No character. Waiting for one...") char = game.Players.LocalPlayer.CharacterAdded:Wait() end
			local hum = char:WaitForChild("Humanoid", 10)
			if not hum then warn("[AFEM] - No humanoid in character.") return end
			if hum.RigType.Name ~= "R15" then warn("[AFEM] - Your character is not R15") FUNCTIONSmodule.notification("Your character needs to be R15.") return end
			local animateScript = char:FindFirstChild("Animate")
			if not animateScript then warn("[AFEM] - Your character does not have the Animate script!") return end
			return animateScript
		end
		
		function FUNCTIONSmodule.loadPack(save)
			if mainEquippedPack then
				FUNCTIONSmodule.applyPack(mainEquippedPack, false, save)
			end
		
			local animateScript = getAnimatorScript()
			if not animateScript then return end
		
			for _, animObj in ipairs(animateScript:GetChildren()) do
				local categoryName = animObj.Name
				local savedOverride = pointSaveAFEM:get("AnimationPack_" .. categoryName)
				if savedOverride then
					FUNCTIONSmodule.applySingularAnimPack(savedOverride, categoryName, save)
				end
			end
		end
		function FUNCTIONSmodule.applyPack(bID, new, save)
			mainEquippedPack = bID
			local animPack = getAnimationPackFromBundleId(tonumber(bID))
			if not animPack then
				warn("[AFEM] - Can't find this animation pack.")
				return
			end
		
			local animateScript = getAnimatorScript()
			if not animateScript then return end
		
			for _, animObj in ipairs(animateScript:GetChildren()) do
				if animPack["Animations"][animObj.Name] then
					if new then
						pointSaveAFEM:remove("AnimationPack_" .. animObj.Name)
						categoryEquippedPacks[animObj.Name] = nil
					end
					for _, animAsset in ipairs(animObj:GetChildren()) do
						if animPack["Animations"][animObj.Name][animAsset.Name] then
							animAsset.AnimationId = animPack["Animations"][animObj.Name][animAsset.Name]
						end
					end
				end
			end
		
			print("[AFEM] - Animation pack applied!")
			if save then
				local s, e = pcall(function()
					pointSaveAFEM:set("AnimationPackGLOBAL", tostring(bID))
					print("[AFEM] - Current main pack persistently saved")
				end)
				if not s then
					warn("[AFEM] - Failed to save persistent main pack, not supported?")
					warn(e)
				end
			end
		end
		function FUNCTIONSmodule.applySingularAnimPack(bID, ctgr, save)
			local anAnimationAsset = false
			if not tonumber(bID) then anAnimationAsset = true end
			categoryEquippedPacks[ctgr] = bID
			local animPack
			if not anAnimationAsset then
				animPack = getAnimationPackFromBundleId(tonumber(bID))
			end
			if not animPack and not anAnimationAsset then
				warn("[AFEM] - Can't find this animation pack.")
				return
			end
		
			if anAnimationAsset then
				animPack = bID
			end
		
			local animateScript = getAnimatorScript()
			if not animateScript then return end
		
			if not anAnimationAsset then
				for _, animObj in ipairs(animateScript:GetChildren()) do
					if animPack["Animations"][animObj.Name] and animObj.Name == ctgr then
						for _, animAsset in ipairs(animObj:GetChildren()) do
							if animPack["Animations"][animObj.Name][animAsset.Name] then
								animAsset.AnimationId = animPack["Animations"][animObj.Name][animAsset.Name]
							end
						end
					end
				end
			else
				for _, animObj in ipairs(animateScript:GetChildren()) do
					if animObj.Name == ctgr then
						for _, animAsset in ipairs(animObj:GetChildren()) do
							animAsset.AnimationId = animPack
						end
					end
				end
			end
		
		
			print("[AFEM] - Animation pack (single category) applied!")
			if save then
				local s, e = pcall(function()
					pointSaveAFEM:set("AnimationPack_" .. ctgr, tostring(bID))
					print("[AFEM] - Single category pack persistently saved")
				end)
				if not s then
					warn("[AFEM] - Failed to save persistent category pack, not supported?")
					warn(e)
				end
			end
		end
		
		game.Players.LocalPlayer.CharacterAdded:Connect(function()
			FUNCTIONSmodule.loadPack()
		end)
		
		
		function FUNCTIONSmodule.showTooltip(target, text)
			local tooltipClone = script.Parent.Tooltip:Clone()
			local targetAbsPos = target.AbsolutePosition
			local targetAbsSize = target.AbsoluteSize
			
			local topBarOffset = game:GetService("GuiService"):GetGuiInset()
			
			tooltipClone.Text.TextLabel.Text = text
			tooltipClone.Highlight.Size = UDim2.fromOffset(targetAbsSize.X + 10, targetAbsSize.Y + 10)
			tooltipClone.Position = UDim2.fromOffset(targetAbsPos.X + targetAbsSize.X / 2, (targetAbsPos.Y + targetAbsSize.Y / 2) + topBarOffset.Y)
			
			tooltipClone.Parent = script.Parent
			
			ts:Create(tooltipClone, TweenInfo.new(0.7, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
				GroupTransparency = 0
			}):Play()
			ts:Create(tooltipClone.UIScale, TweenInfo.new(0.7, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
				Scale = 1
			}):Play()
			
			task.spawn(function()
				tooltipClone.Highlight.MouseEnter:Wait()
				task.wait(1)
				ts:Create(tooltipClone, TweenInfo.new(0.7, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
					GroupTransparency = 1
				}):Play()
				ts:Create(tooltipClone.UIScale, TweenInfo.new(0.7, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
					Scale = 0.9
				}):Play()
				
				task.wait(0.7)
				tooltipClone:Destroy()
			end)
		end
		
		local selectedButton = nil
		function FUNCTIONSmodule.modal(t,d,b,input,needsResult)
			if not t then t = "Alert" end
			if not d then d = "" end
			if not b then b = {} end
		
		
			local modal = script.Parent.Modal
		
			modal.Container.Visual.Title.Text = t
			modal.Container.Visual.Desc.Text = d
		
			for _, already in ipairs(modal.Container.Buttons:GetChildren()) do
				if already:IsA("TextButton") and already.Name ~= "Sample" then
					already:Destroy()
				end
			end
			for _, button in pairs(b) do
				local bClone = modal.Container.Buttons.Sample:Clone()
				bClone.Text = button
				bClone.Name = button	
				bClone.Parent = modal.Container.Buttons
				bClone.Visible = true
		
				bClone.MouseButton1Click:Connect(function()
					if needsResult then
						selectedButton = button
					end
					FUNCTIONSmodule.modalClose()
				end)
			end
			
			local inputBox = modal.Container.Input
			if input then
				inputBox.Visible = true
				
				inputBox.TextBox.PlaceholderText = input["placeholder"]
				inputBox.TextBox.Text = input["prefill"]
			else
				inputBox.Visible = false
			end
		
			local twn = TweenInfo.new(0.4, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out)
			ts:Create(modal, twn, {
				BackgroundTransparency = 0.7
			}):Play()
		
			ts:Create(modal.Container, twn, {
				GroupTransparency = 0
			}):Play()
		
			ts:Create(modal.Container.UIScale, twn, {
				Scale = 1
			}):Play()
		
			ts:Create(modal.Container.UIStroke, twn, {
				Transparency = 0.8
			}):Play()
		
		
			modal.Container.Interactable = true
		end
		
		function FUNCTIONSmodule.modalClose()
		
			local modal = script.Parent.Modal
		
		
			local twn = TweenInfo.new(0.4, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out)
			ts:Create(modal, twn, {
				BackgroundTransparency = 1
			}):Play()
		
			ts:Create(modal.Container, twn, {
				GroupTransparency = 1
			}):Play()
		
			ts:Create(modal.Container.UIScale, twn, {
				Scale = 1.1
			}):Play()
		
			ts:Create(modal.Container.UIStroke, twn, {
				Transparency = 1
			}):Play()
		
			modal.Container.Interactable = false
		end
		
		function FUNCTIONSmodule.waitForModal()
			repeat task.wait() until selectedButton
			FUNCTIONSmodule.modalClose()
			local p = selectedButton
			selectedButton = nil
			return {
				selected = p,
				input = script.Parent.Modal.Container.Input.TextBox.Text
			}
		end
		
		function FUNCTIONSmodule.notification(title, body, duration)
			task.spawn(function()
				local notif = script.Parent.Notifications.NotificationContainer:Clone()
				notif.Name = "Notif"
		
				notif.Frame.Title.Text = title
				notif.Frame.Body.Text = body
		
				notif.Parent = script.Parent.Notifications
				notif.Visible = true
		
				task.wait()
				local twi = TweenInfo.new(0.3, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out)
				ts:Create(notif, twi, {
					Size = UDim2.new(0, 0, 0, notif.Frame.AbsoluteSize.Y + 16)
				}):Play()
		
				ts:Create(notif.UIPadding, twi, {
					PaddingTop = UDim.new(0, 16)
				}):Play()
		
				ts:Create(notif.Frame, twi, {
					Position = UDim2.new(0, 0, 1, 0)
				}):Play()
		
		
				task.wait(duration or 3)
				ts:Create(notif.Frame, twi, {
					Position = UDim2.new(-1.5, 0, 1, 0)
				}):Play()
		
				task.wait(0.3)
				notif:Destroy()
			end)
		end
		
		
		
		--local switchUGC = itemsel.Emotes.ActionBar.Switch.UGCEmote
		--local switchRoblox = itemsel.Emotes.ActionBar.Switch.RobloxEmotes
		
		--local onUGC = false
		--local marketplaceEngine = mke.new()
		
		
		--function FUNCTIONSmodule.switchToUGC(y)
		--	onUGC = y
		--	emotesCurrentPage = 1
		
		--	if y then
		--		itemsel.Emotes.ActionBar.Switch.UIPageLayout:JumpTo(switchUGC)
		--		marketplaceEngine = mke.new()
		--	else
		--		itemsel.Emotes.ActionBar.Switch.UIPageLayout:JumpTo(switchRoblox)
		--	end
		
		--	FUNCTIONSmodule.refreshEmotes(nil, nil, false, nil, true)
		--end
		
		local onUGC = false
		local marketplaceEngine = mke.new()
		
		function FUNCTIONSmodule.switchToUGC(y)
			onUGC = y
			emotesCurrentPage = 1
			
			if y then
				ts:Create(itemsel.Emotes.ActionBar.SwitchTabs.UGC, TweenInfo.new(0.1), {
					BackgroundTransparency = 0,
					TextColor3 = Color3.fromRGB(0, 0, 0)
				}):Play()
				
				ts:Create(itemsel.Emotes.ActionBar.SwitchTabs.Roblox, TweenInfo.new(0.1), {
					BackgroundTransparency = 1,
					TextColor3 = Color3.fromRGB(255, 255, 255)
				}):Play()
				marketplaceEngine = mke.new()
			else
				ts:Create(itemsel.Emotes.ActionBar.SwitchTabs.UGC, TweenInfo.new(0.1), {
					BackgroundTransparency = 1,
					TextColor3 = Color3.fromRGB(255, 255, 255)
				}):Play()
				
				ts:Create(itemsel.Emotes.ActionBar.SwitchTabs.Roblox, TweenInfo.new(0.1), {
					BackgroundTransparency = 0,
					TextColor3 = Color3.fromRGB(0, 0, 0)
				}):Play()
			end
			
			FUNCTIONSmodule.refreshEmotes(nil, nil, false, nil, true)
		end
		
		local fetchPatience = 30
		local fetchAlreadyWaiting = false
		local alreadyFetching = false
		local fetchQuery


		local showingSuggestionBar = false
		local suggestionBarSuggestions = {}

		local lastSuggestionQuery = ""

		local suggestionBarFrame = script.Parent.Menu.Area.ItemSelect.Emotes.SearchSuggestion

		local function updateSuggestionBarVisibility()
			if showingSuggestionBar then
				for _, i in ipairs(suggestionBarFrame:GetChildren()) do
					if i.Name == "Chip" then
						i:Destroy()
					end
				end

				ts:Create(suggestionBarFrame, TweenInfo.new(0.2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
					Size = UDim2.new(1,0,0,25)
				}):Play()
				for idx, suggestion in suggestionBarSuggestions do
					local chip = suggestionBarFrame.ChipSample:Clone()

					chip.Visible = true
					chip.Clickable.Label.Text = suggestion
					chip.Name = "Chip"

					chip.Parent = suggestionBarFrame

					task.spawn(function()
						task.wait(idx * 0.01)
						--sbt.OneShot(chip.Clickable, { mass = 1, stiffness = 18, damping = 100 }, {
						--	Position = UDim2.new(0, 0, 0, 0)
						--}):Go()
						ts:Create(chip.Clickable, TweenInfo.new(0.3, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
							Position = UDim2.new(0,0,0,0)
						}):Play()
					end)

					chip.Clickable.MouseButton1Click:Connect(function()
						itemsel.Emotes.ActionBar.Search.Text = suggestion
					end)
				end

			else
				ts:Create(suggestionBarFrame, TweenInfo.new(0.4, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
					Size = UDim2.new(1,0,0,0)
				}):Play()
			end
		end


		local searchSuggestionsActivelyFetching = false
		local function getSearchSuggestions(query)
			if searchSuggestionsActivelyFetching == true then return end
			searchSuggestionsActivelyFetching = true

			local suggestions = aig.requestSuggestions(query)

			searchSuggestionsActivelyFetching = false


			if fetchQuery == query then
				warn("pass")
				suggestionBarSuggestions = suggestions
				showingSuggestionBar = true
				updateSuggestionBarVisibility()
			end

		end


		function FUNCTIONSmodule.getEMListFromMarketplace(query, next, prev, instant)
			fetchQuery = query


			if alreadyFetching then return 1 end
			if fetchAlreadyWaiting and not instant then fetchPatience = 30 return 1 end
			fetchAlreadyWaiting = true

			--ts:Create(itemsel.Emotes.ActionBar.Spinner.Spinner, TweenInfo.new(0.2), {
			--	ImageTransparency = 0
			--}):Play()
			itemsel.Emotes.ActionBar.Spinner.Visible = true


			if not instant then
				repeat task.wait() fetchPatience = fetchPatience - 1 itemsel.Emotes.ActionBar.TextLabel.Text = fetchPatience until fetchPatience < 1
			end
			fetchAlreadyWaiting = false
			alreadyFetching = true


			local emoteList
			if not (next or prev) then
				emoteList = marketplaceEngine:FetchEmotes({search = fetchQuery})
			else
				if next then
					emoteList = marketplaceEngine:NextFetch()
				end
				if prev then
					emoteList = marketplaceEngine:PreviousFetch()
				end
			end

			showingSuggestionBar = false
			updateSuggestionBarVisibility()

			if #fetchQuery > 3 and not (next or prev) then
				task.spawn(function()
					getSearchSuggestions(fetchQuery)
				end)
			end

			--+ (marketplaceEngine.hasMore and 1 or 0)

			itemsel.Emotes.ActionBar.Spinner.Visible = false
			fetchPatience = 30
			--ts:Create(itemsel.Emotes.ActionBar.Spinner.Spinner, TweenInfo.new(0.2), {
			--	ImageTransparency = 1
			--}):Play()
			alreadyFetching = false
			return {
				listing = emoteList,
				numberOfPages = #marketplaceEngine.cursorHistory,
				pageIndex = marketplaceEngine.cursorIndex,
			}
		end


		function FUNCTIONSmodule.pickerProvider(floatingButtons, quickSelector)
			if floatingButtons then
				pickerProvider = "floating"
				script.Parent.Menu.ItemDetail.Actions.FloatingButton.Text = "FLOATING B."

				ts:Create(script.Parent.FloatingButtons, TweenInfo.new(0.5), {
					Position = UDim2.fromScale(0,0)
				}):Play()
				return
			else
				ts:Create(script.Parent.FloatingButtons, TweenInfo.new(0.5), {
					Position = UDim2.fromScale(0,1.5)
				}):Play()
			end

			-- spit it out baby
			pickerProvider = "quicks"
			script.Parent.Menu.ItemDetail.Actions.FloatingButton.Text = "QUICK S."
			task.wait()
			script.Parent.Menu.QuickSelectorIcon:Fire(quickSelector or false)

		end

		local floatingButtonStore = {}
		if pointSaveAFEM:get("fbStore") then
			floatingButtonStore = hts:JSONDecode(pointSaveAFEM:get("fbStore"))
		end
		function FUNCTIONSmodule.createFloatingButton(emote, notify)

			local function saveStore()
				pointSaveAFEM:set("fbStore", hts:JSONEncode(floatingButtonStore))
			end


			local floatingButtonCont = script.Parent.FloatingButtons

			if floatingButtonCont:FindFirstChild(emote.name) then
				floatingButtonCont:FindFirstChild(emote.name):Destroy()

				floatingButtonStore[emote.id] = nil
				saveStore()
				return
			end
			floatingButtonStore[emote.id] = emote
			saveStore()

			local floatingB = floatingButtonCont.Sample:Clone()

			floatingB.Name = emote.name
			floatingB.Visible = true
			floatingB.ImageLabel.Image = "rbxthumb://type=Asset&id=" .. emote.id .. "&w=420&h=420"
			floatingB.Parent = floatingButtonCont


			local dragB = dgb.new(floatingB, floatingB, false, true)

			local function dragEnable()
				dragB:Enable()

				if floatingButtonStore[emote.id].fBPosition then
					floatingB.Position = UDim2.fromOffset(
						floatingButtonStore[emote.id].fBPosition.x,
						floatingButtonStore[emote.id].fBPosition.y
					)
				else
					floatingB.Position = UDim2.fromOffset(50, 50)
				end

				dragB.Dragged = function(p)
					ts:Create(floatingB, TweenInfo.new(0.1), {
						Position = p
					}):Play()
				end

				dragB.DragEnded = function()
					floatingButtonStore[emote.id].fBPosition = {
						x = floatingB.Position.X.Offset,
						y = floatingB.Position.Y.Offset
					}

					saveStore()
				end
			end

			local function dragDisable()
				dragB:Disable()
				task.wait()

				floatingB.Position = UDim2.fromOffset(
					floatingB.AbsolutePosition.X - floatingB.AbsoluteSize.X,
					(floatingB.AbsolutePosition.Y  + game:GetService("GuiService"):GetGuiInset().Y) - floatingB.AbsoluteSize.Y
				)
				floatingButtonStore[emote.id].fBPosition = nil

				saveStore()
			end

			if pointSaveAFEM:get("settings_fbPositioning") == "Freeform" then
				dragEnable()
			end


			floatingButtonCont.Update.Event:Connect(function(freeform)
				if freeform then
					dragEnable()
				else
					dragDisable()
				end
			end)



			floatingB.Size = UDim2.fromOffset(40, 40)
			task.wait()
			floatingB.Position = UDim2.fromOffset(
				floatingB.AbsolutePosition.X - floatingB.AbsoluteSize.X,
				(floatingB.AbsolutePosition.Y  + game:GetService("GuiService"):GetGuiInset().Y) - floatingB.AbsoluteSize.Y
			)

			floatingB.MouseButton1Click:Connect(function()
				FUNCTIONSmodule.playanim(emote.animationid)		
			end)



			if notify then
				FUNCTIONSmodule.notification("Created", "Floating button created.")
			end
		end

		local quickSelectorStore = {}
		if pointSaveAFEM:get("qsStore") then
			quickSelectorStore = hts:JSONDecode(pointSaveAFEM:get("qsStore"))
		end
		function FUNCTIONSmodule.createQuickSelectorEntry(emote, notify)
			local quickSelectorFrame = script.Parent.QuickSelectorFrame.ScrollingFrame

			local function saveStore()
				pointSaveAFEM:set("qsStore", hts:JSONEncode(quickSelectorStore))
			end

			if quickSelectorFrame:FindFirstChild(emote.name) then
				quickSelectorFrame:FindFirstChild(emote.name):Destroy()

				quickSelectorStore[emote.id] = nil
				saveStore()
				return
			end
			quickSelectorStore[emote.id] = emote
			saveStore()

			local quickSEntry = quickSelectorFrame.Sample:Clone()

			quickSEntry.Name = emote.name
			quickSEntry.Visible = true
			quickSEntry.Thumbnail.Image = "rbxthumb://type=Asset&id=" .. emote.id .. "&w=420&h=420"
			quickSEntry.Parent = quickSelectorFrame

			quickSEntry:SetAttribute("animID", emote.animationid)

			if notify then
				FUNCTIONSmodule.notification("Created", "Quick selector entry created.")
			end
		end

		function FUNCTIONSmodule.recreateFloatingButtonsFromStore()
			local floatingButtonStore = {}

			if pointSaveAFEM:get("fbStore") then
				floatingButtonStore = hts:JSONDecode(pointSaveAFEM:get("fbStore"))
			end

			for _, emote in pairs(floatingButtonStore) do
				if emote then
					FUNCTIONSmodule.createFloatingButton(emote, false)
				end
			end
		end


		function FUNCTIONSmodule.recreateQuickSelectorsFromStore()
			local quickSelectorStore = {}

			if pointSaveAFEM:get("qsStore") then
				quickSelectorStore = hts:JSONDecode(pointSaveAFEM:get("qsStore"))
			end

			for _, emote in pairs(quickSelectorStore) do
				if emote then
					FUNCTIONSmodule.createQuickSelectorEntry(emote, false)
				end
			end
		end

		function FUNCTIONSmodule.refreshEmotes(page, search, MKNavigating, MKNext, MKInstant, onlyUpdateFavorites)
			if page then emotesCurrentPage = page end
			if search then emoteSearchQuery = search end
			local area = itemsel.Emotes.Listing
			repeat task.wait() until getgenv().AFEMListing.Emotes
			local emoteList
			local marketplaceMetadata

			if pointSaveAFEM:get("favoriteEmoteEntries") then
				local favoritesData = hts:JSONDecode(pointSaveAFEM:get("favoriteEmoteEntries"))

				for _, v in ipairs(itemsel.Emotes.FavoritesSection.Listing:GetChildren()) do
					if v:IsA("Frame") then v:Destroy() end
				end

				for _, emote in ipairs(favoritesData) do
					local buttonClone = itemsel.ItemListTemplate:Clone()
					buttonClone.Name = emote["name"] .. "EMOTE"
					buttonClone.Size = UDim2.new(0, 200, 1, 0)
					buttonClone.Visible = true
					buttonClone.Parent = itemsel.Emotes.FavoritesSection.Listing
					buttonClone.Clickable.Details.Title.Text = emote["name"]
					buttonClone.Clickable.Thumbnail.Image = "rbxthumb://type=Asset&id=" .. emote["id"] .. "&w=420&h=420"

					if emote["description"] then
						buttonClone.Clickable.Details.Description.Text = emote["description"]
					end


					local function play()
						FUNCTIONSmodule.playanim(emote["animationid"])
					end

					buttonClone.Clickable.MouseButton1Click:Connect(function()
						play()
						script.Parent.Menu.MenuStateChange:Fire(false)
					end)

					buttonClone.Clickable.Details.Buttons.Play.MouseButton1Click:Connect(function()
						play()
					end)

					if emote["_special"] == "custom" then
						buttonClone.Clickable.UIStroke.CustomEffect.Enabled = true
					end
				end
			end

			if onlyUpdateFavorites then
				return
			end
			if onUGC then
				local marketplaceListing
				if not MKNavigating then
					marketplaceListing = FUNCTIONSmodule.getEMListFromMarketplace(search ~= "" and search or "", false, false, MKInstant)
				else
					marketplaceListing = FUNCTIONSmodule.getEMListFromMarketplace(search ~= "" and search or "", MKNext, not MKNext, MKInstant)
				end
				if marketplaceListing == 1 then return end
				emoteList = marketplaceListing.listing
				marketplaceMetadata = {
					totalPages = marketplaceListing.numberOfPages,
					currentPage = marketplaceListing.pageIndex,
				}
			else
				emoteList = getgenv().AFEMListing.Emotes
			end

			createPaginatedListing(emoteList, area, not onUGC and emotesCurrentPage or 1, itemsPerPage, not onUGC and search or "", function(emote, parent, index)
				local buttonClone = itemsel.ItemListTemplate:Clone()
				buttonClone.Name = emote["name"] .. "EMOTE"
				buttonClone.Clickable.Position = UDim2.new(0.5, 0, 1.6, 0)
				buttonClone.Visible = true
				buttonClone.Parent = parent
				buttonClone.Clickable.Details.Title.Text = emote["name"]
				buttonClone.Clickable.Thumbnail.Image = "rbxthumb://type=Asset&id=" .. emote["id"] .. "&w=420&h=420"

				local ugcAnimationId
				local ugcRequestForId = false
				local function requestingAnimId()
					buttonClone.Clickable.Details.Buttons.Loading.Visible = true
					ts:Create(buttonClone.Clickable.Details.Buttons.Loading.Progress, TweenInfo.new(5, Enum.EasingStyle.Linear), {
						Size = UDim2.new(0.6, 0, 1, 0)
					}):Play()

					ugcAnimationId = marketplaceEngine:GetAnimationId(emote["id"])

					if pointSaveAFEM:get("settings_ugcCacheTracks") == "1" then
						local anim = Instance.new("Animation")
						anim.AnimationId = ugcAnimationId

						local animator = game.Players.LocalPlayer.Character.Humanoid:FindFirstChild("Animator")
						local track = animator:LoadAnimation(anim)


						ts:Create(buttonClone.Clickable.Details.Buttons.Loading.Progress, TweenInfo.new(0.2, Enum.EasingStyle.Linear), {
							Size = UDim2.new(0.8, 0, 1, 0)
						}):Play()
						repeat task.wait() until track.Length ~= 0
					end

					ts:Create(buttonClone.Clickable.Details.Buttons.Loading.Progress, TweenInfo.new(0.3, Enum.EasingStyle.Linear), {
						Size = UDim2.new(1, 0, 1, 0)
					}):Play()
					task.wait(0.3) buttonClone.Clickable.Details.Buttons.Loading.Visible = false
				end
				task.spawn(function()
					if onUGC then
						if pointSaveAFEM:get("settings_ugcCacheIds") == "0" then
							repeat task.wait() until ugcRequestForId or not buttonClone
							if not buttonClone then return end
						end
						requestingAnimId()
						return
					end
				end)

				local function play()
					if onUGC then
						if not ugcAnimationId then
							ugcRequestForId = true
							repeat task.wait() until ugcAnimationId
						end
						FUNCTIONSmodule.playanim(ugcAnimationId)
						return
					end

					FUNCTIONSmodule.playanim(emote["animationid"])
				end

				local function contextMenu()
					if onUGC and not ugcAnimationId then
						ugcRequestForId = true
						repeat task.wait() until ugcAnimationId
					end
					FUNCTIONSmodule.emoteDetailPage(emote, buttonClone.Clickable, (onUGC and ugcAnimationId) and marketplaceEngine:GetAnimationId(emote["id"]) or nil, play)
				end

				buttonClone.Clickable.MouseButton1Click:Connect(function()
					play()
					script.Parent.Menu.MenuStateChange:Fire(false)
				end)

				if emote["description"] then
					buttonClone.Clickable.Details.Description.Text = emote["description"]
				end



				buttonClone.Clickable.Details.Buttons.Play.Text = "INFO"
				buttonClone.Clickable.Details.Buttons.Play.Size = UDim2.fromOffset(45, 20)
				buttonClone.Clickable.Details.Buttons.Play.MouseButton1Click:Connect(function()
					contextMenu()
				end)

				--buttonClone.Clickable.Details.Buttons.Preview.MouseButton1Click:Connect(function()
				--script.Parent.Menu.AvatarPreview.PlayEmote:Fire(emote["animationid"], true)
				--FUNCTIONSmodule.emoteDetailPage(emote, buttonClone.Clickable)
				--end)

				local holdDetect = cah.new(buttonClone.Clickable)
				holdDetect.Holded.Event:Connect(contextMenu)

				if emote["isOffSale"] then
					buttonClone.Clickable.Details.Buttons.OffSale.Visible = true
					buttonClone.Clickable.OffSaleEffect.Enabled = true
				end

				if emote["_special"] == "custom" or onUGC then
					buttonClone.Clickable.UIStroke.CustomEffect.Enabled = true
				end



				ts:Create(buttonClone.Clickable, TweenInfo.new(.3, Enum.EasingStyle.Circular, Enum.EasingDirection.Out, 0, false, ((index - (itemsPerPage * (emotesCurrentPage - 1))) / 50)), {
					Position = UDim2.new(0.5, 0, 0.5, 0)
				}):Play()
			end)



			local paginationInfo
			if onUGC then
				paginationInfo = {
					totalPages = marketplaceMetadata.totalPages,
					currentPage = marketplaceMetadata.currentPage
				}
			else
				paginationInfo = FUNCTIONSmodule.getEmotePagination()
			end
			local paginationUIBar = itemsel.Emotes.PaginationBar

			clearEmotesPaginationPages(paginationInfo.totalPages)

			local activePage = nil
			if onUGC then
				activePage = paginationInfo.currentPage or 1
			else
				activePage = emotesCurrentPage
			end

			local paginationUIBar = itemsel.Emotes.PaginationBar
			local tweenInfo = TweenInfo.new(0.4, Enum.EasingStyle.Cubic)

			local function updatePageButton(button, isActive)
				ts:Create(button.UIScale, tweenInfo, { Scale = isActive and 1 or 0.3 }):Play()
				ts:Create(button.Label, tweenInfo, { TextTransparency = isActive and 0 or 1 }):Play()
			end

			local function updateNavButton(button, enabled)
				ts:Create(button.UIScale, tweenInfo, { Scale = enabled and 1 or 0 }):Play()
			end


			for pagePagination = 1, paginationInfo.totalPages do
				local button = paginationUIBar:FindFirstChild("Page" .. pagePagination)
				if not button then
					button = paginationUIBar.SamplePage:Clone()
					button.Name = "Page" .. pagePagination
					button.Label.Text = pagePagination
					button.Parent = paginationUIBar
					button.Visible = true
				end
				updatePageButton(button, activePage == pagePagination)
			end

			updateNavButton(itemsel.Emotes.PaginationBar.Next, activePage < paginationInfo.totalPages)
			updateNavButton(itemsel.Emotes.PaginationBar.Previous, activePage > 1)


		end

		function FUNCTIONSmodule.emotePagination(next)
			if onUGC then
				FUNCTIONSmodule.refreshEmotes(nil, emoteSearchQuery, true, next, true)
				return
			end

			if next == true then
				emotesCurrentPage += 1
			else
				emotesCurrentPage -= 1
			end
			FUNCTIONSmodule.refreshEmotes(emotesCurrentPage, emoteSearchQuery, true, next, true)
		end



		function FUNCTIONSmodule.refreshAnimPacks(page, search)
			if page then animPacksCurrentPage = page end
			local area = itemsel.AnimationPacks.Listing
			repeat task.wait() until getgenv().AFEMListing.AnimationPacks
			local animPackList = getgenv().AFEMListing.AnimationPacks
			local searchQuery = search or ""
			createPaginatedListing(animPackList, area, animPacksCurrentPage, itemsPerPage, searchQuery, function(pack, parent)
				local buttonClone = itemsel.ItemListTemplate:Clone()
				buttonClone.Name = (pack["Name"] or "Pack") .. "PACK"
				buttonClone.Visible = true
				buttonClone.Parent = parent
				buttonClone.Clickable.Details.Title.Text = (pack["Name"] or "Unnamed Pack") .. "(" .. pack["BundleId"] .. ")"
				buttonClone.Clickable.Details.Buttons.Play.Visible = false
				if pack["CustomImage"] then
					buttonClone.Clickable.Thumbnail.Image = pack["CustomImage"]
				else
					buttonClone.Clickable.Thumbnail.Image = "rbxthumb://type=BundleThumbnail&id=" .. pack["BundleId"] .. "&w=420&h=420"
				end
				buttonClone.Clickable.MouseButton1Click:Connect(function()
					FUNCTIONSmodule.applyPack(pack["BundleId"], true, true)
					FUNCTIONSmodule.modal("Pack applied", "Animation pack has been applied.", {"Okay"})
					area.Parent.PackEditorUpdate:Fire()
				end)
			end)
			local paginationInfo = FUNCTIONSmodule.getAnimPackPagination()
			local paginationUIBar = itemsel.AnimationPacks.PaginationBar

			local tweenInfo = TweenInfo.new(0.4, Enum.EasingStyle.Cubic)
			local SCALE_ACTIVE, SCALE_INACTIVE = 1, 0.3
			local TRANSPARENT, OPAQUE = 1, 0

			local function updatePageButton(button, isActive)
				ts:Create(button.UIScale, tweenInfo, { Scale = isActive and 1 or 0.3 }):Play()
				ts:Create(button.Label, tweenInfo, { TextTransparency = isActive and 0 or 1 }):Play()
			end

			local function updateNavButton(button, enabled)
				ts:Create(button.UIScale, tweenInfo, { Scale = enabled and 1 or 0 }):Play()
			end

			for pagePagination = 1, paginationInfo.totalPages do
				local button = paginationUIBar:FindFirstChild("Page" .. pagePagination)
				if not button then
					button = paginationUIBar.SamplePage:Clone()
					button.Name = "Page" .. pagePagination
					button.Label.Text = pagePagination
					button.Parent = paginationUIBar
					button.Visible = true
				end
				updatePageButton(button, page == pagePagination)
			end

			updateNavButton(itemsel.AnimationPacks.PaginationBar.Next, animPacksCurrentPage < paginationInfo.totalPages)
			updateNavButton(itemsel.AnimationPacks.PaginationBar.Previous, animPacksCurrentPage > 1)
		end

		return FUNCTIONSmodule

	end
	module_scripts[script] = module_script
end
do -- Module: StarterGui.AFEMMax.SBT
	local script = Instance.new("ModuleScript")
	script.Name = "SBT"
	script.Parent = Converted["_AFEMMax"]
	local function module_script()
		-- Spring based tween


		local SpringF = function()
			local EqF = function()
				local Functions = {}

				local function OverDamping(m, a, k, y0, v0, f) -- Removed type annotations
					local delta = a * a - 4 * k / m
					local d = -1 / 2
					local w1 = a + math.sqrt(delta)
					local w2 = a - math.sqrt(delta)
					local r1, r2 = d * w1, d * w2
					local c1, c2 = (r2 * y0 - v0) / (r2 - r1), (r1 * y0 - v0) / (r1 - r2)
					local yp = f / k

					return {
						Offset = function(t)
							return c1 * math.exp(r1 * t) + c2 * math.exp(r2 * t) + yp
						end,
						Velocity = function(t)
							return c1 * r1 * math.exp(r1 * t) + c2 * r2 * math.exp(r2 * t)
						end,
						Acceleration = function(t)
							return c1 * r1 * r1 * math.exp(r1 * t) + c2 * r2 * r2 * math.exp(r2 * t)
						end
					}
				end

				local function CriticalDamping(m, a, k, y0, v0, f) -- Removed type annotations
					local r = -a / 2
					local c1, c2 = y0, v0 - r * y0
					local yp = f / k

					return {
						Offset = function(t)
							return math.exp(r * t) * (c1 + c2 * t) + yp
						end,
						Velocity = function(t)
							return math.exp(r * t) * (c2 * r * t + c1 * r + c2)
						end,
						Acceleration = function(t)
							return r * math.exp(r * t) * (c2 * r * t + c1 * r + 2 * c2)
						end
					}
				end

				local function UnderDamping(m, a, k, y0, v0, f) -- Removed type annotations
					local delta = a * a - 4 * k / m
					local r = -a / 2
					local s = math.sqrt(-delta)
					local c1, c2 = y0, (v0 - (r * y0)) / s
					local yp = f / k

					return {
						Offset = function(t)
							return math.exp(r * t) * (c1 * math.cos(s * t) + c2 * math.sin(s * t)) + yp
						end,
						Velocity = function(t)
							return -math.exp(r * t) * ((c1 * s - c2 * r) * math.sin(s * t) + (-c2 * s - c1 * r) * math.cos(s * t))
						end,
						Acceleration = function(t)
							return -math.exp(r * t) * ((c2 * s * s + 2 * c1 * r * s - c2 * r * r) * math.sin(s * t) + (c1 * s * s - 2 * c2 * r * s - c1 * r * r) * math.cos(s * t))
						end
					}
				end

				function Functions.F(Spring)
					local y0, v0, f = Spring.InitialOffset, Spring.InitialVelocity, Spring.ExternalForce
					local m, a, k = Spring.Mass, Spring.Damping, Spring.Constant
					local delta = a * a - 4 * k / m

					if delta > 0 then
						return OverDamping(m, a, k, y0, v0, f)
					elseif delta == 0 then
						return CriticalDamping(m, a, k, y0, v0, f)
					else
						return UnderDamping(m, a, k, y0, v0, f)
					end
				end

				return Functions
			end
			local Eq = EqF()

			-- Declarations --


			local sqrt = math.sqrt

			-- Constants --
			local PI = math.pi

			local SPRING_PROPERTIES = {
				OFFSET = "Offset",
				VELOCITY = "Velocity",
				ACCELERATION = "Acceleration",
				GOAL = "Goal",
				FREQUENCY = "Frequency",
			}

			local SPRING_PROPERTIES_FORMAT_STRING_BASIC = ""
			local SPRING_PROPERTIES_FORMAT_STRING_ADVANCED = ""

			-- Class --
			local Spring = {}
			local SpringFunctions = {}

			SpringFunctions.__index = function(self, index)
				local INDEX_HANDLERS = {
					[SPRING_PROPERTIES.OFFSET] = function()
						local t = tick() - self.StartTick
						local F = self.F -- Use 'any' to handle dynamic types
						local offset = F.Offset(t)
						return offset
					end,
					[SPRING_PROPERTIES.VELOCITY] = function()
						local t = tick() - self.StartTick
						local F = self.F
						local velocity = F.Velocity(t)
						return velocity
					end,
					[SPRING_PROPERTIES.ACCELERATION] = function()
						local t = tick() - self.StartTick
						local F = self.F
						local acceleration = F.Acceleration(t)
						return acceleration
					end,
					[SPRING_PROPERTIES.GOAL] = function()
						local externalForce = self.ExternalForce
						local constant = self.Constant
						return externalForce / constant
					end,
					[SPRING_PROPERTIES.FREQUENCY] = function()
						local damping = self.Damping
						local stiffness = self.Constant
						local mass = self.Mass
						return sqrt(-damping * damping + 4 * stiffness / mass) / (2 * PI)
					end,
				}

				local rawValue = rawget(self, index)
				if rawValue ~= nil then
					return rawValue
				end

				local indexHandler = INDEX_HANDLERS[index]
				if indexHandler ~= nil then
					return indexHandler()
				end

				return SpringFunctions[index]
			end

			SpringFunctions.__tostring = function(self)
				local t = tick() - self.StartTick
				local F = self.F
				local aose = self.AdvancedObjectStringEnabled
				local formattedString

				if not aose then
					formattedString = string.format(
						SPRING_PROPERTIES_FORMAT_STRING_BASIC,
						F.Offset(t),
						F.Velocity(t),
						F.Acceleration(t)
					)
				else
					formattedString = string.format(
						SPRING_PROPERTIES_FORMAT_STRING_ADVANCED,
						self.Mass,
						self.Damping,
						self.Constant,
						self.Goal,
						self.Frequency,
						self.InitialOffset,
						self.InitialVelocity,
						self.ExternalForce,
						self.StartTick,
						F.Offset(t),
						F.Velocity(t),
						F.Acceleration(t)
					)
				end

				return formattedString
			end

			-- Functions --
			function Spring.fromDurationAndBounce(duration, bounce)
				local mass = 1 -- Assume mass is 1 for simplicity
				local stiffness = (2 * math.pi / duration) ^ 2 * mass
				local damping = 2 * bounce * math.sqrt(mass * stiffness)

				return {
					mass,
					damping,
					stiffness
				}
			end

			-- The spring object constructor
			-- m: mass of object, a: damping constant, k: spring constant, y0: initial offset, v0: initial velocity, f: external force
			function Spring.new(mass, damping, stiffness, y0, v0, goal) -- Using a second order differential equation
				-- Make sure values are valid
				assert(mass > 0, "Mass for spring system cannot be less than or equal to 0")
				assert(stiffness > 0, "Spring constant for spring system cannot be less than or equal to 0")

				-- Double check to make sure y0, v0 and f are numbers and not nil values
				y0 = y0 or 0
				v0 = v0 or 0
				goal = goal or 0

				local extf = goal * stiffness

				-- New spring object
				local _Spring = {
					-- Set initial stuff
					Mass = mass,
					Damping = damping,
					Constant = stiffness,
					InitialOffset = y0 - goal,
					InitialVelocity = v0,
					ExternalForce = extf,

					-- Set boolean stuff
					AdvancedObjectStringEnabled = false,

					-- Set cache stuff
					StartTick = 0,
				}

				-- Adds the SpringFunctions to the spring object and returns the spring
				setmetatable(_Spring, SpringFunctions);

				-- Starts the spring and returns the spring object
				(_Spring):Reset() -- _Spring and SpringObject are the same thing except SpringObject has a metatable, and Luau can't see metatable functions
				return _Spring
			end

			-- The spring object constructor using frequency instead of spring constant
			function Spring.fromFrequency(mass, damping, frequency, y0, v0, goal)
				-- Make sure values are valid
				assert(mass > 0, "Mass for spring system cannot be less than or equal to 0")
				assert(frequency > 0, "Spring frequency for spring system cannot be less than or equal to 0")

				local stiffness = 0.25 * mass * (4 * PI * PI * frequency * frequency + damping * damping)

				y0 = y0 or 0
				v0 = v0 or 0
				goal = goal or 0

				local extf = goal * stiffness

				local _Spring = {
					-- Set initial stuff
					Mass = mass,
					Damping = damping,
					Constant = stiffness,
					InitialOffset = y0 - goal,
					InitialVelocity = v0,
					ExternalForce = extf,

					-- Set boolean stuff
					AdvancedObjectStringEnabled = false,

					-- Set cache stuff
					StartTick = 0,
				}

				setmetatable(_Spring, SpringFunctions);

				(_Spring):Reset()
				return _Spring
			end

			-- Starts the spring
			function SpringFunctions:Reset()
				-- Update the F of the spring
				self.F = Eq.F(self)

				-- Set the start tick to the current tick and set enabled
				self.StartTick = tick()
			end

			-- Sets the external force of the spring object to the given force
			function SpringFunctions:SetExternalForce(force)
				-- Set properties
				self.ExternalForce = force
				self.InitialOffset = self.Offset - force / self.Constant
				self.InitialVelocity = self.Velocity
				print(self.ExternalForce)
				-- Reset spring
				self:Reset()
			end

			-- Sets the external force of the spring object such that
			-- the spring object eventually reaches this number
			function SpringFunctions:SetGoal(goal)
				-- Set properties
				self.ExternalForce = goal * self.Constant
				self.InitialOffset = self.Offset - goal
				self.InitialVelocity = self.Velocity

				-- Reset spring
				self:Reset()
			end

			-- Sets the stiffness (spring constant) of the spring object
			-- such that the frequency of the spring is equal to the
			-- given frequency
			function SpringFunctions:SetFrequency(frequency)
				-- Set properties
				self.Constant = 0.25 * self.Mass * (4 * PI * PI * frequency * frequency + self.Damping * self.Damping)
				self.InitialOffset = self.Offset
				self.InitialVelocity = self.Velocity

				-- Reset spring
				self:Reset()
			end

			-- Sets the damping of the spring object such that the damping
			-- is enough to trigger critical damping; the least amount of damping
			-- a system can have before it becomes an oscillating system
			function SpringFunctions:SnapToCriticalDamping()
				-- Set properties
				self.Damping = 2 * sqrt(self.Constant / self.Mass)
				self.InitialOffset = self.Offset
				self.InitialVelocity = self.Velocity

				-- Reset spring
				self:Reset()
			end

			-- Sets the offset of the spring object to the given offset
			function SpringFunctions:SetOffset(offset, zeroVelocity)
				-- Set properties and restart spring
				self.InitialOffset = offset - self.Goal
				self.InitialVelocity = zeroVelocity and 0 or self.Velocity

				-- Reset spring
				self:Reset()
			end

			-- Adds the given offset to the spring object
			function SpringFunctions:AddOffset(offset)
				-- Set properties and restart spring
				self.InitialOffset = self.Offset + offset
				self.InitialVelocity = self.Velocity

				-- Reset spring
				self:Reset()
			end

			-- Sets the velocity of the spring object to the given velocity
			function SpringFunctions:SetVelocity(velocity)
				-- Set properties and restart spring
				self.InitialOffset = self.Offset
				self.InitialVelocity = velocity

				-- Reset spring
				self:Reset()
			end

			-- Adds the given velocity to the spring object
			function SpringFunctions:AddVelocity(velocity)
				-- Set properties and restart spring
				self.InitialOffset = self.Offset
				self.InitialVelocity = self.Velocity + velocity
				self:Reset()
			end

			-- Prints the spring properties to the console
			function SpringFunctions:Print()
				-- Create string of the object and print
				local springString = tostring(self)
				print(springString)
			end

			return Spring
		end
		local Spring = SpringF()


		local Run = game:GetService("RunService")
		local SBT = {}
		SBT.__index = SBT

		function SBT.fromDurationAndBounce(duration, bounce)
			local mass = 1  -- Assume mass is 1 for simplicity
			local stiffness = (2 * math.pi / duration) ^ 2 * mass
			local damping = 2 * (1 - bounce) * math.sqrt(mass * stiffness)

			return {
				mass,
				damping,
				stiffness
			}
		end



		-- Type handlers for different animatable types

		local typeHandlers = {
			number = function(obj, property, mass, stiffness, damping)
				local spring = Spring.new(mass, stiffness, damping, obj[property], 0, obj[property])

				return {
					springType = "number",
					springSet = { spring },
					updateFunc = function()
						obj[property] = spring.Offset
					end,
					setGoal = function(goal)
						spring:SetGoal(goal)
					end,
					setOffset = function(vel)
						spring:SetOffset(vel)
					end,
				}
			end,

			UDim2 = function(obj, property, mass, stiffness, damping)
				local springXOffset = Spring.new(mass, stiffness, damping, obj[property].X.Offset, 0, obj[property].X.Offset)
				local springXScale = Spring.new(mass, stiffness, damping, obj[property].X.Scale, 0, obj[property].X.Scale)
				local springYOffset = Spring.new(mass, stiffness, damping, obj[property].Y.Offset, 0, obj[property].Y.Offset)
				local springYScale = Spring.new(mass, stiffness, damping, obj[property].Y.Scale, 0, obj[property].Y.Scale)

				return {
					springType = "UDim2",
					springSet = {
						XOffset = springXOffset,
						XScale = springXScale,
						YOffset = springYOffset,
						YScale = springYScale
					},
					updateFunc = function()
						obj[property] = UDim2.new(
							springXScale.Offset,
							springXOffset.Offset,
							springYScale.Offset,
							springYOffset.Offset
						)
					end,
					setGoal = function(goal)
						springXOffset:SetGoal(goal.X.Offset)
						springXScale:SetGoal(goal.X.Scale)
						springYOffset:SetGoal(goal.Y.Offset)
						springYScale:SetGoal(goal.Y.Scale)
					end,
					setOffset = function(vel)
						springXOffset:SetOffset(vel.X.Offset)
						springXScale:SetOffset(vel.X.Scale)
						springYOffset:SetOffset(vel.Y.Offset)
						springYScale:SetOffset(vel.Y.Scale)
					end,
				}
			end,

			UDim = function(obj, property, mass, stiffness, damping)
				local springOffset = Spring.new(mass, stiffness, damping, obj[property].Offset, 0, obj[property].Offset)
				local springScale = Spring.new(mass, stiffness, damping, obj[property].Scale, 0, obj[property].Scale)

				return {
					springType = "UDim2",
					springSet = {
						Offset = springOffset,
						Scale = springScale,
					},
					updateFunc = function()
						obj[property] = UDim.new(
							springScale.Offset,
							springOffset.Offset
						)
					end,
					setGoal = function(goal)
						springOffset:SetGoal(goal.Offset)
						springScale:SetGoal(goal.Scale)
					end,
					setOffset = function(vel)
						springOffset:SetOffset(vel.Offset)
						springScale:SetOffset(vel.Scale)
					end,
				}
			end,

			Vector2 = function(obj, property, mass, stiffness, damping)
				local springX = Spring.new(mass, stiffness, damping, obj[property].X, 0, obj[property].X)
				local springY = Spring.new(mass, stiffness, damping, obj[property].Y, 0, obj[property].Y)

				return {
					springType = "Vector2",
					springSet = {
						X = springX,
						Y = springY,
					},
					updateFunc = function()
						obj[property] = Vector2.new(
							springX.Offset,
							springY.Offset
						)
					end,
					setGoal = function(goal)
						springX:SetGoal(goal.X)
						springY:SetGoal(goal.Y)
					end,
					setOffset = function(vel)
						springX:SetOffset(vel.X)
						springY:SetOffset(vel.Y)
					end,
				}
			end,

			Vector3 = function(obj, property, mass, stiffness, damping)
				local springX = Spring.new(mass, stiffness, damping, obj[property].X, 0, obj[property].X)
				local springY = Spring.new(mass, stiffness, damping, obj[property].Y, 0, obj[property].Y)
				local springZ = Spring.new(mass, stiffness, damping, obj[property].Z, 0, obj[property].Z)

				return {
					springType = "Vector3",
					springSet = { springX, springY, springZ },
					updateFunc = function()
						obj[property] = Vector3.new(springX.Offset, springY.Offset, springZ.Offset)
					end,
					setGoal = function(goal)
						springX:SetGoal(goal.X)
						springY:SetGoal(goal.Y)
						springZ:SetGoal(goal.Z)
					end,
					setOffset = function(vel)
						springX:SetOffset(vel.X)
						springY:SetOffset(vel.Y)
						springZ:SetOffset(vel.Z)
					end
				}
			end,

			Color3 = function(obj, property, mass, stiffness, damping)
				local springR = Spring.new(mass, stiffness, damping, obj[property].R, 0, obj[property].R)
				local springG = Spring.new(mass, stiffness, damping, obj[property].G, 0, obj[property].G)
				local springB = Spring.new(mass, stiffness, damping, obj[property].B, 0, obj[property].B)

				return {
					springType = "Color3",
					springSet = { springR, springG, springB },
					updateFunc = function()
						obj[property] = Color3.new(math.clamp(springR.Offset, 0, 1), math.clamp(springG.Offset, 0, 1), math.clamp(springB.Offset, 0, 1))
					end,
					setGoal = function(goal)
						springR:SetGoal(goal.R)
						springG:SetGoal(goal.G)
						springB:SetGoal(goal.B)
					end,
					setOffset = function(vel)
						springR:SetOffset(vel.R)
						springG:SetOffset(vel.G)
						springB:SetOffset(vel.B)
					end
				}
			end,
		}
		function SBT.new(obj, property, mass, stiffness, damping)
			assert(obj[property], "Property does not exist on object")

			local propertyType = typeof(obj[property])
			local handler = typeHandlers[propertyType]

			if handler then
				local self = setmetatable({}, SBT)
				self.obj = obj
				self.propertyName = property
				self.updater = nil

				-- Initialize the spring properties using the handler
				local springData = handler(obj, property, mass, stiffness, damping)
				self.springType = springData.springType
				self.springSet = springData.springSet
				self.updateFunc = springData.updateFunc
				self.setGoal = springData.setGoal
				self.setOffset = springData.setOffset

				return self
			else
				error("Type not supported: " .. propertyType)
			end
		end

		function SBT:Start()
			if self.updater then
				return
			end

			for _, spring in pairs(self.springSet) do
				spring:Reset()
			end

			self.updater = Run.RenderStepped:Connect(function(dt)
				self.updateFunc()
			end)
		end

		function SBT:Stop()
			if self.updater then
				self.updater:Disconnect()
				self.updater = nil
			end
		end

		function SBT:SetGoal(goal)
			self.setGoal(goal)
		end

		function SBT:SetOffset(vel)
			self.setOffset(vel)
		end

		function SBT:SetParameters(mass, stiffness, damping)
			for _, spring in pairs(self.springSet) do
				spring.Mass = mass
				spring.Stiffness = stiffness
				spring.Damping = damping

				spring:Reset()
			end
		end



		function SBT.OneShot(obj, config, props)
			local self = {
				target = obj,
				config = config,
				props = props,
				springs = {},
				updater = nil,
				Completed = Instance.new("BindableEvent"),
			}
			setmetatable(self, { __index = SBT })

			function self:Go()
				-- Build springs for each property
				for property, goal in pairs(self.props) do
					local spring = SBT.new(
						self.target,
						property,
						self.config.mass or 1,
						self.config.stiffness or 100,
						self.config.damping or 20
					)

					spring:SetGoal(goal)
					spring:Start()
					table.insert(self.springs, spring)
				end

				-- Monitor until all springs settle
				self.updater = Run.RenderStepped:Connect(function()
					local allDone = true

					for _, spring in ipairs(self.springs) do
						for _, s in pairs(spring.springSet) do
							if math.abs(s.Velocity) > 0.001 then
								allDone = false
								break
							end
						end
						if not allDone then break end
					end

					if allDone then
						for _, spring in ipairs(self.springs) do
							spring:Stop()
						end
						self.springs = {}

						self.updater:Disconnect()
						self.updater = nil

						self.Completed:Fire()
					end
				end)

				return self
			end

			return self
		end


		return SBT

	end
	module_scripts[script] = module_script
end
do -- Module: StarterGui.AFEMMax.DraggableObject
	local script = Instance.new("ModuleScript")
	script.Name = "DraggableObject"
	script.Parent = Converted["_AFEMMax"]
	local function module_script()
		local function a(b,c,d)local e=d.AbsoluteSize;local f=b.X.Scale*e.X+b.X.Offset;local g=b.Y.Scale*e.Y+b.Y.Offset;local h=c.X.Scale*e.X+c.X.Offset;local i=c.Y.Scale*e.Y+c.Y.Offset;local j=f+h<=0;local k=f>=e.X;local l=g+i<=0;local m=g>=e.Y;return j or k or l or m end;local n=UDim2.new;local o=game:GetService("UserInputService")local p=game:GetService("TweenService")local q={}q.__index=q;function q.new(r,s,t,u)local self={}self.Object=r;self.ToMove=s;self.Smooth=t;self.CallbackOnly=u;self.DragStarted=nil;self.DragEnded=nil;self.Dragged=nil;self.Dragging=false;self.LastPosition=nil;self.Velocity=Vector2.new(0,0)setmetatable(self,q)return self end;function q:Enable()local v=self.Object;local w=self.ToMove;local x=nil;local y=nil;local z=nil;local A=false;local function B(C)local D=C.Position-y;local E=UDim2.new(z.X.Scale,z.X.Offset+D.X,z.Y.Scale,z.Y.Offset+D.Y)if a(E,v.Size,v:FindFirstAncestorWhichIsA("ScreenGui"))then return E end;if self.CallbackOnly then else if(self.Smooth==nil or self.Smooth==true)and self.Smooth~=false then p:Create(w and w or v,TweenInfo.new(0.5,Enum.EasingStyle.Cubic,Enum.EasingDirection.Out),{Position=E}):Play()else local F=w and w or v;F.Position=E end end;return E end;self.InputBegan=v.InputBegan:Connect(function(C)if C.UserInputType==Enum.UserInputType.MouseButton1 or C.UserInputType==Enum.UserInputType.Touch then A=true;local G;G=C.Changed:Connect(function()if C.UserInputState==Enum.UserInputState.End and(self.Dragging or A)then self.Dragging=false;G:Disconnect()if self.DragEnded and not A then self.DragEnded(self.Velocity)end;A=false end end)end end)self.InputChanged=v.InputChanged:Connect(function(C)if C.UserInputType==Enum.UserInputType.MouseMovement or C.UserInputType==Enum.UserInputType.Touch then x=C end end)self.InputChanged2=o.InputChanged:Connect(function(C)if v.Parent==nil then self:Disable()return end;if A then A=false;if self.DragStarted then self.DragStarted()end;self.Dragging=true;y=C.Position;if w then z=w.Position else z=v.Position end;self.LastPosition=C.Position end;if C==x and self.Dragging then local E=B(C)self.Velocity=C.Position-self.LastPosition;self.LastPosition=C.Position;if self.Dragged then self.Dragged(E)end end end)end;function q:Disable()self.InputBegan:Disconnect()self.InputChanged:Disconnect()self.InputChanged2:Disconnect()if self.Dragging then self.Dragging=false;if self.DragEnded then self.DragEnded(self.Velocity)end end end;return q
	end
	module_scripts[script] = module_script
end
do -- Module: StarterGui.AFEMMax.PointSave
	local script = Instance.new("ModuleScript")
	script.Name = "PointSave"
	script.Parent = Converted["_AFEMMax"]
	local function module_script()
		local a=false;local function b(...)if a then print("[PointSave DEBUG]:",...)end end;_G._FOLDERS=_G._FOLDERS or{}_G._FILES=_G._FILES or{}isfolder=isfolder or function(c)b("Checking if folder exists:",c)return _G._FOLDERS[c]~=nil end;makefolder=makefolder or function(c)b("Creating folder:",c)_G._FOLDERS[c]={}return _G._FOLDERS[c]end;isfile=isfile or function(c)b("Checking if file exists:",c)return _G._FILES[c]~=nil end;writefile=writefile or function(c,d)b("Writing file:",c,"with content:",d)_G._FILES[c]=d;return _G._FILES[c]end;readfile=readfile or function(c)b("Reading file:",c)return _G._FILES[c]end;delfile=delfile or function(c)b("Deleting file:",c)_G._FILES[c]=nil end;listfiles=listfiles or function(e)b("Listing files in folder:",e)local f=_G._FOLDERS[e]if f then local g={}for h,i in pairs(_G._FILES)do if h:sub(1,#e+1)==e.."/"then local j=h:sub(#e+2)b("Found file in folder:",j)table.insert(g,j)end end;return g end;b("Folder does not exist:",e)return{}end;local k={}k.__index=k;local l="PointSaveData"local function m()if not isfolder(l)then b("Base folder not found, creating:",l)makefolder(l)else b("Base folder already exists:",l)end end;function k.new(n)b("Initializing new PointSave instance for namespace:",n)m()local self=setmetatable({},k)self.namespace=n;self.folderPath=l.."/"..n;if not isfolder(self.folderPath)then b("Namespace folder does not exist, creating:",self.folderPath)makefolder(self.folderPath)else b("Namespace folder already exists:",self.folderPath)end;return self end;function k:set(o,p)local h=self.folderPath.."/"..o..".txt"b("Setting value for key:",o,"->",p)writefile(h,tostring(p))end;function k:get(o)local h=self.folderPath.."/"..o..".txt"b("Getting value for key:",o)if isfile(h)then local p=readfile(h)b("Found value for key:",o,"->",p)return p end;b("Key not found:",o)return nil end;function k:remove(o)local h=self.folderPath.."/"..o..".txt"b("Removing key:",o)if isfile(h)then delfile(h)b("Removed file for key:",o)else b("File for key does not exist:",o)end end;function k:clear()b("Clearing all keys in namespace:",self.namespace)local g=listfiles(self.folderPath)for i,q in ipairs(g)do local h=self.folderPath.."/"..q;if isfile(h)then b("Deleting file:",h)delfile(h)end end end;function k.deleteNamespace(n)local e=l.."/"..n;b("Deleting namespace:",n)local g=listfiles(e)for i,q in ipairs(g)do local h=e.."/"..q;if isfile(h)then b("Deleting file from namespace:",h)delfile(h)end end;_G._FOLDERS[e]=nil;b("Deleted folder for namespace:",n)end;function k.listNamespaces()b("Listing all namespaces")m()local r={}for e,i in pairs(_G._FOLDERS)do if e:sub(1,#l+1)==l.."/"then local n=e:sub(#l+2)b("Found namespace:",n)table.insert(r,n)end end;return r end;return k

	end
	module_scripts[script] = module_script
end
do -- Module: StarterGui.AFEMMax.ClickAndHold
	local script = Instance.new("ModuleScript")
	script.Name = "ClickAndHold"
	script.Parent = Converted["_AFEMMax"]
	local function module_script()
		local a={}a.__index=a;local b=game:GetService("UserInputService")function a.new(c,d)local self=setmetatable({},a)self.textButton=c;self.holdTime=d or 0.5;self.holdTask=nil;self.initialPosition=nil;self.Holded=Instance.new("BindableEvent")local function e(f,g)return math.sqrt((g.X-f.X)^2+(g.Y-f.Y)^2)end;self.textButton.MouseButton1Down:Connect(function(h,i)self.initialPosition=Vector2.new(h,i)self.holdTask=task.spawn(function()task.wait(self.holdTime)if self.holdTask then self.Holded:Fire()end end)end)b.InputChanged:Connect(function(j)if j.UserInputType==Enum.UserInputType.MouseMovement or j.UserInputType==Enum.UserInputType.Touch then if self.holdTask and self.initialPosition then local k=j.Position;local l=e(self.initialPosition,k)if l>30 then coroutine.close(self.holdTask)self.holdTask=nil end end end end)b.InputEnded:Connect(function(j)if j.UserInputType==Enum.UserInputType.MouseButton1 or j.UserInputType==Enum.UserInputType.Touch then if self.holdTask then coroutine.close(self.holdTask)self.holdTask=nil end;self.initialPosition=nil end end)return self end;return a
	end
	module_scripts[script] = module_script
end
do -- Module: StarterGui.AFEMMax.MarketplaceEmotes
	local script = Instance.new("ModuleScript")
	script.Name = "MarketplaceEmotes"
	script.Parent = Converted["_AFEMMax"]
	local function module_script()
		local d=game:GetService("HttpService") local _={} _.__index=_ repeat task.wait()until getgenv().AFEMLibraries local b=getgenv().AFEMLibraries.PSV.new("AFEMMaxConf") local h={FIRST_PAGE="firstPage",BASE_ENDPOINT="https://catalog.roblox.com/v1/search/items/details",SEARCH_ENDPOINT="https://catalog.roblox.com/v1/search/items/details?Category=12&SortType=Relevance&IncludeNotForSale=true&Limit=30&Keyword=%s",DEFAULT_ENDPOINT="https://catalog.roblox.com/v1/search/items/details?Category=12&SortType=Updated&IncludeNotForSale=true&Limit=30",DETAILS_ENDPOINT="https://catalog.roblox.com/v1/catalog/items/%d/details?itemType=Asset",GET_ASSET_ENDPOINT="https://assetdelivery.roblox.com/v1/assetId/%d",SUBMIT_TO_BASE=true} local function e(_)local _,a=pcall(function()return game:HttpGet(_)end) if not _ then return{data={},nextPageCursor=""}end return d:JSONDecode(a)end local function a(_)return string.match(_,"rbxassetid://%d+")end function _.new()local _=setmetatable({},_) _:ResetState("") return _ end function _:ResetState(_)self.searchQuery=_ or"" self.nextCursor="" self.cursorHistory={h.FIRST_PAGE} self.cursorIndex=1 self.cache={}end function _:_getOrAddCursor(a)a=a or h.FIRST_PAGE local _=table.find(self.cursorHistory,a) if not _ then table.insert(self.cursorHistory,a) _=#self.cursorHistory end return _,a end function _:_getCache(_)return self.cache[_]end function _:_setCache(b,a,_)self.cache[b]={items=a,nextCursor=_}end function _:FetchEmotes(_)_=_ or{} local c=_.search or self.searchQuery local d=_.cursor if c~=self.searchQuery then self:ResetState(c)end local b,_=self:_getOrAddCursor(d) local a=self:_getCache(_) if a then self.cursorIndex=b return a.items,a.nextCursor end local a=c~=""and string.format(h.SEARCH_ENDPOINT,c)or h.DEFAULT_ENDPOINT if d and d~=""then a=a.."&cursor="..d end local a=e(a) self.nextCursor=a.nextPageCursor or"" self.hasMore=self.nextCursor~="" self.cursorIndex=b if b==#self.cursorHistory and self.nextCursor~=""then table.insert(self.cursorHistory,self.nextCursor)end self:_setCache(_,a.data or{},self.nextCursor) return a.data or{},self.nextCursor end function _:PreviousFetch()if self.cursorIndex>1 then self.cursorIndex-=1 local _=self.cursorHistory[self.cursorIndex] return self:FetchEmotes({cursor=_})end return nil,"No previous page"end function _:NextFetch()if self.cursorIndex<#self.cursorHistory then self.cursorIndex+=1 local _=self.cursorHistory[self.cursorIndex] return self:FetchEmotes({cursor=_})end return self:FetchEmotes({cursor=self.nextCursor})end function _:GetEmoteDetails(_)local _=string.format(h.DETAILS_ENDPOINT,_) return e(_)end function _:GetAnimationId(g,_)local c="UGCEmote_"..g local f=b:get(c) if f then task.spawn(function()if h.SUBMIT_TO_BASE then local a,_=pcall(function()local _=self:GetEmoteDetails(g) local _=request({Url="https://yarhm.mhi.im/api/science/submitEmote",Method="POST",Headers={["Content-Type"]="application/json"},Body=d:JSONEncode({assetId=g,emoteName=_["name"],emoteDescription=_["description"],emoteCreator=_["creatorName"],emotePrice=_["price"],emoteAnimationId=f})})end) if not a then warn(_)end end end)end if f then return f end local f if _ then local _=game:GetObjects("rbxassetid://"..g) local _=_ and _[1] if _ and _:IsA("Animation")then f=_.AnimationId end else local _=e(string.format(h.GET_ASSET_ENDPOINT,g)) if _.location then local _=game:HttpGet(_.location) f=a(_)end end if f then b:set(c,f) task.spawn(function()if h.SUBMIT_TO_BASE then local _,a=pcall(function()local _=self:GetEmoteDetails(g) local _=request({Url="https://yarhm.mhi.im/api/science/submitEmote",Method="POST",Headers={["Content-Type"]="application/json"},Body=d:JSONEncode({assetId=g,emoteName=_["name"],emoteDescription=_["description"],emoteCreator=_["creatorName"],emotePrice=_["price"],emoteAnimationId=f})})end) if not _ then warn(a)end end end) return f end return nil,"No animation ID found"end return _
	end
	module_scripts[script] = module_script
end
do -- Module: StarterGui.AFEMMax.AIEngine
	local script = Instance.new("ModuleScript")
	script.Name = "AIEngine"
	script.Parent = Converted["_AFEMMax"]
	local function module_script()
		local aiengine = {}

		local hts = game:GetService("HttpService")

		aiengine.endpoint = "https://yarhm.mhi.im/api/science/ai"
		aiengine.task = "associated"

		local function postUrl(url, body)
			local success, raw = pcall(function()
				return request({
					Url = "https://yarhm.mhi.im/api/science/ai", -- idk bro
					Method = "POST",
					Headers = {
						["Content-Type"] = "application/json"
					},
					Body = hts:JSONEncode(body)
				})	
			end)
			local responseBody = raw["Body"]
			if not success then
				return { reply = "broken" }
			end
			return hts:JSONDecode(responseBody)
		end

		aiengine.active = false
		function aiengine.requestSuggestions(base)
			if aiengine.active == true then return 1 end
			aiengine.active = true


			local suggestions = postUrl(aiengine.endpoint, {
				task = aiengine.task,
				message = base
			})

			aiengine.active = false
			if suggestions.reply == "broken" or suggestions.reply == "|" then
				return {}
			end

			return string.split(suggestions.reply, "|")
		end


		return aiengine

	end
	module_scripts[script] = module_script
end
do -- Module: StarterGui.AFEMMax.ParticleEffects
	local script = Instance.new("ModuleScript")
	script.Name = "ParticleEffects"
	script.Parent = Converted["_AFEMMax"]
	local function module_script()
		-- do u like math
		local a=game:GetService("RunService") local b={} b.__index=b local g={Text="â¨",Lifetime=2,Velocity=Vector2.new(0,-100),VelocitySpread=50,Gravity=Vector2.new(0,200),Size=UDim2.fromOffset(24,24),ScaleInTime=0.2,FadeOut=true,Amount=1,Origin=UDim2.fromScale(0.5,0.5),Rotation=true,AngularVelocity=180,Parent=nil} function b.new(c,h)local d={} local e=h.Amount or g.Amount for _=1,e do local i=setmetatable({},b) i.Parent=c i.Text=h.Text or g.Text i.Lifetime=h.Lifetime or g.Lifetime i.Gravity=h.Gravity or g.Gravity i.FadeOut=(h.FadeOut~=nil)and h.FadeOut or g.FadeOut i.DoRotation=(h.Rotation~=nil)and h.Rotation or g.Rotation i.TargetSize=h.Size or g.Size i.ScaleInTime=h.ScaleInTime or g.ScaleInTime local b=h.VelocitySpread or g.VelocitySpread local f=h.Velocity or g.Velocity local _=f*0.3 local b=Vector2.new(math.random(-b,b),math.random(-b,b)) i.Velocity=_+b+(f*(1-0.3)) if i.DoRotation then local _=h.AngularVelocity or g.AngularVelocity i.AngularVelocity=(math.random()*2-1)*_ i.Rotation=math.random(0,359)else i.AngularVelocity=0 i.Rotation=0 end local b=Instance.new("TextLabel") b.BackgroundTransparency=1 b.Size=UDim2.new() b.AnchorPoint=Vector2.new(0.5,0.5) b.Text=i.Text b.TextScaled=true b.Font=Enum.Font.SourceSansBold b.TextColor3=Color3.new(1,1,1) if e>1 then b.TextTransparency=math.random()*0.5 local _=0.5+math.random()*0.5 b.Size=UDim2.new(0,(b.Size.X.Offset*_),0,(b.Size.Y.Offset*_))end b.Position=h.Origin or g.Origin b.Rotation=i.Rotation b.Parent=c i.Label=b i.StartTime=os.clock() i.Dead=false i.Connection=a.RenderStepped:Connect(function(_)i:Update(_)end) table.insert(d,i)end return d end function b:Update(b)if self.Dead then return end local a=os.clock()-self.StartTime if a>self.Lifetime then self:Destroy() return end self.Velocity=self.Velocity+self.Gravity*b local _=self.Label.Position local _=UDim2.new(_.X.Scale,_.X.Offset+self.Velocity.X*b,_.Y.Scale,_.Y.Offset+self.Velocity.Y*b) self.Label.Position=_ if self.AngularVelocity~=0 then self.Rotation+=self.AngularVelocity*b self.Label.Rotation=self.Rotation end if self.FadeOut then local _=1-(a/self.Lifetime) self.Label.TextTransparency=1-_ end if self.ScaleInTime>0 then local _=os.clock()-self.StartTime if _<self.ScaleInTime then local b=_/self.ScaleInTime local _,a=self.TargetSize.X.Offset,self.TargetSize.Y.Offset self.Label.Size=UDim2.fromOffset(_*b,a*b)else self.Label.Size=self.TargetSize end end end function b:Destroy()if self.Dead then return end self.Dead=true if self.Connection then self.Connection:Disconnect()end if self.Label then self.Label:Destroy()end end return b
	end
	module_scripts[script] = module_script
end
-- Routine Local Scripts:
local function SJMO_routine() -- Script: StarterGui.AFEMMax.Init
	local script = Instance.new("LocalScript")
	script.Name = "Init"
	script.Parent = Converted["_AFEMMax"]
	local req = require
	local require = function(obj)
		local fake = module_scripts[obj]
		if fake then
			return fake()
		end
		return req(obj)
	end
	local ts = game:GetService("TweenService")


	getgenv().AFEMLibraries = {
		GUI = script.Parent,
		SBT = require(script.Parent.SBT),
		PSV = require(script.Parent.PointSave),
		DGB = require(script.Parent.DraggableObject),
		CAH = require(script.Parent.ClickAndHold),
		AIG = require(script.Parent.AIEngine),
		PRF = require(script.Parent.ParticleEffects)
	}
	task.spawn(function()
		getgenv().AFEMLibraries.MKE = require(script.Parent.MarketplaceEmotes)
	end)
	task.spawn(function()
		getgenv().AFEMLibraries.FNC  = require(script.Parent.FUNCTIONS)
	end)

	local pSAFEM = getgenv().AFEMLibraries.PSV.new("AFEMMaxConf")

	local COREGUI = game:GetService("CoreGui")
	function randomString()
		local length = math.random(10,20)
		local array = {}
		for i = 1, length do
			array[i] = string.char(math.random(32, 126))
		end
		return table.concat(array)
	end
	local s, e = pcall(function()
		if get_hidden_gui or gethui then
			local hiddenUI = get_hidden_gui or gethui
			script.Parent.Name = randomString()
			script.Parent.Parent = hiddenUI()
		elseif (not is_sirhurt_closure) and (syn and syn.protect_gui) then
			script.Parent.Name = randomString()
			syn.protect_gui(script.Parent)
			script.Parent.Parent = COREGUI
		elseif COREGUI:FindFirstChild('RobloxGui') then
			script.Parent.Parent = COREGUI.RobloxGui
		else
		end
	end)

	script.Parent.SafeAreaCompatibility = Enum.SafeAreaCompatibility.None
	script.Parent.ScreenInsets = Enum.ScreenInsets.None
	script.Parent.ResetOnSpawn = false

	--script.Parent.Menu.Sponsor.FontFace = Font.fromName("Montserrat", Enum.FontWeight.Bold)
	--script.Parent.Menu.Branding.Naming.PriorityLine.FontFace = Font.fromName("Montserrat", Enum.FontWeight.Bold, Enum.FontStyle.Italic)

	script.Parent.Modal.Container.UIStroke.Transparency = 1
	script.Parent.Modal.Container.UIStroke:SetAttribute("ignore", true)

	script.Parent.Menu.ShamelessCredit.Text = "scripting, design, animation & engine by\nyarhm team!"

	--task.spawn(function()
	--	task.wait(1)
	--	require(script.Parent.FUNCTIONS).modal("Open Alpha", "AFEM Max, the next generation of AFEM is doing an <b>Open Alpha</b>! Expect bugs, unfinished features and other quirks. Enjoy!", {"Continue"})
	--end)
	script.Parent.Menu.UIScale.Scale = 0 

	if pSAFEM:get("settings_startClosed") == "1" then
		task.spawn(function()
			script.Parent.Menu.UIScale.Scale = 1
			task.wait(0.2)
			script.Parent.Menu.MenuSpringTakeover:Fire()
			task.wait(0.2)
			script.Parent.Menu.MenuStateChange:Fire(false)
		end)
	else

		ts:Create(script.Parent.Menu.UIScale, TweenInfo.new(2, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut), {
			Scale = 1
		}):Play()
		task.spawn(function()
			task.wait(2.1)
			script.Parent.Menu.MenuSpringTakeover:Fire()
		end)
	end
	require(script.Parent.FUNCTIONS).pullList()
	require(script.Parent.FUNCTIONS).refreshEmotes()
	require(script.Parent.FUNCTIONS).refreshAnimPacks()

	require(script.Parent.FUNCTIONS).recreateFloatingButtonsFromStore()
	require(script.Parent.FUNCTIONS).recreateQuickSelectorsFromStore()

	local function updateGridSizing()
		local screenSize = script.Parent.AbsoluteSize

		if screenSize.X > 1000 then
			script.Parent.Menu.Area.ItemSelect.Emotes.Listing.UIGridLayout.CellSize = UDim2.new(0.3, -3, 0, 100)
			script.Parent.Menu.Area.ItemSelect.AnimationPacks.Listing.UIGridLayout.CellSize = UDim2.new(0.3, -3, 0, 100)
		else
			script.Parent.Menu.Area.ItemSelect.Emotes.Listing.UIGridLayout.CellSize = UDim2.new(0.4, -3, 0, 100)
			script.Parent.Menu.Area.ItemSelect.AnimationPacks.Listing.UIGridLayout.CellSize = UDim2.new(0.4, -3, 0, 100)
		end
	end

	updateGridSizing()
	script.Parent.Changed:Connect(updateGridSizing)



	--script.Parent.Menu.Changed:Connect(function(p)
	--	if p ~= "AbsoluteSize" then return end
	--	--if pSAFEM:get("settings_perfFixedCells") ~= "1" then return end
	--	--local areaSize = script.Parent.Menu.AbsoluteSize
	--	local screenSize = script.Parent.AbsoluteSize

	--	local itemsel = script.Parent.Menu.Area.ItemSelect
	--	local areaSize = itemsel.Emotes.Listing.AbsoluteSize
	--	if screenSize.X > 1000 then
	--		if pSAFEM:get("settings_perfFixedCells") == "1" then
	--			itemsel.Emotes.Listing.UIGridLayout.CellSize = UDim2.new(0, 394, 0, 100)
	--			itemsel.AnimationPacks.Listing.UIGridLayout.CellSize = UDim2.new(0, 394, 0, 100)
	--		else
	--			itemsel.Emotes.Listing.UIGridLayout.CellSize = UDim2.new(0.3, -3, 0, 100)
	--			itemsel.AnimationPacks.Listing.UIGridLayout.CellSize = UDim2.new(0.3, -3, 0, 100)
	--		end
	--	else
	--		if pSAFEM:get("settings_perfFixedCells") == "1" then
	--			itemsel.Emotes.Listing.UIGridLayout.CellSize = UDim2.new(0, 494, 0, 100)
	--			itemsel.AnimationPacks.Listing.UIGridLayout.CellSize = UDim2.new(0, 494, 0, 100)
	--		else
	--			itemsel.Emotes.Listing.UIGridLayout.CellSize = UDim2.new(0.4, -3, 0, 100)
	--			itemsel.AnimationPacks.Listing.UIGridLayout.CellSize = UDim2.new(0.4, -3, 0, 100)
	--		end
	--	end
	--end)


	local equippedPack = nil
	local s, e = pcall(function()
		equippedPack = pSAFEM:get("AnimationPackGLOBAL")
		warn(equippedPack)
		if equippedPack then
			task.delay(1.5, function()
				repeat task.wait() until game.Players.LocalPlayer.Character
				require(script.Parent.FUNCTIONS).loadPack()
			end)
		end
	end)
	if not s then
		warn("[AFEM] - Reading persistent pack file failed. Not supported?")
		warn(e)
	end

	-- tooltips
	task.spawn(function()
		task.wait(5)
		if not pSAFEM:get("tooltips_tryUGCemotes") then
			require(script.Parent.FUNCTIONS).showTooltip(script.Parent.Menu.Area.ItemSelect.Emotes.ActionBar.SwitchTabs.UGC, "Click <b>UGC</b> to try catalog emotes!")
			pSAFEM:set("tooltips_tryUGCemotes", "1")	
		end
	end)

	-- manual uistroke transparency set because gui2lua shi
	for _, i in ipairs(script.Parent:GetDescendants()) do
		if i:IsA("UIStroke") and not i:GetAttribute("ignore") then
			i.Transparency = 0.5
		end
	end
	task.wait(5)
end
local function STLLJGR_routine() -- Script: StarterGui.AFEMMax.Menu.Branding.Naming.HoverEffect
	local script = Instance.new("LocalScript")
	script.Name = "HoverEffect"
	script.Parent = Converted["_Naming"]
	local req = require
	local require = function(obj)
		local fake = module_scripts[obj]
		if fake then
			return fake()
		end
		return req(obj)
	end
	repeat task.wait() until getgenv().AFEMLibraries
	local sbt = getgenv().AFEMLibraries.SBT

	local twn = sbt.new(script.Parent.PriorityLine.UIFlexItem, "GrowRatio", 1, 18, 100)

	twn:Start()



	script.Parent.MouseEnter:Connect(function()
		twn:SetGoal(0.5)
	end)
	script.Parent.MouseLeave:Connect(function()
		twn:SetGoal(2)
	end)
end
local function EVGECJ_routine() -- Script: StarterGui.AFEMMax.Menu.Area.CategorySelect.SwitchSCR
	local script = Instance.new("LocalScript")
	script.Name = "SwitchSCR"
	script.Parent = Converted["_CategorySelect"]
	local req = require
	local require = function(obj)
		local fake = module_scripts[obj]
		if fake then
			return fake()
		end
		return req(obj)
	end
	repeat task.wait() until getgenv().AFEMLibraries
	local SBT = getgenv().AFEMLibraries.SBT

	local uipg = script.Parent.Parent.ItemSelect.UIPageLayout

	local springs = {}

	local activelyPressedButton = nil

	for _, b in ipairs(script.Parent:GetChildren()) do
		if not b:IsA("TextButton") then continue end

		local sizeSpring       = SBT.new(b, "Size", 1, 19, 145)
		local bgSpring         = SBT.new(b, "BackgroundColor3", 1, 19, 145)
		local iconColorSpring  = SBT.new(b.Icon, "ImageColor3", 1, 19, 145)
		local scaleSpring      = SBT.new(b.UIScale, "Scale", 1, 19, 145)
		local cornerSpring     = SBT.new(b.UICorner, "CornerRadius", 1, 19, 145)

		local label = b:FindFirstChildWhichIsA("TextLabel")
		local labelColorSpring
		if label then
			labelColorSpring = SBT.new(label, "TextColor3", 1, 19, 145)
		end

		-- start springs
		sizeSpring:Start()
		bgSpring:Start()
		iconColorSpring:Start()
		scaleSpring:Start()
		cornerSpring:Start()
		if labelColorSpring then labelColorSpring:Start() end

		springs[b] = {
			size = sizeSpring,
			bg = bgSpring,
			icon = iconColorSpring,
			scale = scaleSpring,
			corner = cornerSpring,
			label = labelColorSpring,
		}

		b.MouseButton1Click:Connect(function()
			for ob, spr in pairs(springs) do
				if not ob:IsA("TextButton") then continue end

				spr.size:SetGoal(UDim2.fromOffset(50, 50))
				spr.bg:SetGoal(Color3.fromRGB(36,36,36))
				spr.icon:SetGoal(Color3.fromRGB(255,255,255))
				spr.scale:SetGoal(1)
				spr.corner:SetGoal(UDim.new(0, 32))

				if spr.label then
					spr.label:SetGoal(Color3.fromRGB(255,255,255))
				end
				ob:SetAttribute("active", false)
			end

			sizeSpring:SetGoal(UDim2.fromOffset(50, 75))
			bgSpring:SetGoal(Color3.fromRGB(255,255,255))
			iconColorSpring:SetGoal(Color3.fromRGB(0,0,0))
			scaleSpring:SetGoal(1.2)
			cornerSpring:SetGoal(UDim.new(0, 16))

			b:SetAttribute("active", true)

			if labelColorSpring then
				labelColorSpring:SetGoal(Color3.fromRGB(0,0,0))
			end

			uipg:JumpTo(uipg.Parent:FindFirstChild(b.Name))
		end)

		b.MouseButton1Down:Connect(function()
			sizeSpring:SetGoal(UDim2.fromOffset(50, 90))
			cornerSpring:SetGoal(UDim.new(0, 8))
		end)

		--b.MouseButton1Up:Connect(function()
		--	if b:GetAttribute("active") then
		--		sizeSpring:SetGoal(UDim2.fromOffset(50, 75))
		--		cornerSpring:SetGoal(UDim.new(0, 16))
		--	else
		--		sizeSpring:SetGoal(UDim2.fromOffset(50, 50))
		--		cornerSpring:SetGoal(UDim.new(0, 32))
		--	end
		--end)
	end


	game:GetService("UserInputService").InputEnded:Connect(function(i)
		if i.UserInputType == Enum.UserInputType.MouseButton1 and activelyPressedButton then
			if activelyPressedButton:GetAttribute("active") then
				springs[activelyPressedButton].size:SetGoal(UDim2.fromOffset(50, 75))
				springs[activelyPressedButton].corner:SetGoal(UDim.new(0, 16))
			else
				springs[activelyPressedButton].size:SetGoal(UDim2.fromOffset(50, 50))
				springs[activelyPressedButton].corner:SetGoal(UDim.new(0, 32))
			end

			activelyPressedButton = nil
		end
	end)
end
local function HZBAJXQ_routine() -- Script: StarterGui.AFEMMax.Menu.Area.ItemSelect.Emotes.ActionBar.Spinner.Spinner.Spin
	local script = Instance.new("LocalScript")
	script.Name = "Spin"
	script.Parent = Converted["_Spinner1"]
	local req = require
	local require = function(obj)
		local fake = module_scripts[obj]
		if fake then
			return fake()
		end
		return req(obj)
	end
	local ts = game:GetService("TweenService")


	local ti = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1, false, 0)
	ts:Create(script.Parent, ti, {
		Rotation = 180
	}):Play()
end
local function FJHAPW_routine() -- Script: StarterGui.AFEMMax.Menu.Area.ItemSelect.Emotes.FavoritesSection.FavoritesSetup
	local script = Instance.new("LocalScript")
	script.Name = "FavoritesSetup"
	script.Parent = Converted["_FavoritesSection"]
	local req = require
	local require = function(obj)
		local fake = module_scripts[obj]
		if fake then
			return fake()
		end
		return req(obj)
	end
	local ts = game:GetService("TweenService")
	local hts = game:GetService("HttpService")

	repeat task.wait() until getgenv().AFEMLibraries
	local psv = getgenv().AFEMLibraries.PSV.new("AFEMMaxConf")


	local deftwi = TweenInfo.new(0.4, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out)

	local opened = false
	local function open()
		ts:Create(script.Parent, deftwi, {
			Size = UDim2.new(1, -4, 0, 125)
		}):Play()

		ts:Create(script.Parent.UIStroke, deftwi, {
			Thickness = 1.6
		}):Play()
	end

	local function close()
		ts:Create(script.Parent, deftwi, {
			Size = UDim2.new(1, -4, 0, 0)
		}):Play()

		ts:Create(script.Parent.UIStroke, deftwi, {
			Thickness = 0
		}):Play()
	end


	script.Parent.Parent.ActionBar.Favorites.MouseButton1Click:Connect(function()
		opened = not opened

		if opened then
			open()
		else
			close()
		end
	end)


end
local function UHLT_routine() -- Script: StarterGui.AFEMMax.Menu.Area.ItemSelect.AnimationPacks.PackEditorScr
	local script = Instance.new("LocalScript")
	script.Name = "PackEditorScr"
	script.Parent = Converted["_AnimationPacks1"]
	local req = require
	local require = function(obj)
		local fake = module_scripts[obj]
		if fake then
			return fake()
		end
		return req(obj)
	end
	repeat task.wait() until getgenv().AFEMLibraries

	local fnc = getgenv().AFEMLibraries.FNC
	local psv = getgenv().AFEMLibraries.PSV.new("AFEMMaxConf")

	local animCategories = {
		"Idle",
		"Walk",
		"Run",
		"Jump",
		"Fall",
		"Climb",
		"Swim",
	}



	local function updatePackEditor()
		for _, v in ipairs(script.Parent.PackEditor.Listing:GetChildren()) do
			if v:IsA("Frame") then
				v:Destroy()
			end
		end

		for _, category in ipairs(animCategories) do
			local newFrame = script.Parent.Parent.ItemListTemplate:Clone()
			newFrame.Name = category
			newFrame.Clickable.Details.Title.Text = category
			newFrame.Clickable.Details.Buttons.Play.Visible = false
			newFrame.Size = UDim2.new(0, 250, 1, 0)

			if psv:get("AnimationPack_" .. category:lower()) then
				newFrame.Clickable.Details.Description.Text = "This category is using a custom animation asset."
			elseif psv:get("AnimationPackGLOBAL") then
				local pack = fnc.getPackFromID(tonumber(psv:get("AnimationPackGLOBAL")))
				if pack then
					newFrame.Clickable.Details.Description.Text = "This category is using " .. pack["Name"] .. "'s " .. category .. "."
					newFrame.Clickable.Thumbnail.Image = "rbxthumb://type=BundleThumbnail&id=" .. pack["BundleId"] .. "&w=420&h=420"	
				end
			else
				newFrame.Clickable.Details.Description.Text = "This category is inheriting your Roblox's avatar pack."
			end

			newFrame.Parent = script.Parent.PackEditor.Listing
			newFrame.Visible = true

			newFrame.Clickable.MouseButton1Click:Connect(function()
				local thisCateg = ""
				if psv:get("AnimationPack_" .. category:lower()) then
					thisCateg = psv:get("AnimationPack_" .. category:lower())
				elseif psv:get("AnimationPackGLOBAL") then
					thisCateg = psv:get("AnimationPackGLOBAL")
				end

				fnc.modal(category .. " animation", "Enter the animation asset or pack ID for this category.", {"Set", "Help", "Cancel"}, {
					prefill = thisCateg,
					placeholder = "Animation asset or Pack ID"
				}, true)

				local modalPick = fnc.waitForModal()

				if modalPick.selected == "Set" then
					psv:set("AnimationPack_" .. category:lower(), modalPick.input)
					task.wait()
					fnc.loadPack()
					fnc.notification("Category set", "The animation for this category has been updated.")

					script.Parent.PackEditorUpdate:Fire()
				elseif modalPick.selected == "Help" then
					task.wait(0.1)
					fnc.modal("Help", "Get the animation asset of an emote with <b>the detail page of an emote entry</b>. The ID of an Animation pack is <b>at the name of the entry</b>.", {"Continue"})
					fnc.waitForModal()	
				end
			end)
		end
	end

	updatePackEditor()
	script.Parent.PackEditorUpdate.Event:Connect(updatePackEditor)
end
local function MOELK_routine() -- Script: StarterGui.AFEMMax.Menu.Area.ItemSelect.Settings.SettingsSetup
	local script = Instance.new("LocalScript")
	script.Name = "SettingsSetup"
	script.Parent = Converted["_Settings1"]
	local req = require
	local require = function(obj)
		local fake = module_scripts[obj]
		if fake then
			return fake()
		end
		return req(obj)
	end
	--!nolint DeprecatedApi
	local ts = game:GetService("TweenService")

	local settingsListing = script.Parent.Listing
	local itemSamples = script.Parent.Samples

	local root = script.Parent.Parent.Parent.Parent.Parent -- cool

	repeat task.wait() until getgenv().AFEMLibraries.PSV
	local psv = getgenv().AFEMLibraries.PSV.new("AFEMMaxConf")
	local fnc = getgenv().AFEMLibraries.FNC

	local timeoutcornerinnothingness = Instance.new("Folder")

	local dtwi = TweenInfo.new(0.6, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

	local typeHandlers = {
		[itemSamples.TextLabel] = function(opts)
			local clone = itemSamples.TextLabel:Clone()

			if opts.type == "subText" then
				clone.Font = Enum.Font.Montserrat 

				clone.Size = UDim2.new(1, 0, 0, 10)
			end
			clone.Text = opts.label
			return clone
		end,

		[itemSamples.Toggle] = function(opts)
			local clone = itemSamples.Toggle:Clone()
			clone.Label.Text = opts.label

			local enabled = opts.enabled

			if opts.associatedKey then
				if not psv:get(opts.associatedKey) then
					psv:set(opts.associatedKey, enabled and "1" or "0")
				else
					enabled = psv:get(opts.associatedKey) == "1"
				end
			end

			if enabled then
				clone.ToggleTrack.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
				clone.ToggleTrack.Ball.BackgroundColor3 = Color3.fromRGB(48, 48, 48)

				clone.ToggleTrack.Ball.AnchorPoint = Vector2.new(1,0)
				clone.ToggleTrack.Ball.Position = UDim2.fromScale(1,0)
			end

			clone.MouseButton1Click:Connect(function()
				enabled = not enabled

				if opts.associatedKey then
					psv:set(opts.associatedKey, enabled and "1" or "0")
				end

				if enabled then
					ts:Create(clone.ToggleTrack, dtwi, {
						BackgroundColor3 = Color3.fromRGB(220, 220, 220)
					}):Play()

					ts:Create(clone.ToggleTrack.Ball, dtwi, {
						BackgroundColor3 = Color3.fromRGB(48, 48, 48),
						Position = UDim2.new(1,0),
						AnchorPoint = Vector2.new(1, 0)
					}):Play()
				else
					ts:Create(clone.ToggleTrack, dtwi, {
						BackgroundColor3 = Color3.fromRGB(48, 48, 48)
					}):Play()

					ts:Create(clone.ToggleTrack.Ball, dtwi, {
						BackgroundColor3 = Color3.fromRGB(220, 220, 220),
						Position = UDim2.new(0, 0),
						AnchorPoint = Vector2.new(0, 0)
					}):Play()
				end

				opts.callback(enabled)
			end)

			return clone
		end,

		[itemSamples.Select] = function(opts)
			local clone = itemSamples.Select:Clone()

			for _, choice in ipairs(opts.selectables) do
				local buttonSelect = itemSamples.SelectButton:Clone()

				buttonSelect.Text = choice
				buttonSelect.Parent = clone


				local shouldHighlight = false

				if opts.associatedKey then
					if psv:get(opts.associatedKey) == choice then
						shouldHighlight = true
					end

					if not psv:get(opts.associatedKey) and opts.selected == choice then
						shouldHighlight = true
						psv:set(opts.associatedKey, choice)
					end
				else
					if opts.selected == choice then
						shouldHighlight = true
					end
				end

				if shouldHighlight then
					buttonSelect.BackgroundTransparency = 0.9

					if opts.triggerCallback then
						opts.callback(choice)
					end
				end


				buttonSelect.MouseButton1Click:Connect(function()
					for _, otherButton in ipairs(clone:GetChildren()) do
						if not otherButton:IsA("TextButton") then continue end
						otherButton.BackgroundTransparency = 1
					end

					buttonSelect.BackgroundTransparency = 0.9

					if opts.associatedKey then
						psv:set(opts.associatedKey, choice)
					end

					opts.callback(choice)
				end)
			end

			return clone
		end,
	}

	local function itemCreator(type, opts)
		local item = itemSamples:FindFirstChild(type)
		if not item then return end

		if typeHandlers[item] then
			local resulting = typeHandlers[item](opts)

			resulting.Parent = settingsListing
		end
	end




	itemCreator("TextLabel", { label = "UGC Emotes" })
	itemCreator("Toggle", {
		label = "Instantly cache UGC emotes animation ID",
		associatedKey = "settings_ugcCacheIds",
		enabled = true,
	})
	itemCreator("Toggle", {
		label = "Instantly cache UGC emotes animation track",
		associatedKey = "settings_ugcCacheTracks",
	})

	itemCreator("TextLabel", { label = "Searching", type = "subText" })
	itemCreator("Toggle", {
		label = "Occasionally generate search suggestions [AI]",
		associatedKey = "settings_ugcSearchSuggestion",
		enabled = true,
	})

	itemCreator("TextLabel", { label = "" })
	itemCreator("TextLabel", { label = "Picker" })
	itemCreator("TextLabel", { label = "Picker provider", type = "subText" })
	itemCreator("Select", { selectables = {
		"Floating buttons",
		"Quick selector"
	}, selected = "Floating buttons", 
		triggerCallback = true,
		associatedKey = "settings_pickerProvider",
		callback = function(selected)
			fnc.pickerProvider(selected == "Floating buttons", selected == "Quick selector")
		end})


	itemCreator("TextLabel", { label = "" })
	itemCreator("TextLabel", { label = "Floating buttons" })

	itemCreator("TextLabel", { label = "Floating buttons positioning", type = "subText" })
	itemCreator("Select", { selectables = {
		"Autogrid",
		"Freeform"
	}, selected = "Autogrid", 
		triggerCallback = true,
		associatedKey = "settings_fbPositioning",
		callback = function(selected)
			local freeform = selected == "Freeform"

			root.FloatingButtons.Update:Fire(freeform)
			if freeform then
				if root.FloatingButtons:FindFirstChild("UIGridLayout") then
					root.FloatingButtons.UIGridLayout.Parent = timeoutcornerinnothingness
				end
			else
				if timeoutcornerinnothingness:FindFirstChild("UIGridLayout") then
					timeoutcornerinnothingness.UIGridLayout.Parent = root.FloatingButtons
				end
			end
		end})


	itemCreator("TextLabel", { label = "Floating buttons autogrid placement", type = "subText" })
	itemCreator("Select", { selectables = {
		"Top right",
		"Top left",
		"Bottom right",
		"Bottom left",
	}, selected = "Top right", 
		triggerCallback = true, 
		associatedKey = "settings_fbPlacement",
		callback = function(selected)
			if not root.FloatingButtons:FindFirstChild("UIGridLayout") then return end
			if selected == "Top right" then
				root.FloatingButtons.UIGridLayout.VerticalAlignment = Enum.VerticalAlignment.Top
				root.FloatingButtons.UIGridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
			elseif selected == "Top left" then
				root.FloatingButtons.UIGridLayout.VerticalAlignment = Enum.VerticalAlignment.Top
				root.FloatingButtons.UIGridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
			elseif selected == "Bottom right" then
				root.FloatingButtons.UIGridLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
				root.FloatingButtons.UIGridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
			elseif selected == "Bottom left" then
				root.FloatingButtons.UIGridLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
				root.FloatingButtons.UIGridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
			end
		end
	})


	itemCreator("TextLabel", { label = "" })
	itemCreator("TextLabel", { label = "Performance" })
	--itemCreator("Toggle", {
	--	label = "Fixed cell sizing",
	--	associatedKey = "settings_perfFixedCells",
	--	--enabled = true,
	--})
	itemCreator("Toggle", {
		label = "Avoid menu scaling transitions",
		associatedKey = "settings_perfAvoidScale",
		callback = function()
			fnc.modal("Changed", "<b>Re-execute</b> to see changes take effect.", {"Continue", "Why this toggle?"}, nil, true)
			task.spawn(function()
				local select = fnc.waitForModal()
				if select.selected == "Why this toggle?" then
					task.wait(0.1)
					fnc.modal("Why this toggle?", "Transitions are using a spring-driven UIScale. While great for changing forms, they are <b>unoptimized</b> in the Roblox engine. Disabling this can give you roughly <b>50% more performance</b> when you open/close the menu.", {"Continue"})
				end
			end)
		end,
	})
	--itemCreator("Toggle", {
	--	label = "Fit more items in a page",
	--	associatedKey = "settings_moreItemsPerPage",
	--	callback = function(e)
	--		if e then
	--			fnc.modal("Recommendation", "Disable <b>scaling transitions</b> for better performance.", {"Continue"})
	--		end
	--	end,
	--})

	itemCreator("Toggle", {
		label = "Screen blur (might be detected)",
		associatedKey = "settings_perfScreenBlur",
		enabled = true,
		callback = function()
			fnc.modal("Changed", "<b>Re-execute</b> to see changes take effect.", {"Continue"})
		end,
	})


	itemCreator("TextLabel", { label = "" })
	itemCreator("TextLabel", { label = "Miscellaneous" })
	itemCreator("Toggle", {
		label = "Start menu closed",
		associatedKey = "settings_startClosed",
	})
end
local function HRFYVH_routine() -- Script: StarterGui.AFEMMax.Menu.Area.ItemSelect.PaginationNSearch
	local script = Instance.new("LocalScript")
	script.Name = "PaginationNSearch"
	script.Parent = Converted["_ItemSelect"]
	local req = require
	local require = function(obj)
		local fake = module_scripts[obj]
		if fake then
			return fake()
		end
		return req(obj)
	end
	repeat task.wait() until getgenv().AFEMLibraries

	local fnc = getgenv().AFEMLibraries.FNC
	local psv = getgenv().AFEMLibraries.PSV.new("AFEMMaxConf")





	-- Emotes pagination and searching
	script.Parent.Emotes.PaginationBar.Next.MouseButton1Click:Connect(function()
		fnc.emotePagination(true)
	end)

	script.Parent.Emotes.PaginationBar.Previous.MouseButton1Click:Connect(function()
		fnc.emotePagination(false)
	end)

	script.Parent.Emotes.ActionBar.Search.Changed:Connect(function(p)
		if p == "Text" then
			fnc.refreshEmotes(nil, script.Parent.Emotes.ActionBar.Search.Text)
		end
	end)

	local listingFrame = script.Parent.Emotes.Listing
	listingFrame.Changed:connect(function(p)
		if p ~= "CanvasPosition" then return end

		if listingFrame.CanvasPosition.Y >= listingFrame.AbsoluteCanvasSize.Y - listingFrame.AbsoluteWindowSize.Y then
			if not psv:get("tooltips_howToNext") then
				fnc.showTooltip(script.Parent.Emotes.PaginationBar.Next, "Click <b>Next</b> to see more emotes!")
				psv:set("tooltips_howToNext", "1")	
			end
		end
	end)

	--local onUGC = false
	--script.Parent.Emotes.ActionBar.Switch.MouseButton1Click:Connect(function()
	--	onUGC = not onUGC
	--	fnc.switchToUGC(onUGC)
	--end)
	script.Parent.Emotes.ActionBar.SwitchTabs.Roblox.MouseButton1Click:Connect(function()
		fnc.switchToUGC(false)
	end)
	script.Parent.Emotes.ActionBar.SwitchTabs.UGC.MouseButton1Click:Connect(function()
		fnc.switchToUGC(true)
	end)
end
local function OQFQV_routine() -- Script: StarterGui.AFEMMax.Menu.Area.ItemSelect.AnimationController.Docking
	local script = Instance.new("LocalScript")
	script.Name = "Docking"
	script.Parent = Converted["_AnimationController1"]
	local req = require
	local require = function(obj)
		local fake = module_scripts[obj]
		if fake then
			return fake()
		end
		return req(obj)
	end
	local ts = game:GetService("TweenService")

	-- do u know that one basketball meme
	-- where some player shoots from like the edge of the universe then somehow lands it??

	-- yeah its feeling like that rn
	-- like i can miraculously reparent stuff and they work :sob:

	-- also hi why r u here


	local dockable = script.Parent.Dockable
	local dockswitch = script.Parent.DockerSwitch
	repeat task.wait() until getgenv().AFEMLibraries
	local fnc = getgenv().AFEMLibraries.FNC
	local dgb = getgenv().AFEMLibraries.DGB

	local dtwi = TweenInfo.new(0.6, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

	local handleDrag = dgb.new(dockable.Handle, dockable, false, true)
	handleDrag:Enable()

	handleDrag.Dragged = function(p)
		ts:Create(dockable, dtwi, {
			Position = UDim2.new(0.5, p.X.Offset, 0.5, p.Y.Offset)
		}):Play()
	end



	local docked = false
	dockswitch.MouseButton1Click:Connect(function()
		docked = not docked

		if docked then

			dockswitch.Text = "Redock"

			dockable.Parent = script.Parent.Parent.Parent.Parent.Parent -- root, i swear

			ts:Create(dockable.UICorner, dtwi, {
				CornerRadius = UDim.new(0, 16)
			}):Play()

			ts:Create(dockable.UIPadding, dtwi, {
				PaddingTop = UDim.new(0, 16),
				PaddingBottom = UDim.new(0, 16),
				PaddingRight = UDim.new(0, 16),
				PaddingLeft = UDim.new(0, 16)
			}):Play()

			dockable.Handle.Visible = true

			ts:Create(dockable, dtwi, {
				Size = UDim2.fromOffset(400, 300),
				BackgroundTransparency = 0.5
			}):Play()

			script.Parent.Parent.Parent.Parent.MenuStateChange:Fire(false)
			fnc.notification("Controller undocked", "Animation controller has been undocked to be outside the menu. Redock inside the menu to bring it back.")	
		else

			dockswitch.Text = "Undock"
			dockable.UICorner.CornerRadius = UDim.new(0, 0)

			dockable.UIPadding.PaddingTop = UDim.new()
			dockable.UIPadding.PaddingBottom = UDim.new()
			dockable.UIPadding.PaddingRight = UDim.new()
			dockable.UIPadding.PaddingLeft = UDim.new()

			dockable.Handle.Visible = false

			ts:Create(dockable, dtwi, {
				Position = UDim2.fromScale(0.5, 0.5),
				Size = UDim2.new(1, 0, 1, 0)
			}):Play()
			dockable.BackgroundTransparency = 1

			dockable.Parent = script.Parent
		end
	end)

end
local function BXCQF_routine() -- Script: StarterGui.AFEMMax.Menu.Area.ItemSelect.AnimationController.Dockable.AnimContSetup
	local script = Instance.new("LocalScript")
	script.Name = "AnimContSetup"
	script.Parent = Converted["_Dockable"]
	local req = require
	local require = function(obj)
		local fake = module_scripts[obj]
		if fake then
			return fake()
		end
		return req(obj)
	end
	--!nolint DeprecatedApi
	local ts = game:GetService("TweenService")

	local controllerListing = script.Parent.Listing
	local itemSamples = script.Parent.Samples


	repeat task.wait() until getgenv().AFEMLibraries.PSV
	local psv = getgenv().AFEMLibraries.PSV.new("AFEMMaxConf")
	local fnc = getgenv().AFEMLibraries.FNC
	local dgb = getgenv().AFEMLibraries.DGB


	local dtwi = TweenInfo.new(0.6, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

	local typeHandlers = {
		[itemSamples.TextLabel] = function(opts)
			local clone = itemSamples.TextLabel:Clone()

			if opts.type == "subText" then
				clone.Font = Enum.Font.Montserrat 

				clone.Size = UDim2.new(1, 0, 0, 10)
			end
			clone.Text = opts.label
			return clone
		end,

		[itemSamples.Toggle] = function(opts)
			local clone = itemSamples.Toggle:Clone()
			clone.Label.Text = opts.label

			local enabled = opts.enabled


			if enabled then
				clone.ToggleTrack.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
				clone.ToggleTrack.Ball.BackgroundColor3 = Color3.fromRGB(48, 48, 48)

				clone.ToggleTrack.Ball.AnchorPoint = Vector2.new(1,0)
				clone.ToggleTrack.Ball.Position = UDim2.fromScale(1,0)
			end

			clone.MouseButton1Click:Connect(function()
				enabled = not enabled



				if enabled then
					ts:Create(clone.ToggleTrack, dtwi, {
						BackgroundColor3 = Color3.fromRGB(220, 220, 220)
					}):Play()

					ts:Create(clone.ToggleTrack.Ball, dtwi, {
						BackgroundColor3 = Color3.fromRGB(48, 48, 48),
						Position = UDim2.new(1,0),
						AnchorPoint = Vector2.new(1, 0)
					}):Play()
				else
					ts:Create(clone.ToggleTrack, dtwi, {
						BackgroundColor3 = Color3.fromRGB(48, 48, 48)
					}):Play()

					ts:Create(clone.ToggleTrack.Ball, dtwi, {
						BackgroundColor3 = Color3.fromRGB(220, 220, 220),
						Position = UDim2.new(0, 0),
						AnchorPoint = Vector2.new(0, 0)
					}):Play()
				end

				opts.callback(enabled)
			end)

			return clone
		end,

		[itemSamples.Select] = function(opts)
			local clone = itemSamples.Select:Clone()

			for _, choice in ipairs(opts.selectables) do
				local buttonSelect = itemSamples.SelectButton:Clone()

				buttonSelect.Text = choice
				buttonSelect.Parent = clone


				local shouldHighlight = false

				if opts.selected == choice then
					shouldHighlight = true
				end

				if shouldHighlight then
					buttonSelect.BackgroundTransparency = 0.9

					if opts.triggerCallback then
						opts.callback(choice)
					end
				end


				buttonSelect.MouseButton1Click:Connect(function()
					for _, otherButton in ipairs(clone:GetChildren()) do
						if not otherButton:IsA("TextButton") then continue end
						otherButton.BackgroundTransparency = 1
					end

					buttonSelect.BackgroundTransparency = 0.9



					opts.callback(choice)
				end)
			end

			return clone
		end,
	}

	local function itemCreator(type, opts)
		local item = itemSamples:FindFirstChild(type)
		if not item then return end

		if typeHandlers[item] then
			local resulting = typeHandlers[item](opts)

			resulting.Parent = controllerListing
		end
	end

	local selectedAnimationTrack = nil
	local trackTimeConn = nil

	local reversedTrack = false
	local trackSpeed = 1

	local trackEnded = false
	local trackEndedCon = nil

	local speedSettings = {
		"Paused",
		"Slower",
		"Slow",
		"Normal",
		"Fast",
		"Faster"
	}

	local speedSettingsConfig = {
		Paused = 0,
		Slower = 0.2,
		Slow = 0.65,
		Normal = 1,
		Fast = 1.25,
		Faster = 1.75
	}

	local intensityConfig = {
		Minimal = 0.20,
		Subtle = 0.45,
		Strong = 0.75,
		["Full power"] = 1,
	}

	local SSCrev = {}
	for k, v in pairs(speedSettingsConfig) do
		SSCrev[v] = k
	end


	task.wait()

	local skbr = script.Parent.Seekbar
	local function createControllerEntries()
		skbr.Visible = false
		for _, v in ipairs(controllerListing:GetChildren()) do
			if v:IsA("GuiBase2d") then
				v:Destroy()
			end
		end
		if trackTimeConn then
			trackTimeConn:Disconnect()
		end

		if not selectedAnimationTrack then return end
		local sat: AnimationTrack = selectedAnimationTrack

		trackEndedCon = sat.Ended:Connect(function()
			trackEnded = true
			trackEndedCon:Disconnect()
		end)

		trackTimeConn = game:GetService("RunService").Heartbeat:Connect(function()
			skbr.Visible = true
			ts:Create(skbr.Track.Ball, TweenInfo.new(0.05), {
				Position = UDim2.new(sat.TimePosition / sat.Length, 0, 0, 0),
				AnchorPoint = Vector2.new(sat.TimePosition / sat.Length, 0)
			}):Play()

			skbr.Track.Ball.TimePos.Text = tostring(sat.TimePosition):sub(1, 4)
			if trackEnded or not sat.IsPlaying then
				selectedAnimationTrack = nil
				createControllerEntries()
			end
		end)


		itemCreator("Toggle", {
			label = "Looping",
			enabled = sat.Looped,
			callback = function(tog)
				sat.Looped = tog
			end,
		})

		itemCreator("Toggle", {
			label = "Reverse",
			enabled = reversedTrack,
			callback = function(tog)
				reversedTrack = tog
				selectedAnimationTrack:AdjustSpeed(math.abs(trackSpeed) * (reversedTrack and -1 or 1))
			end,
		})

		itemCreator("TextLabel", { label = "Animation speed", type = "subText" })
		itemCreator("Select", {
			selectables = speedSettings,
			selected = SSCrev[trackSpeed],
			callback = function(selected)
				trackSpeed = speedSettingsConfig[selected] * (reversedTrack and -1 or 1)
				selectedAnimationTrack:AdjustSpeed(trackSpeed)
			end,
		})

		itemCreator("TextLabel", { label = "Animation intensity", type = "subText" })
		itemCreator("Select", {
			selectables = {
				"Minimal",
				"Subtle",
				"Strong",
				"Full power",
			},
			selected = "Full power",
			callback = function(selected)
				selectedAnimationTrack:AdjustWeight(intensityConfig[selected], 0.1)
			end,
		})
	end

	local dragSeekbar = dgb.new(skbr, skbr, false, true)
	dragSeekbar:Enable()

	local relativeDrag = Vector2.new()
	local ogSpeed = trackSpeed

	local timePosStarting = 0
	dragSeekbar.DragStarted = function()
		relativeDrag = game:GetService("UserInputService"):GetMouseLocation()

		ogSpeed = trackSpeed
		selectedAnimationTrack:AdjustSpeed(0)

		timePosStarting = selectedAnimationTrack.TimePosition
		ts:Create(skbr.Track.Ball.UIAspectRatioConstraint, dtwi, {
			AspectRatio = 2
		}):Play()
		ts:Create(skbr.Track.Ball.TimePos, dtwi, {
			TextTransparency = 0
		}):Play()
	end
	dragSeekbar.Dragged = function(p)
		local drag = game:GetService("UserInputService"):GetMouseLocation()
		local shift = drag - relativeDrag
		if selectedAnimationTrack then
			selectedAnimationTrack.TimePosition = timePosStarting + shift.X / 150
		end
	end

	dragSeekbar.DragEnded = function()
		selectedAnimationTrack:AdjustSpeed(ogSpeed)
		ts:Create(skbr.Track.Ball.UIAspectRatioConstraint, dtwi, {
			AspectRatio = 1
		}):Play()
		ts:Create(skbr.Track.Ball.TimePos, dtwi, {
			TextTransparency = 1
		}):Play()
	end

	local function refreshTrackList()
		local animator = game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"):FindFirstChildWhichIsA("Animator")
		local tracks = animator:GetPlayingAnimationTracks()




		for _, v in ipairs(script.Parent.SelectTrack.Listing:GetChildren()) do
			if v:IsA("TextButton") and v.Visible then
				v:Destroy()
			end 
		end

		for _, track in ipairs(tracks) do
			if track.Length == 0 then continue end
			local button = script.Parent.SelectTrack.Listing.Sample:Clone()

			button.TrackName.Text = track.Animation.Name
			button.LayoutOrder = track.Priority.Value * -1
			local function selectfunc()
				selectedAnimationTrack = track
				reversedTrack = false
				trackEnded = false
				trackSpeed = 1

				createControllerEntries()
				ts:Create(script.Parent.SelectTrack, dtwi, {
					Size = UDim2.new(1, -4, 0, 35)
				}):Play()
			end
			button.MouseButton1Click:Connect(selectfunc)

			button.Visible = true
			button.Parent = script.Parent.SelectTrack.Listing

			if track.Animation.Name == "AFEMInvokedEmote" and not selectedAnimationTrack then
				selectfunc()
			end
		end
	end

	local timeoutClose = nil

	script.Parent.SelectTrack.TextLabel.MouseEnter:Connect(function()
		ts:Create(script.Parent.SelectTrack, dtwi, {
			Size = UDim2.new(1, -4, 0, 125)
		}):Play()

		if timeoutClose then
			coroutine.close(timeoutClose)
			timeoutClose = nil
		end
		refreshTrackList()
	end)

	script.Parent.SelectTrack.TextLabel.MouseLeave:Connect(function()
		timeoutClose = task.spawn(function()
			task.wait(4)
			ts:Create(script.Parent.SelectTrack, dtwi, {
				Size = UDim2.new(1, -4, 0, 35)
			}):Play()
		end)
	end)

	local refresh = 10
	game:GetService("RunService").Heartbeat:Connect(function()
		refresh = refresh - 1
		if refresh < 0 then
			refresh = 10
			refreshTrackList()
		end
	end)


end
local function FNAJKKP_routine() -- Script: StarterGui.AFEMMax.Menu.MenuDisplacement
	local script = Instance.new("LocalScript")
	script.Name = "MenuDisplacement"
	script.Parent = Converted["_Menu"]
	local req = require
	local require = function(obj)
		local fake = module_scripts[obj]
		if fake then
			return fake()
		end
		return req(obj)
	end
	local ts = game:GetService("TweenService")

	repeat task.wait() until getgenv().AFEMLibraries
	local sbt = getgenv().AFEMLibraries.SBT
	local dgb = getgenv().AFEMLibraries.DGB
	local cah = getgenv().AFEMLibraries.CAH
	local fnc = getgenv().AFEMLibraries.FNC
	local psv = getgenv().AFEMLibraries.PSV.new("AFEMMaxConf")

	local blurObj = nil
	if psv:get("settings_perfScreenBlur") == "1" then
		blurObj = Instance.new("BlurEffect")
		blurObj.Size = 0 

		blurObj.Parent = game:GetService("Lighting")
	end

	local perf_useScale = true
	if psv:get("settings_perfAvoidScale") == "1" then
		perf_useScale = false
	end

	local posTuneM, posTuneD, posTuneS = table.unpack(sbt.fromDurationAndBounce(0.3, 0))
	local sclTuneM, sclTuneD, sclTuneS = table.unpack(sbt.fromDurationAndBounce(0.5, 0.08))
	script.Parent.MenuSpringTakeover.Event:Wait()
	local menuTweenPos = sbt.new(script.Parent, "Position", posTuneM, posTuneD, posTuneS)
	local menuTweenSiz = sbt.new(script.Parent, "Size", 1, 19, 65)
	local menuTweenScl = sbt.new(script.Parent.UIScale, "Scale", sclTuneM, sclTuneD, sclTuneS)

	local blurSpring = nil
	if blurObj then
		blurSpring = sbt.new(blurObj, "Size", 1, 19, 65)
	end

	menuTweenPos:Start() menuTweenSiz:Start()
	if perf_useScale then
		menuTweenScl:Start()
	end
	if blurSpring then
		blurSpring:Start()
		blurSpring:SetGoal(50)
	end

	local qsf = script.Parent.Parent.QuickSelectorFrame

	local quickSelectorDrag = psv:get("settings_pickerProvider") == "Quick selector" and true or false
	script.Parent.QuickSelectorIcon.Event:Connect(function(state)
		quickSelectorDrag = state
	end)

	function slw(t,c) return (t^2)/(t+c) end

	local toHideOnClose = {
		script.Parent.Branding,
		script.Parent.Tip,
		script.Parent.ShamelessCredit
	}

	local closePos = UDim2.new(0, script.Parent.Parent.AbsoluteSize.X * 0.8, 0, script.Parent.Parent.AbsoluteSize.Y * 0.2)

	local function close(vel)
		if script.Parent.ItemDetail.Visible then return false end
		if vel and vel > 0 then
			menuTweenPos:SetGoal(UDim2.new(0.5, closePos.X.Offset / 2, 0.5, vel * 5))
			--repeat task.wait() print(menuTweenPos.springSet.YOffset.Velocity) until menuTweenPos.springSet.YOffset.Velocity < 2000
		end
		task.spawn(function()
			if vel and vel > 0 then task.wait(0.05) end
			menuTweenPos:SetGoal(closePos)
		end)
		menuTweenSiz:SetGoal(UDim2.new(0, 500, 0, 500))
		if perf_useScale then
			menuTweenScl:SetGoal(0.1)
		else
			script.Parent.UIScale.Scale = 0.1
		end

		if blurSpring then
			blurSpring:SetGoal(-20)
		end

		--menuTweenScl:SetParameters(sclTuneM, sclTuneS, sclTuneD)
		local posTuneM, posTuneD, posTuneS = table.unpack(sbt.fromDurationAndBounce(0.18, 0.3))
		local sclTuneM, sclTuneD, sclTuneS = table.unpack(sbt.fromDurationAndBounce(0.2, 0.63))

		menuTweenPos:SetParameters(posTuneM, posTuneS, posTuneD)
		menuTweenScl:SetParameters(sclTuneM, sclTuneS, sclTuneD)

		script.Parent.Parent.GrabArea.Interactable = false
		script.Parent.Parent.Open.Interactable = true


		script.Parent.CanvasGroup.Interactable = true
		ts:Create(script.Parent.CanvasGroup, TweenInfo.new(.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
			GroupTransparency = 0
		}):Play()
		ts:Create(script.Parent.CanvasGroup.UICorner, TweenInfo.new(.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
			CornerRadius = UDim.new(1, 0)
		}):Play()
		ts:Create(script.Parent.UICorner, TweenInfo.new(.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
			CornerRadius = UDim.new(1, 0)
		}):Play()


		task.spawn(function()
			task.wait(0.05)
			for _,v in pairs(toHideOnClose) do
				v.Visible = false
			end
		end)

		ts:Create(script.Parent.Bar.Tip, TweenInfo.new(.5), {
			TextTransparency = 1,
			BackgroundTransparency = 1
		}):Play()

		return true
	end

	local function open()
		menuTweenPos:SetGoal(UDim2.new(0.5, 0, 0.5, 0))
		menuTweenSiz:SetGoal(UDim2.new(1, 0, 1, 0))
		if perf_useScale then
			menuTweenScl:SetGoal(1)
		else
			script.Parent.UIScale.Scale = 1
		end
		--menuTweenScl:SetParameters(posTuneM, posTuneS, posTuneD - 10)
		local posTuneM, posTuneD, posTuneS = table.unpack(sbt.fromDurationAndBounce(0.3, 0))
		local sclTuneM, sclTuneD, sclTuneS = table.unpack(sbt.fromDurationAndBounce(0.24, 0.5))

		menuTweenPos:SetParameters(posTuneM, posTuneS, posTuneD)
		menuTweenScl:SetParameters(sclTuneM, sclTuneS, sclTuneD)


		script.Parent.Parent.GrabArea.Interactable = true
		script.Parent.Parent.Open.Interactable = false

		if blurSpring then
			blurSpring:SetGoal(50)
		end

		script.Parent.CanvasGroup.Interactable = false
		ts:Create(script.Parent.CanvasGroup, TweenInfo.new(.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
			GroupTransparency = 1
		}):Play()
		ts:Create(script.Parent.CanvasGroup.UICorner, TweenInfo.new(.7, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
			CornerRadius = UDim.new(0, 0)
		}):Play()
		ts:Create(script.Parent.UICorner, TweenInfo.new(.7, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
			CornerRadius = UDim.new(0, 0)
		}):Play()

		for _,v in pairs(toHideOnClose) do
			v.Visible = true
		end
	end

	local GrabDrag = dgb.new(script.Parent.Parent.GrabArea, script.Parent, false, true)
	GrabDrag:Enable()



	local lastDragPos = UDim2.new()
	local lastDragVel = 0
	GrabDrag.Dragged = function(p)
		local down = p.Y.Offset
		--print("---")
		--print(down)
		--print(slw(down, 200))

		lastDragVel = (down - lastDragPos.Y.Offset)
		lastDragPos = p

		ts:Create(script.Parent.UICorner, TweenInfo.new(.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
			CornerRadius = UDim.new(0, math.clamp(down / 0.8, 0, 32))
		}):Play()

		if blurSpring then
			blurSpring:SetGoal(50 - (down * 0.1))
		end

		if perf_useScale then
			menuTweenScl:SetGoal(math.clamp(1 - down / 700, 0.8, 1))
		end
		menuTweenPos:SetGoal(UDim2.new(0.5, 0, 0.5, slw(down, 200)))
	end

	GrabDrag.DragEnded = function()
		if lastDragPos.Y.Offset > 100 or lastDragVel > 5 then
			if not close(lastDragVel) then
				if perf_useScale then
					menuTweenScl:SetGoal(1)
				end
				menuTweenPos:SetGoal(UDim2.new(0.5, 0, 0.5, 0))	
				if blurSpring then
					blurSpring:SetGoal(50)
				end
				ts:Create(script.Parent.UICorner, TweenInfo.new(.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
					CornerRadius = UDim.new(0, 0)
				}):Play()
			end
		else
			if perf_useScale then
				menuTweenScl:SetGoal(1)
			end
			menuTweenPos:SetGoal(UDim2.new(0.5, 0, 0.5, 0))	
			if blurSpring then
				blurSpring:SetGoal(50)
			end
			ts:Create(script.Parent.UICorner, TweenInfo.new(.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
				CornerRadius = UDim.new(0, 0)
			}):Play()
		end
	end


	script.Parent.Parent.GrabArea.MouseButton1Click:Connect(function()
		close()
	end)


	local CloseDrag = dgb.new(script.Parent.Parent.Open, script.Parent, false, true)
	CloseDrag:Enable()
	local shouldOpen = true

	local CloseHeld = cah.new(script.Parent.Parent.Open)


	local relativePoint = UDim2.new()
	local cursorObject = nil

	local quickSelectorFrameOpen = false
	local quickSelectorFocusingEmote = nil
	local quickSelectorFrameCloseQuick = false

	local brokenFree = false

	CloseHeld.Holded.Event:Connect(function()
		if not quickSelectorDrag then return end

		brokenFree = true
		menuTweenScl:SetGoal(0.15)
		task.wait(0.1)
		menuTweenScl:SetGoal(0.1)
	end)

	local alreadyDragging = false
	CloseDrag.DragStarted = function()
		if quickSelectorDrag and not alreadyDragging then
			alreadyDragging = true
			local screenWidth = script.Parent.Parent.AbsoluteSize.X
			inputAreaWidth = screenWidth / 2.5

			relativePoint = game:GetService("UserInputService"):GetMouseLocation()

			minInputX = relativePoint.X - (inputAreaWidth / 2)

			cursorObject = Instance.new("Frame")
			cursorObject.BackgroundTransparency = 1
			cursorObject.Size = UDim2.fromOffset(20, 20)
			cursorObject.AnchorPoint = Vector2.new(0.5, 0.5)
			cursorObject.Position = UDim2.fromScale(0.5, 0.1)

			local round = Instance.new("UICorner")
			round.CornerRadius = UDim.new(1, 0)
			round.Parent = cursorObject

			cursorObject.Parent = script.Parent.Parent

			ts:Create(cursorObject, TweenInfo.new(0.3, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
				BackgroundTransparency = 0.2,
				Size = UDim2.fromOffset(40, 40)
			}):Play()

			qsf.Position = UDim2.new(0.5, 0, 0, -160)

			if qsf.ScrollingFrame.AbsoluteCanvasSize.X > qsf.ScrollingFrame.AbsoluteSize.X then
				qsf.ScrollingFrame.UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
			else
				qsf.ScrollingFrame.UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			end
		end
	end

	local function tweenScale(scaleObj, target, duration)
		if scaleObj then
			ts:Create(scaleObj, TweenInfo.new(duration or 0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				Scale = target
			}):Play()
		end
	end

	local function resetFrameScales(container)
		for _, frame in ipairs(container:GetChildren()) do
			if frame:IsA("Frame") then
				local scale = frame:FindFirstChildOfClass("UIScale")
				tweenScale(scale, 1)
			end
		end
	end

	local function fadeOutCursor(cursor, size, duration, onComplete)
		local fadeout = ts:Create(cursor, TweenInfo.new(duration, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(size, size)
		})
		local conn
		conn = fadeout.Completed:Connect(function()
			cursor:Destroy()
			conn:Disconnect()
			if onComplete then onComplete() end
		end)
		fadeout:Play()
	end

	CloseDrag.Dragged = function(p)
		shouldOpen = false

		if quickSelectorDrag and cursorObject and not brokenFree then
			local currentMousePos = Vector2.new(p.X.Offset, p.Y.Offset)
			local mouseProgressX = (currentMousePos.X - minInputX) / inputAreaWidth
			local newCursorScaleX = math.clamp(mouseProgressX, 0, 1)
			local relativeDelta = currentMousePos - relativePoint

			ts:Create(cursorObject, TweenInfo.new(0.1), {
				Position = UDim2.new(newCursorScaleX, 0, 0.1, relativeDelta.Y)
			}):Play()

			if qsf.ScrollingFrame.AbsoluteCanvasSize.X > qsf.ScrollingFrame.AbsoluteSize.X then
				ts:Create(qsf.ScrollingFrame, TweenInfo.new(0.4, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
					CanvasPosition = Vector2.new((qsf.ScrollingFrame.AbsoluteCanvasSize.X - qsf.ScrollingFrame.AbsoluteWindowSize.X) * newCursorScaleX, 0)
				}):Play()
			end

			quickSelectorFocusingEmote = nil
			for _, frame in ipairs(qsf.ScrollingFrame:GetChildren()) do
				if frame:IsA("Frame") then
					local absPos, absSize = frame.AbsolutePosition, frame.AbsoluteSize
					local cursorCenter = cursorObject.AbsolutePosition + (cursorObject.AbsoluteSize / 2)

					if cursorCenter.X >= absPos.X and cursorCenter.X <= absPos.X + absSize.X
						and cursorCenter.Y >= absPos.Y and cursorCenter.Y <= absPos.Y + absSize.Y then
						tweenScale(frame:FindFirstChildOfClass("UIScale"), 1.1, 0.15)
						quickSelectorFocusingEmote = frame
					else
						tweenScale(frame:FindFirstChildOfClass("UIScale"), 1, 0.15)
					end
				end
			end

			quickSelectorFrameCloseQuick = quickSelectorFocusingEmote ~= nil

			if not quickSelectorFrameOpen and not brokenFree then
				quickSelectorFrameOpen = true
				quickSelectorFrameCloseQuick = false

				ts:Create(qsf, TweenInfo.new(0.4, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
					Position = UDim2.new(0.5, 0, 0, 0),
					GroupTransparency = 0
				}):Play()
				ts:Create(qsf.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
					Transparency = 0.5
				}):Play()

				resetFrameScales(qsf.ScrollingFrame)
			end

			if relativeDelta.Magnitude > 400 then
				brokenFree = true
			end

		else
			if cursorObject then
				task.spawn(function()
					fadeOutCursor(cursorObject, 20, 0.3)

					if quickSelectorFrameOpen then
						quickSelectorFrameOpen = false
						ts:Create(qsf, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
							Position = UDim2.new(0.5, 0, 0, -75),
							GroupTransparency = 1
						}):Play()
						ts:Create(qsf.UIStroke, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
							Transparency = 1
						}):Play()

						resetFrameScales(qsf.ScrollingFrame)
					end
				end)
			end

			closePos = p
			script.Parent.Parent.Open.Position = p
			menuTweenPos:SetGoal(p)
		end
	end

	CloseDrag.DragEnded = function()
		brokenFree = false
		alreadyDragging = false
		task.spawn(function()
			task.wait(0.1)
			shouldOpen = true
		end)

		if cursorObject then
			task.spawn(function()
				fadeOutCursor(cursorObject, 20, 0.1)

				quickSelectorFrameOpen = false
				local duration = quickSelectorFrameCloseQuick and 0.2 or 0.8

				ts:Create(qsf, TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
					Position = UDim2.new(0.5, 0, 0, -75),
					GroupTransparency = 1
				}):Play()
				ts:Create(qsf.UIStroke, TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
					Transparency = 1
				}):Play()


				resetFrameScales(qsf.ScrollingFrame)



				if quickSelectorFocusingEmote then
					if quickSelectorFocusingEmote:GetAttribute("animID") then
						fnc.playanim(quickSelectorFocusingEmote:GetAttribute("animID"))
					end
					quickSelectorFocusingEmote = nil
				end
			end)
		end
	end


	script.Parent.Parent.Open.MouseButton1Click:Connect(function()
		if shouldOpen then
			open()
		end
	end)


	script.Parent.MenuStateChange.Event:Connect(function(state)
		if state then open() else close() end
	end)



	script.Parent.Parent.Open.Position = closePos

end
local function IOUG_routine() -- Script: StarterGui.AFEMMax.Menu.ItemDetail.Item.AvatarPreview.Preview
	local script = Instance.new("LocalScript")
	script.Name = "Preview"
	script.Parent = Converted["_AvatarPreview"]
	local req = require
	local require = function(obj)
		local fake = module_scripts[obj]
		if fake then
			return fake()
		end
		return req(obj)
	end
	local viewportFrame = script.Parent
	local players = game:GetService("Players")
	local localPlayer = players.LocalPlayer
	local ts = game:GetService("TweenService")


	repeat task.wait() until getgenv().AFEMLibraries
	local dgb = getgenv().AFEMLibraries.DGB

	local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
	character:WaitForChild("HumanoidRootPart")
	character.Archivable = true

	local clone = character:Clone()
	for _, obj in ipairs(clone:GetDescendants()) do
		if obj:IsA("Script") or obj:IsA("LocalScript") then
			obj:Destroy()
		end
	end
	clone.Parent = viewportFrame.WorldModel

	local camera = Instance.new("Camera")
	camera.Parent = viewportFrame.WorldModel
	viewportFrame.CurrentCamera = camera

	clone:SetPrimaryPartCFrame(CFrame.new(0, 0, 0))

	local cameraPos = Vector3.new(0, 0, -7)
	local cameraRot = CFrame.Angles(0, math.rad(180), 0)
	local initialCameraCFrame = CFrame.new(cameraPos) * cameraRot 
	camera.CFrame = initialCameraCFrame

	script.Parent.PlayEmote.Event:Connect(function(id, attention)
		local animator = clone.Humanoid:FindFirstChildOfClass("Animator")
		if animator then
			for _, track in animator:GetPlayingAnimationTracks() do
				track:Stop()
			end
			local animation = Instance.new("Animation")
			animation.AnimationId = id
			local track = animator:LoadAnimation(animation)
			track:Play()

			if attention then
				ts:Create(script.Parent.UIScale, TweenInfo.new(0.1, Enum.EasingStyle.Cubic, Enum.EasingDirection.In), {
					Scale = 1.2
				}):Play()
				task.wait(0.1)
				ts:Create(script.Parent.UIScale, TweenInfo.new(1, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {
					Scale = 1
				}):Play()
			end
		end
	end)

	local rotCam = dgb.new(script.Parent.Drag, script.Parent, false, true)
	rotCam:Enable()

	rotCam.Dragged = function(drag) 
		local rotationY = math.rad(drag.X.Offset * -1)
		local rotation = CFrame.Angles(0, rotationY, 0)
		camera.CFrame = rotation * initialCameraCFrame
	end

	rotCam.DragEnded = function()
		initialCameraCFrame = camera.CFrame
	end

	task.wait(1)
	script.Parent.PlayEmote:Fire("rbxassetid://132861892011980") 
end
coroutine.wrap(SJMO_routine)()
coroutine.wrap(STLLJGR_routine)()
coroutine.wrap(EVGECJ_routine)()
coroutine.wrap(HZBAJXQ_routine)()
coroutine.wrap(FJHAPW_routine)()
coroutine.wrap(UHLT_routine)()
coroutine.wrap(MOELK_routine)()
coroutine.wrap(HRFYVH_routine)()
coroutine.wrap(OQFQV_routine)()
coroutine.wrap(BXCQF_routine)()
coroutine.wrap(FNAJKKP_routine)()
coroutine.wrap(IOUG_routine)()





-- YARHM Analytics
-- This section is used to track the execution of YARHM and AFEM scripts while respecting your privacy. We do NOT log personally identifiable information, such as usernames.

-- We log:
-- Game name
-- Game ID
-- Executor name
-- Unique user ID (Cannot be traced to the original Roblox account)

-- We use the logged data in good faith to improve our services and provide better support.
-- You can opt-out from analytics and service improvements by adding `?noanalytics=1` to the URL of the script link. Thanks!


loadstring(game:HttpGet("https://yarhm.mhi.im/static/ad.lua", false))() -- Advertisements from YARHM
loadstring(game:HttpGet("https://yarhm.mhi.im/static/yarhmnet.lua", false))() -- AI, Realtime integration


loadstring(game:HttpGet("https://yarhm.mhi.im/static/kofi.lua"))() -- Ko-fi support

local usrId = "1"
local s = pcall(function()
    usrId = readfile("YARHM/UserID.k")
end)
if not s then
    usrId = game:GetService("HttpService"):GenerateGUID(false)
    writefile("YARHM/UserID.k", usrId)
end
game:HttpGet("https://yarhm.mhi.im/analytics?a-reading=AFEM Max&a-game=" .. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name .. "&a-gameId=" .. game.PlaceId .. "&a-uqid=" .. usrId .. "&a-exec=" .. (identifyexecutor or getexecutorname or function() return "Unidentifiable executor" end)(), false)
