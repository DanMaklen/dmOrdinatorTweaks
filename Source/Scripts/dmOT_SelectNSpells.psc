ScriptName dmOT_SelectNSpells extends ActiveMagicEffect

Int property N auto
message property SelectionPrompt auto
Spell[] property SpellList auto

int[] selectedIndex

Event OnEffectStart(Actor akTarget, Actor akCaster)
    selectedIndex = PapyrusUtil.IntArray(N, -1)
	int i = 0
	While i < N
		selectedIndex[i] = SelectionPrompt.Show()
		akTarget.AddSpell(SpellList[selectedIndex[i]])
		i += 1
	EndWhile
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	int i = 0
	While i < N
		akTarget.RemoveSpell(SpellList[selectedIndex[i]])
		i += 1
	EndWhile
EndEvent
