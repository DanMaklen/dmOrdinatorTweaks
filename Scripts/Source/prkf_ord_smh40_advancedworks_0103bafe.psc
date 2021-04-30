scriptName PRKF_ORD_Smh40_AdvancedWorks_0103BAFE extends Perk hidden

message property ORD_Smh_AdvancedWorkshop_Message_Want_ArmorTable auto
message property ORD_Smh_AdvancedWorkshop_Message_Want_SharpeningWheel auto
message property ORD_Smh_AdvancedWorkshop_Message_Demolished auto
miscobject property Gold001 auto
globalvariable property ORD_Smh_AdvancedWorkshop_Global_Type auto
quest property ORD_AdvancedWorkshop_Quest auto
keyword property CraftingSmithingSharpeningWheel auto
referencealias property ORD_Grindstone auto
referencealias property GrindstoneProxy auto
message property ORD_Smh_AdvancedWorkshop_Message_Upgraded auto
actor property PlayerRef auto
message property ORD_Smh_FuelTheInferno_Message_Want auto
keyword property CraftingSmithingArmorTable auto
globalvariable property ORD_Alc_SneakDetector_Global_SneakFlag auto
Perk property ORD_Smh80_FuelTheInferno_Perk_80 auto
spell property ORD_Smh_FuelTheInferno_Spell_Proc auto
message property ORD_Smh_AdvancedWorkshop_Message_Stop_SharpeningWheel auto
spell property ORD_Smh_AdvancedWorkshop_Spell_Proc auto
message property ORD_Smh_AdvancedWorkshop_Message_Stop_ArmorTable auto
globalvariable property ORD_Smh_AdvancedWorkshop_Global_Type_Lockout auto
Int property ORD_Gold auto
referencealias property ORD_ArmorTable auto
referencealias property ArmorTableProxy auto
message property ORD_Smh_AdvancedWorkshop_Message_Demolish auto
sound property ORD_Smh_AdvancedWorkshop_Marker_Upgrade auto


function Fragment_0(ObjectReference akTargetRef, actor akActor)
    If (!akTargetRef.HasKeyword(CraftingSmithingArmorTable) && !akTargetRef.HasKeyword(CraftingSmithingSharpeningWheel))
        return
    EndIf
    game.DisablePlayerControls()

    bool shouldActivate = true
    If (akTargetRef.HasKeyword(CraftingSmithingArmorTable))
        shouldActivate = HandleAdvanced(akTargetRef, ORD_ArmorTable, ORD_Smh_AdvancedWorkshop_Message_Want_ArmorTable, ArmorTableProxy)
    ElseIf akTargetRef.HasKeyword(CraftingSmithingSharpeningWheel)
        shouldActivate = HandleAdvanced(akTargetRef, ORD_Grindstone, ORD_Smh_AdvancedWorkshop_Message_Want_SharpeningWheel, GrindstoneProxy)
    EndIf

    If (shouldActivate)
        ActivateTarget(akTargetRef)
    EndIf
    game.EnablePlayerControls()
endFunction

Function ActivateTarget(ObjectReference akTargetRef)
    If (akTargetRef == ORD_ArmorTable.GetRef() || akTargetRef == ORD_Grindstone.GetRef())
        if ShouldUseInferno()
            ORD_Smh_FuelTheInferno_Spell_Proc.Cast(PlayerRef as ObjectReference)
        else
            ORD_Smh_AdvancedWorkshop_Spell_Proc.Cast(PlayerRef as ObjectReference)
        endIf
    EndIf
	akTargetRef.Activate(PlayerRef as ObjectReference, false)
EndFunction

bool Function ShouldUseInferno()
    return PlayerRef.HasPerk(ORD_Smh80_FuelTheInferno_Perk_80) && PlayerRef.GetAV("DragonSouls") >= 1 && ORD_Smh_FuelTheInferno_Message_Want.Show() == 1
EndFunction

bool Function HandleAdvanced(ObjectReference akTargetRef, ReferenceAlias advancedAlias, Message upgradePrompt, ReferenceAlias setterProxy)
    If (!advancedAlias.GetRef() && upgradePrompt.Show() == 1)
        PlayerRef.RemoveItem(Gold001, ORD_Gold)
        setterProxy.ForceRefTo(akTargetRef)
        ORD_Smh_AdvancedWorkshop_Marker_Upgrade.Play(akTargetRef)
        ORD_Smh_AdvancedWorkshop_Message_Upgraded.Show()
        RefreshVisual()
        return false
    ElseIf (akTargetRef == advancedAlias.GetRef() && ORD_Alc_SneakDetector_Global_SneakFlag.GetValue() > 0 && ORD_Smh_AdvancedWorkshop_Message_Demolish.Show() == 1)
        setterProxy.Clear()
        advancedAlias.Clear()
        ORD_Smh_AdvancedWorkshop_Marker_Upgrade.Play(akTargetRef)
        ORD_Smh_AdvancedWorkshop_Message_Demolished.Show()
        RefreshVisual()
        return false
    EndIf
    return true
EndFunction

Function RefreshVisual()
    If (ORD_AdvancedWorkshop_Quest.IsRunning())
        ORD_AdvancedWorkshop_Quest.Stop()
        ORD_AdvancedWorkshop_Quest.SetCurrentStageID(200)
    EndIf
    
    ORD_AdvancedWorkshop_Quest.Start()

    If (!ArmorTableProxy.GetRef() && !GrindstoneProxy.GetRef())
        ORD_AdvancedWorkshop_Quest.Stop()
    EndIf
EndFunction
