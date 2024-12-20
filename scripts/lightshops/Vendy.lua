local Vendy, super = Class(LightShop,  "vendy")

function Vendy:init()
    super.init(self)

    self.shop_music = nil
    if Game:getFlag("got_steamworks_id") then
        self.encounter_text = "[emote:face_happy]* How may I be of\nservice?"
        self.shop_text = "[emote:face_happy]* How may I be of\nservice?"
        self.leaving_text = "[emote:face_happy]* Thank you for using the Vendy\nservice!"
        self.buy_menu_text = "[emote:face_happy]Choose an\nitem!"
        self.buy_refuse_text = "[emote:face_happy]Changed your\nmind?"
        self.buy_text = "[emote:face_happy]Item\ndispensed!"
        self.buy_too_expensive_text = "[emote:face_uhh]You do not have enough money\n:["
        self.buy_no_space_text = "[emote:face_uhh]You do not\nhave enough\nspace :["
        self.talk_text = "[emote:face_happy]* Yes?"
        self.sell_no_selling_text = {
            "[emote:face_uhh]* Unfortunately,[wait:5] I cannot\nreceive any of your items,[wait:5] only\ndispense my own.",
            "[emote:face_sweaty]* I am terribly sorry!"
        }

        self:registerItem("uty_items/gravity_granola", {description = "Heals 30HP\nCrunchy\nsustenance!", dont_show_change = true})
        self:registerItem("uty_items/dihydrogen_monoxide", {name = "Dihydrogen Monoxide", description = "Heals 20HP\nAlso called\n\"water.\"", dont_show_change = true})
	    self:registerItem("uty_items/popato_chisps", {description = "Heals 13HP\nPerfectly\nsalted!", dont_show_change = true})
        self:registerItem("uty_items/safety_goggles", {description = "Armor: 9DF\nImportant!!!", dont_show_change = true})

        self:registerTalk("Creator")
    else
        self.encounter_text = "[emote:face_angry]* Unauthorized person\ndetected.[wait:5] Go away."
        self.shop_text = "[emote:face_angry]* Unauthorized person\ndetected.[wait:5] Go away."
        self.leaving_text = "[emote:face_base]* Yes,[wait:5] bye,[wait:5] thanks for nothing."
        self.buy_menu_text = "[emote:face_base]Go away."
        self.buy_refuse_text = "[emote:face_happy]Thank you\nfor backing\nout."
        self.buy_text = "[emote:face_angry]Curse my\nprogramming."
        self.buy_too_expensive_text = "[emote:face_smug]You are\nbroke.[wait:5] lol."
        self.buy_no_space_text = "[emote:face_base]You can't\ncarry any\nmore. Too\nbad."
        self.talk_text = "[emote:face_sweaty]* Why why\nwhy why-"
        self.sell_no_selling_text = {
            "[emote:face_happy]* Oh yes![wait:5] I will gladly dispense\nyour garbage![wait:5] Hand it over!",
            "[emote:face_uhh]* Please stop."
        }

        self:registerItem("uty_items/gravity_granola", {description = "Heals 30HP\nThis will\nkill you.", dont_show_change = true})
        self:registerItem("uty_items/dihydrogen_monoxide", {name = "Dihydrogen Monoxide", description = "Heals 20HP\nUnfiltered.\nDirt. Bad.", dont_show_change = true})
	    self:registerItem("uty_items/popato_chisps", {description = "Heals 13HP\nTastes like\nplastic.", dont_show_change = true})
        self:registerItem("uty_items/safety_goggles", {description = "Armor: 9DF\nWill blind\nyou.", dont_show_change = true})

        self:registerTalk("Your attitude")
    end
    self.buy_confirmation_text = "Buy it for\n%s ?"
    self.buy_storage_text = ""
    self.sell_confirmation_text = "Sell %s for %s ?"
    self.sell_no_storage_text = "* "

    self:registerTalk("The Steamworks")
    self:registerTalk("Axis")
    self:registerTalk("Snacks")

    self.shopkeeper:setActor("vendy")
    --self.shopkeeper.sprite:setPosition(-24, 12)
    --self.shopkeeper.slide = true

    self.background = "ui/shop/vendy"
end

function Vendy:startTalk(talk)
    if talk == "Your attitude" then
        self:startDialogue({
            "[emote:face_base]* Code line 327:[wait:5] \"If a customer is\ndetermined 'unauthorized',[wait:5] treat\nthem with utmost disrespect so\nthey will not buy up the\ncompany's snacks.\"",
            "* My disrespectful state was\ninitiated when I scanned your\ndull face.",
            "* Bring a Steamworks employee ID\nnext time to experience\n\"Hospitable Mode.\"",
            "* Until then,[wait:5] you may still\npurchase items,[wait:5] but I will tear\napart your self-esteem while\nyou do so...",
            "* ...",
            "[emote:face_angry]* Loser."
        })
    elseif talk == "The Steamworks" then
        if Game:getFlag("got_steamworks_id") then
            self:startDialogue({
                "[emote:face_happy]* You know what they say:[wait:5]\nSteamworks makes the dream\nwork!",
                "* This is the place to BE for\nprogress!",
                "* Each profession has its own\ndivision,[wait:5] and I am not one for\nmath! ",
                "[emote:face_smug]* Ha ha,[wait:5] I am only kidding of\ncourse![wait:5] All robots are forced\nto love math!",
                "[emote:face_happy]* The Factory Wing is where home\nappliances are created for\nmonsterkind to enjoy.",
                "* From refrigerators to washing\nmachines,[wait:5] the assembly line\nmakes it easy for monsters to\ntake it easy!",
                "* And do not forget the second\nfloor which specializes in\nsmelting materials mined around\nthe Underground into the\ncurrency known as G.",
                "* It's what makes the economy\nrun as adequately as it does!",
                "* From the Chemistry Wing to the\nGreenhouse,[wait:5] there is a job for\neveryone!",
                "* The Steamworks:[wait:5] Tomorrow means\nthe Surface!"
            })
        else
            self:startDialogue({
                "[emote:face_angry]* What about it?",
                "[emote:face_base]* The Steamworks are only the\nfinest in monster science and\nengineering,[wait:5] no big deal or\nanything.",
                "* Structures built from the\ntoughest steel and the greatest\nminds,[wait:5] sure to stand the test\nof several millennia!",
                "* Searching for a more advanced\nfacility would be like searching\nfor the corner of a circle.",
                "* With quality machines such as\nmyself at every turn,[wait:5] lives are\nimproved every day!",
                "[emote:face_happy]* The Steamworks:[wait:5] Tomorrow means\nthe Surface!",
                "[emote:face_uhh]* ...I am not a propaganda machine.[wait:5]\nMy creator made sure I specify\nthat."
            })
        end
    elseif talk == "Axis" then
        if Game:getFlag("got_steamworks_id") then
            self:startDialogue({
                "[emote:face_base]* I apologize,[wait:5] customer.[wait:5] My\nhospitable code is preventing\nme from releasing any\nclassified information on my\ncolleagues.",
                "* Though we appear as\nindividuals,[wait:5] us robots are\nquite the hivemind.[wait:5] All\ncontrolled by a station to the\nwest of my current location.",
                "* Axis,[wait:5] however,[wait:5] is a bit of an\nexception.[wait:5] The 'black sheep' of\nthe robotics project to put it\nlightly.",
                "[emote:face_happy]* Can you imagine acting outside\na governing fist that only\ngives you one purpose and no\nhope of freedom?[wait:5] Could NOT be\nme!",
                "* But if you care to know more,[wait:5]\nhe does love to talk about\nhimself so I would ask him :]"
            })
        else
            self:startDialogue({
                "[emote:face_boot_2]* Searching for \"Axis\" in the\ndatabase...",
                "[emote:face_base]* Axis -[wait:5] Latest Model:[wait:5] 014,[wait:5] is a\nrobot built to act as a Royal\nGuard.",
                "* Production goal:[wait:5] Create an army\nof Axis guard-bots to protect\nmonsterkind from humanity.",
                "* Production status...[wait:10]\nDiscontinued.",
                "* That is all of the information\nI have on this robot.",
                "* If I were to be helpful,[wait:5] which I\nwill not be,[wait:5] I would tell you to\nask an engineer in the Factory\nWing for more information.",
                "[emote:face_angry]* Where is the Factory Wing?[wait:5]\nI cannot tell you.[wait:5]\nYou are unauthorized. ",
                "* Not that I trust you to find it\non your own since you are,[wait:5]\nin fact,[wait:5] an idiot."
            })
        end
    elseif talk == "Snacks" then
        if Game:getFlag("got_steamworks_id") then
            self:startDialogue({
                "[emote:face_happy]* Ah snacks...[wait:10] My purpose :]",
                "[emote:face_smug]* I highly suggest you purchase\nsome![wait:5] They are made with all\nnatural ingredient substitutes!"
            })
        else
            self:startDialogue({
                "[emote:face_happy]* My snacks are up to the\nHIGHEST Steamworks standards.",
                "* I ensure the employees'\ndesignated meal times are as\nenjoyable as possible.",
                "[emote:face_smug]* Because of my popularity,[wait:5] I often\nrun out of inventory to which\nmy creator restocks every Monday\nat 8:00.",
                "[emote:face_happy]* That reminds me...[wait:10] My last boot\nup -[wait:5] yesterday -[wait:5] was a Sunday.\nDr. R.O. should be stopping by\nany minute now.[wait:5] I simply cannot\nwait.",
                "[emote:face_base]* But none of that is your\nbusiness,[wait:5] now is it?"
            })
        end
    elseif talk == "Creator" then
        self:startDialogue({
            "[emote:face_happy]* Every robot has a creator![wait:5] It\nis a law of the land after all.",
            "* Mine is Dr. Rutherford Oscar!",
            "* Prestigious engineer,[wait:5] chemist,[wait:5]\nbotanist,[wait:5] architect,[wait:5] doctor,[wait:5]\ndentist,[wait:5] archeologist,[wait:5]\ngeologist,[wait:5] zoologist,[wait:5] chef,",
            "* ...tailor,[wait:5] musician,[wait:5] athlete,[wait:5]\nforklift operator,[wait:5] pilot,[wait:5]\nwriter...",
            "* ...salesman,[wait:5] mailsman,[wait:5] snailsman,[wait:5]\nbeekeeper,[wait:5] birdkeeper,[wait:5] veteran,[wait:5]\nveterinarian,[wait:5] electrician,[wait:5]\nbeautician,[wait:5] magician,[wait:5] war\ncriminal,[wait:5] banker,[wait:5] pranker,[wait:5]\nfish-tanker,[wait:5] and...",
            "[emote:face_smug]* ...3% shareholder in the\ngovernment. ",
            "[emote:face_happy]* What a guy!"
        })
    end
end

return Vendy