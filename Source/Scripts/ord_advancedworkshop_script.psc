scriptName ORD_AdvancedWorkshop_Script extends activemagiceffect

quest property ORD_AdvancedWorkshop_Quest auto
keyword property CraftingSmithingSharpeningWheel auto
keyword property CraftingSmithingArmorTable auto
spell property ORD_Smh_AdvancedWorkshop_Spell_Proc auto
spell property ORD_Smh_FuelTheInferno_Spell_Proc auto
actor property PlayerRef auto

function OnEffectFinish(actor akTarget, actor akCaster)
	ORD_AdvancedWorkshop_Quest.Stop()
endFunction

function OnGetUp(ObjectReference akFurniture)
	if akFurniture.HasKeyword(CraftingSmithingSharpeningWheel) || akFurniture.HasKeyword(CraftingSmithingArmorTable)
		PlayerRef.DispelSpell(ORD_Smh_AdvancedWorkshop_Spell_Proc)
		PlayerRef.DispelSpell(ORD_Smh_FuelTheInferno_Spell_Proc)
	endIf
endFunction