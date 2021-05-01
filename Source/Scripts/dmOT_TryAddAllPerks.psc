ScriptName dmOT_TryAddAllPerks extends ActiveMagicEffect

Perk[] property PerkList auto
int[] addedPerks

Event OnEffectStart(Actor akTarget, Actor akCaster)
    int jIndex = JArray.object()
	int i = 0
	While i < PerkList.Length
		Perk perkItem = PerkList[i]
		If (!akTarget.HasPerk(perkItem))
			JArray.addInt(jIndex, i)
			akTarget.AddPerk(perkItem)
		EndIf
		i += 1
	EndWhile
	addedPerks = JArray.asIntArray(jIndex)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	int i = 0
	While i < addedPerks.Length
		akTarget.RemovePerk(PerkList[i])
		i += 1
	EndWhile
EndEvent
