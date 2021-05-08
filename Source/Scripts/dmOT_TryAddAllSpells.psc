ScriptName dmOT_TryAddAllSpells extends ActiveMagicEffect

Spell[] property SpellList auto
int[] addedSpells

Event OnEffectStart(Actor akTarget, Actor akCaster)
    int jIndex = JArray.object()
	int i = 0
	While i < SpellList.Length
		Spell spellItem = SpellList[i]
		If (!akTarget.HasSpell(spellItem))
			JArray.addInt(jIndex, i)
			akTarget.AddSpell(spellItem)
		EndIf
		i += 1
	EndWhile
	addedSpells = JArray.asIntArray(jIndex)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	int i = 0
	While i < addedSpells.Length
		akTarget.RemoveSpell(SpellList[i])
		i += 1
	EndWhile
EndEvent
