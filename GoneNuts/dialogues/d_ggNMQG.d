BEGIN d_ggNMQG


//Initial quest giving dialogue
IF ~Global("GGNMQ","GLOBAL",0)~ THEN BEGIN 0
	SAY ~Unbelievable! Just unbelievable!~
		++ ~I know, right? Insane!~ GOTO 1
		++ ~Is something wrong?~ GOTO 2
END

IF ~~ THEN BEGIN 1
	SAY ~Oh, sorry, I didn’t notice you there. It’s nothing, really, I’m-—wait, you’re an adventurer, aren’t you? Maybe you could help. It’s my friend, you see. He was taken by the Cowled Wizards!~
		++ ~You saw this?~ GOTO 1A
		++ ~Do you know where he was taken?~ GOTO 1B
		++ ~I’m not interested in this.~ GOTO 3
END

IF ~~ THEN BEGIN 2
	SAY ~Oh, sorry, I didn’t notice you there. It’s nothing, really, I’m-—wait, you’re an adventurer, aren’t you? Maybe you could help. It’s my friend, you see. He was taken by the Cowled Wizards!~
		++ ~You saw this?~ GOTO 1A
		++ ~Do you know where he was taken?~ GOTO 1B
		++ ~I’m not interested in this.~ GOTO 3
END

IF ~~ THEN BEGIN 1A
	SAY ~Well, no… But I know he must’ve been taken! He’s a spellcaster, see, and he’s disappeared! What else could’ve happened? But the damned beurocrats say that there’s nothing that they can do, and they even deny that they took him at all!~
		++ ~Go on.~ GOTO 1C
		++ ~I’m not interested in this.~ GOTO 3
END

IF ~~ THEN BEGIN 1B
	SAY ~I wish. These damn beurocrats won’t tell me! They say that they don’t even know! Isn’t that irresponsible, to let people lock other people up in some unknown location?~
		++ ~Go on.~ GOTO 1C
		++ ~I’m not interested in this.~ GOTO 3
END

IF ~~ THEN BEGIN 1C
	SAY ~But you’re an adventurer. You work for money, don’t you? I… I’m not naive enough to think you can free someone from the Cowled Wizards, but I’ll pay you to prove that they’re behind this!~
		++ ~Alright. I'll try to find your friend. Do you have any leads?~ GOTO 1D
		++ ~How much money are we talking?~ GOTO 1E
		++ ~I’m not interested in this.~ GOTO 3
END

IF ~~ THEN BEGIN 1D
	SAY ~Thank you! He was last seen in Trademeet, but he’s disappeared! I.. probably shouldn’t tell you this, but if it helps… He likes to go to taverns. Perhaps a bit too much. I’d start there, if I were you. His name is Estelin.~
	IF ~~ THEN DO ~SetGlobal("GGNMQ","GLOBAL",1) RevealAreaOnMap("AR2000") AddJournalEntry(@5100, QUEST)~ EXIT
END


IF ~~ THEN BEGIN 1E
	SAY ~I can spare 2,000 gold. And this amulet of magic resistance! He gave it to me, just in case. Please, I just want to know what happened.~
		++ ~Alright. I'll try to find Estelin. Do you have any leads?~ GOTO 1D
		++ ~I’m not interested in this.~ GOTO 3
END

IF ~~ THEN BEGIN 3
	SAY ~I… well, I can’t force you. But I beg you to reconsider!~
	IF ~~ THEN EXIT
END

//started quest, haven't found Estelin yet
IF ~Global("GGNMQ","GLOBAL",1)~ THEN BEGIN 10
	SAY ~Please go to Trademeet and find out what happened to Estelin!~
	IF ~~ THEN EXIT
END

//started quest, haven't found Estelin yet but talked to bartender
IF ~Global("GGNMQ","GLOBAL",2)~ THEN BEGIN 20
	SAY ~Please go to Trademeet and find out what happened to Estelin!~
	IF ~~ THEN EXIT
END

//solved the mystery
IF ~Global("GGNMQ","GLOBAL",3)~ THEN BEGIN 30
	SAY ~Have you found anything out?~
		++ ~He... turned into a squirrel and wants to stay that way.~ GOTO 31
END

IF ~~ THEN BEGIN 31
	SAY ~ He WHAT!? And wants to WHAT!? He's... he's gone nuts! Oh, gods, he's gone insane. Lost it completely. I guess... well, if he's happier this way... But you'll want your reward, won't you? I promised you 2,000 gold and this amulet. I need to think about some things. Goodbye, and thank you for your help.~
	IF ~~ THEN DO ~SetGlobal("GGNMQ","GLOBAL",4)
					AddJournalEntry(@5103, QUEST_DONE)
					GiveGoldForce(2000)
					GiveItemCreate("AMUL19",Player1,1,1,0)
					AddXPObject(Player1,5000)
					AddXPObject(Player2,5000)
					AddXPObject(Player3,5000)
					AddXPObject(Player4,5000)
					AddXPObject(Player5,5000)
					AddXPObject(Player6,5000)
					EscapeArea()~ EXIT
END
