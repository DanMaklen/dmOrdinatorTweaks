ScriptName ORD_Beeline_Script extends activemagiceffect

LeveledItem Property ORD_Pic_ThiefsEye_Litem Auto
message Property ORD_Pic_LuckyShadow_Message Auto
LeveledItem Property ORD_Pic_BloodAndPlunder_Litem Auto
LeveledItem[] Property ORD_LitemToAdd Auto

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	ORD_Pic_ThiefsEye_Litem.Revert()
	ORD_Pic_BloodAndPlunder_Litem.Revert()
EndEvent

Event OnEffectStart(Actor akTarget, Actor akCaster)
	ORD_Pic_ThiefsEye_Litem.Revert()
	ORD_Pic_BloodAndPlunder_Litem.Revert()
	int WhichItemType = ORD_Pic_LuckyShadow_Message.Show()
	LeveledItem LitemToAdd = ORD_LitemToAdd[WhichItemType]
	ORD_Pic_ThiefsEye_Litem.AddForm(LitemToAdd, 2, 1)
	ORD_Pic_ThiefsEye_Litem.AddForm(LitemToAdd, 4, 1)
	ORD_Pic_BloodAndPlunder_Litem.AddForm(LitemToAdd, 1, 1)
EndEvent
