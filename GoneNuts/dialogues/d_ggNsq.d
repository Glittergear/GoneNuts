BEGIN d_ggNSq


//this is for the squirrel's initial conversation. The Player has already talked to the bartender, but hasn't gotten the polymorph cloak from the squirrel yet
CHAIN IF ~Global ("GGNMQ","GLOBAL",2) Global ("GGNgotCloak","GLOBAL",0)~ THEN d_ggNSq squirrelCheck 
~Squeakity squeak squeak squeakin.~
== JAHEIRAJ IF ~InParty("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN ~There is something very strange about this squirrel. I have to wonder if there's not something unnatural here.~
== CERNDJ IF ~InParty("Cernd") !StateCheck("Cernd",CD_STATE_NOTVALID)~ THEN ~There is something not right here. See the way that the squirrel's tail twitches?~
== JANJ IF ~InParty("Jan") !StateCheck("Jan",CD_STATE_NOTVALID)~ THEN ~Do you smell that? Why, that's the smell of transmutation magic in the air! This reminds me of the time that Great-aunt Torrence accidently transformed herself into a sentient turnip! The family almost ate her, and we would've if second-cousin-twice-removed Eustice didn't accidently turn everything green. We had to use a Dispel Magic to ungreen everything, but that also undid the polymorph spell, and there was my great-aunt! Almost a shame, because then we didn't have enough turnips for my grandmother's turnip pie recipe.~
END
	+ ~OR(6) InParty("Jaheira") InParty("Cernd") InParty("Jan") Class(Player1,DRUID_ALL) Class(Player1,MAGE_ALL) Class(Player1,SORCERER)~ +  ~You're not actually a squirrel, are you? You've been polymorphed.~ + squirrelCaughtlol
	++ ~ (You decide to leave the squirrel alone.)~ EXIT

APPEND d_ggNSq

IF ~~ squirrelCaughtlol
	SAY ~Okay, fine, you got me. I'm not actually a squirrel. Now, shoo.~
	++ ~ Wait, but why are you a squirrel?~ GOTO squirrelAdmission
	++ ~ Who are you, really?~ GOTO squirrelAdmission
	++ ~ Alright, I'm going. ~ GOTO squirrelAdmission
END

IF ~~ THEN BEGIN squirrelAdmission
	SAY ~I am--used to be, Estelin. Perhaps I still am Estelin. I'm not entirely certain, but anyway, I was a wild mage. Rather unpleasant, really, with the Red Wizards and Cowled Wizards. And the wild surges. To make a long story short, I got tired. Fed up. Tired of the politics of Amn, tired of being on guard and keeping secrets. Tired of the insane, complicated taxes in Amn, even. I got pissed and drunk and pissed drunk, and so I decided to do something. I can't change the world itself, but I *can* change *my* world. So I became a squirrel. It's nice. All I have to worry about is hawks and cats. I don't even have to worry about food, since if I do a little dance, some human will think it's cute and feed me.~ IF ~~ THEN EXIT
	++ ~ How can I help?~ GOTO squirrelHelp
	++ ~ Do you want me to change you back? ~ GOTO squirrelHelp
	++ ~ Tannia is worried about you. ~ GOTO tanniaOops
END

IF ~~ THEN BEGIN squirrelHelp
	SAY ~Help? I don't need any help. Why would I need help?~
	++ ~Because you're stuck as a squirrel?~ GOTO squirrelPlsNo
	++ ~ Tannia is worried about you. ~ GOTO tanniaOops
END

IF ~~ THEN BEGIN squirrelPlsNo
	SAY ~I wouldn't say I'm *stuck* as a squirrel, any more than you'd say that you're *stuck* as a <RACE>. Unless you are stuck as a <RACE>? In that case, I could turn you into a squirrel, too, if you'd like.~
	++ ~You know what? That does sound nice. Turn me into a squirrel.~ GOTO squirrelyay
	++ ~Erm, no thanks. Tannia is worried about you.~ GOTO tanniaOops
END

IF ~~ THEN BEGIN squirrelyay
	SAY ~Sure, sure. I can't turn you permanently in a squirrel like I did for me, but you can have this cloak. It was my initial polymorph attempt. It'll turn you into a squirrel for a while, and you'll retain your spellcasting abilities. And... hm. You know, I've got a friend in Athkatla. Her name is Tannia, and she probably thinks that the Cowled Ones got me, or something. If you could find her and tell her that I'm happy as a squirrel and no dispelling magic is needed, I'd be happy with you. But this is all, yeah?~
IF ~~ THEN DO ~
	SetGlobal("GGNMQ","GLOBAL",3) AddJournalEntry(@5102, QUEST) SetGlobal("GGNgotCloak","GLOBAL",1) GiveItemCreate("GGNSqC",Player1,1,1,0)~ EXIT
END

IF ~~ THEN BEGIN tanniaOops
	SAY ~Ah. Yes, I imagine she would be. Go ahead and let her know what happened, and be sure to tell her that I'm happy as a squirrel. No magic dispelling needed, or anything. Here, I'll even give you cloak as a reward.~ IF ~~ THEN EXIT
IF ~~ THEN DO ~
	SetGlobal("GGNMQ","GLOBAL",3) AddJournalEntry(@5102, QUEST) SetGlobal("GGNgotCloak","GLOBAL",1) GiveItemCreate("GGNSqC",Player1,1,1,0)~ EXIT
END
END 