scriptName QF_ORD_AdvancedWorkshop_Ques_0103BB03 extends Quest hidden

referencealias property Alias_ORD_Player auto
referencealias property Alias_ORD_ArmorTableUpgrades auto
referencealias property Alias_ORD_ArmorTable auto
referencealias property Alias_ORD_Grindstone auto
referencealias property Alias_ORD_GrindstoneUpgrades auto
globalvariable property ORD_Smh_AdvancedWorkshop_Global_DisableAdvancedWorkshopModel auto

function Fragment_0()
	TryDelete(Alias_ORD_ArmorTableUpgrades)
	TryDelete(Alias_ORD_GrindstoneUpgrades)
    Alias_ORD_ArmorTableUpgrades.Clear()
    Alias_ORD_GrindstoneUpgrades.Clear()
endFunction

function Fragment_4()
	if ORD_Smh_AdvancedWorkshop_Global_DisableAdvancedWorkshopModel.GetValue() == 1 as Float
		Alias_ORD_ArmorTableUpgrades.TryToDisable()
		Alias_ORD_GrindstoneUpgrades.TryToDisable()
	endIf
endFunction

Function TryDelete(ReferenceAlias aliasRef)
    If(aliasRef.GetRef())
        aliasRef.GetRef().Delete()
    EndIf
EndFunction