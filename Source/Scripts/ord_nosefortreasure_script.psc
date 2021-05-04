ScriptName ORD_NoseForTreasure_Script extends activemagiceffect

Message property ORD_Loc_NoseForTreasure_Message auto
LeveledItem[] property ORD_LitemToAdd auto
LeveledItem property ORD_Loc_RobbersEye_Litem auto

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	ORD_Loc_RobbersEye_Litem.Revert()
EndEvent

Event OnEffectStart(Actor akTarget, Actor akCaster)
    ORD_Loc_RobbersEye_Litem.Revert()
	int WhichItemType = ORD_Loc_NoseForTreasure_Message.Show()
	ORD_Loc_RobbersEye_Litem.AddForm(ORD_LitemToAdd[WhichItemType], 2, 1)
	ORD_Loc_RobbersEye_Litem.AddForm(ORD_LitemToAdd[WhichItemType], 4, 1)
EndEvent
