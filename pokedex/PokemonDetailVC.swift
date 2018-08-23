//
//  PokemonDetailVC.swift
//  pokedex
//
//  Created by Milos Jakovljeivc on 3/16/17.
//  Copyright © 2017 Milos Jakovljeivc. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    var pokemon: Pokemon!
    let descriptions: [Int:String] = [ 1:  "There is a plant seed on its back right from the day this POKéMON is born. The seed slowly grows larger.", 2: "There is a plant bulb on its back. When it absorbs nutrients, the bulb is said to blossom into a large flower.", 3: "A bewitching aroma wafts from its flower. The fragrance becalms those engaged in a battle.", 4: "From the time it is born, a flame burns at the tip of its tail. Its life would end if the flame were to go out.", 5: "It lashes about with its tail to knock down its foe. It then tears up the fallen opponent with sharp claws.", 6: "Its wings can carry this POKéMON close to an altitude of 4,600 feet. It blows out fire at very high temperatures.", 7: "When it retracts its long neck into its shell, it squirts out water with vigorous force.", 8: "This POKéMON is very popular as a pet. Its fur-covered tail is a symbol of its longevity.", 9: "It crushes its foe under its heavy body to cause fainting. In a pinch, it will withdraw inside its shell.", 10: "It is covered with a green skin. When it grows, it sheds the skin, covers itself with silk, and becomes a cocoon.", 11: "Even though it is encased in a sturdy shell, the body inside is tender. It can’t withstand a harsh attack.", 12: "The wings are protected by rain-repellent dust. As a result, this POKéMON can fly about even in rain.", 13: "Often found in forests and grasslands. It has a sharp, toxic barb of around two inches on top of its head.", 14: "This POKéMON is in a temporary stage while making its body. It is almost completely unable to move on its own.", 15: "May appear in a swarm. Flies at violent speeds, all the while stabbing with the toxic stinger on its rear.", 16: "Does not like to fight. It hides in tall grass and so on, foraging for food such as small bugs.", 17: "The claws on its feet are well developed. It can carry prey such as an EXEGGCUTE to its nest over 60 miles away.", 18: "It spreads its gorgeous wings widely to intimidate enemies. It races through the skies at Mach-2 speed.", 19: "Its fangs are long and very sharp. They grow continuously, so it gnaws on hard things to whittle them down.", 20: "Its rear feet have three toes each. They are webbed, enabling it to swim across rivers.", 21: "It busily flits around here and there. Even if it is frail, it can be a tough foe that uses MIRROR MOVE.", 22: "Its huge and magnificent wings can keep it aloft in the sky. It can remain flying a whole day without landing.", 23: "A very common sight in grassland, etc. It flicks its tongue in and out to sense danger in its surroundings.", 24: "The pattern on its belly appears to be a frightening face. Weak foes will flee just at the sight of the pattern.", 25: "It has small electric sacs on both its cheeks. If threatened, it looses electric charges from the sacs.", 26: "Its electric charges can reach even 100,000 volts. Careless contact can cause even an Indian elephant to faint.", 27: "It burrows and lives underground. If threatened, it curls itself up into a ball for protection.", 28: "It is adept at attacking with the spines on its back and its sharp claws while quickly scurrying about.", 29: "Though small, it must be treated with caution because of its powerfully toxic barbs. The female has smaller horns.", 30: "The female has a gentle temperament. It emits ultrasonic cries that have the power to befuddle foes.", 31: "The body is covered by stiff, needle-like scales. If it becomes excited, the needles bristle outwards.", 32: "Its large ears are flapped like wings when it is listening to distant sounds. It extends toxic barbs when angered.", 33: "It is easily angered. By swinging its well-developed horn wildly, it can even punch through diamond.", 34: "It is recognized by its rock-hard hide and its extended horn. Be careful with the horn as it contains venom.", 35: "Its adorable appearance makes it popular as a pet. However, it is rare and difficult to find.", 36: "It has an acute sense of hearing. It can easily hear a pin being dropped nearly 1,100 yards away.", 37: "While young, it has six gorgeous tails. When it grows, several new tails are sprouted.", 38: "It has nine long tails and fur that gleams gold. It is said to live for 1,000 years.", 39: "It captivates foes with its huge, round eyes, then lulls them to sleep by singing a soothing melody.", 40: "Its fur is extremely fine, dense, and supple. The exquisitely pleasant fur conveys an image of luxury.", 41: "It has no eyes. Instead, it relies on its ultrasonic cries for echo location to flit about in darkness.", 42: "It clamps down on its prey with needle-sharp fangs and drains over 10 ounces of blood in one gulp.", 43: "Its scientific name is “Oddium Wanderus.” At night, it is said to walk nearly 1,000 feet on its two roots.", 44: "Its pistils exude an incredibly foul odor. The horrid stench can cause fainting at a distance of 1.25 miles.", 45: "Its petals are the largest in the world. It fiendishly scatters allergy-causing pollen from its petals.", 46: "Growing out of the bug’s back are mushrooms called tochukaso. The mushrooms grow with the bug host.", 47: "It scatters toxic spores from the mushroom cap. In China, the spores are used as herbal medicine.", 48: "Its eyes act as radar, enabling it to be active in darkness. The eyes can also shoot powerful beams.", 49: "The wings are covered with dustlike scales. Every time it flaps its wings, it looses highly toxic dust.", 50: "It burrows through the ground at a shallow depth. It leaves raised earth in its wake, making it easy to spot.", 51: "In battle, it digs through the ground and strikes the unsuspecting foe from an unexpected direction.", 52: "All it does is sleep during the daytime. At night, it patrols its territory with its eyes aglow.", 53: "Has a vicious temperament. Beware if it raises its tail straight up. It is a signal that it is about to pounce and bite.", 54: "It is constantly wracked by a headache. When the headache turns intense, it begins using mysterious powers.", 55: "The forelegs are webbed, helping to make it an adept swimmer. It can be seen swimming elegantly in lakes, etc.", 56: "Light and agile on its feet, and ferocious in temperament. When angered, it flies into an uncontrollable frenzy.", 57: "It is always outrageously furious. If it gives chase, it will tenaciously track the target no matter how far.", 58: "Very friendly and faithful to people. It will try to repel enemies by barking and biting.", 59: "A POKéMON that is described in Chinese legends. It is said to race at an unbelievable speed.", 60: "Its slick black skin is thin and damp. A part of its internal organs can be seen through the skin as a spiral pattern.", 61: "Its two legs are well developed. Even though it can live on the ground, it prefers living in water.", 62: "An adept swimmer, it knows the front crawl, butterfly, and more. It is faster than the best human swimmers.", 63: "It sleeps for 18 hours a day. It uses a variety of extrasensory powers even while asleep.", 64: "It happened one morning - a boy with extrasensory powers awoke in bed transformed into KADABRA.", 65: "It does not like physical attacks very much. Instead, it freely uses extrasensory powers to defeat foes.", 66: "Its whole body is composed of muscles. Even though it’s the size of a human child, it can hurl 100 grown-ups.", 67: "Its formidable body never gets tired. It helps people by doing work such as the moving of heavy goods.", 68: "Its four ruggedly developed arms can launch a flurry of 1,000 punches in just two seconds.", 69: "Its bud looks like a human face. Because of the bud, it is rumored to be a type of legendary mandrake plant.", 70: "The leafy parts act as cutters for slashing foes. It spits a fluid that dissolves everything.", 71: "Lures prey into its mouth with a honeylike aroma. The helpless prey is melted with a dissolving fluid.", 72: "Its eyes are as transparent as crystals. From them, it shoots mysterious beams of light.", 73: "It has 80 tentacles that move about freely. They can sting, causing poisoning and sharp, stabbing pain.", 74: "Its round form makes it easy to pick up. Some people have used them to hurl at each other in a snowball fight.", 75: "Be careful while hiking on mountain trails. GRAVELER may come rolling down the path without slowing.", 76: "It is enclosed in a hard shell that is as rugged as slabs of rock. It sheds skin once a year to grow larger.", 77: "Its body is light, and its legs are incredibly powerful. It can clear Ayers Rock in one leap.", 78: "It can gallop at a top speed of 150 miles per hour. It can race as fast as a bullet train while ablaze.", 79: "It is always vacantly lost in thought, but no one knows what it is thinking about. It is good at fishing with its tail.", 80: "When a SLOWPOKE went hunting in the sea, its tail was bitten by a SHELLDER. That made it evolve into SLOWBRO.", 81: "It moves while constantly hovering. It discharges THUNDER WAVE and so on from the units at its sides.", 82: "A linked cluster formed of several MAGNEMITE. It discharges powerful magnetic waves at high voltage.", 83: "It always walks about with a plant stalk clamped in its beak. The stalk is used for building its nest.", 84: "A two-headed POKéMON that was discovered as a sudden mutation. It runs at a pace of over 60 miles per hour.", 85: "An odd species that is rarely found. The three heads respectively represent joy, sadness, and anger.", 86: "Covered with light blue fur, its hide is thick and tough. It is active in bitter cold of minus 40 degrees Fahrenheit.", 87: "Its body is covered with a pure white fur. The colder the weather, the more active it becomes.", 88: "Sludge exposed to X rays from the moon transformed into GRIMER. It loves feeding on filthy things." , 89: "It is usually undetectable because it blends in with the ground. Touching it can cause terrible poisoning.", 90: "It is encased in a shell that is harder than diamond. Inside, however, it is surprisingly tender.", 91: "Its shell is extremely hard. It cannot be shattered, even with a bomb. The shell opens only when it is attacking.", 92: "A being that exists as a thin gas. It can topple an Indian elephant by enveloping the prey in two seconds.", 93: "If you get the feeling of being watched in darkness when nobody is around, HAUNTER is there.", 94: "It is said to emerge from darkness to steal the lives of those who become lost in mountains.", 95: "It usually lives underground. It searches for food while boring its way through the ground at 50 miles per hour.", 96: "A descendent of the legendary animal baku, which is said to eat dreams. It is skilled at hypnotism.", 97: "It carries a pendulum-like device. There once was an incident in which it took away a child it hypnotized.", 98: "It can be found near the sea. The large pincers grow back if they are torn out of their sockets.", 99: "Its large and hard pincer has 10,000-horsepower strength. However, being so big, it is unwieldy to move.", 100: "A life-form whose identity is unknown. It is said to SCREECH or suddenly SELFDESTRUCT.", 101: "It explodes in response to even minor stimuli. It is feared, with the nickname of “The Bomb Ball.”", 102: "Even though it appears to be eggs of some sort, it was discovered to be a life-form more like plant seeds.", 103: "It is called “The Walking Tropical Rainforest.” Each of the nuts has a face and a will of its own.", 104: "It wears the skull of its dead mother on its head. When it becomes lonesome, it is said to cry loudly.", 105: "It is small and was originally very weak. Its temperament turned ferocious when it began using bones.", 106: "The legs freely contract and stretch. The stretchy legs allow it to hit a distant foe with a rising kick.", 107: "The spirit of a pro boxer has infused this POKéMON. It throws punches that are faster than a bullet train.", 108: "Its tongue is twice the length of its body. It can be moved like an arm for grabbing food and attacking.", 109: "Its thin, balloon-like body is inflated by horribly toxic gases. It reeks when it is nearby.", 110: "Very rarely, a sudden mutation can result in two small KOFFING twins becoming conjoined as a WEEZING.", 111: "Strong, but not too bright, this POKéMON can shatter even a skyscraper with its charging TACKLES.", 112: "It begins walking on its hind legs after evolution. It can punch holes through boulders with its horn.", 113: "It lays several eggs a day. The eggs are apparently rich in nutrients and extremely delicious.", 114: "Blue plant vines cloak the POKéMON’s identity in a tangled mass. It entangles anything that gets close.", 115: "The female raises its offspring in a pouch on its belly. It is skilled at attacking using COMET PUNCH.", 116: "It maintains balance using its tail, which is wound up like a coil. It may spray ink from its mouth.", 117: "Its body bristles with sharp spikes. Carelessly trying to touch it could cause fainting from the spikes.", 118: "Its dorsal and pectoral fins are strongly developed like muscles. It can swim at a speed of five knots.", 119: "The horn on its head is sharp like a drill. It bores a hole in a boulder to make its nest.", 120: "It appears in large numbers by seashores. At night, its central core flashes with a red light.", 121: "This POKéMON has a geometric body. Because of its body, the locals suspect that it is an alien creature.", 122: "It is adept at conning people. It is said to be able to create walls out of thin air by miming.", 123: "It tears and shreds prey with its wickedly sharp scythes. It very rarely spreads its wings to fly.", 124: "It speaks using a language that sounds human. Research is under way to determine what is being said.", 125: "It loves to feed on strong electricity. It occasionally appears around large power plants and so on.", 126: "Found near the mouth of a volcano. This fire-breather’s body temperature is nearly 2,200 degrees Fahrenheit.", 127: "Its two long pincer horns are powerful. Once they grip an enemy, they won’t release until the foe is torn.", 128: "When it is about to TACKLE, it whips its body repeatedly with its three long tails.", 129: "It is virtually worthless in terms of both power and speed. It is the most weak and pathetic POKéMON in the world.", 130: "It has an extremely aggressive nature. The HYPER BEAM it shoots from its mouth totally incinerates all targets.", 131: "Its high intelligence enables it to understand human speech. It likes to ferry people on its back.", 132: "It can freely recombine its own cellular structure to transform into other life-forms.", 133: "An extremely rare POKéMON that may evolve in a number of different ways depending on stimuli.", 134: "Its body’s cellular structure is similar to the molecular composition of water. It can melt invisibly in water.", 135: "If it is angered or startled, the fur all over its body bristles like sharp needles that pierce foes.", 136: "It has a flame bag inside its body. After inhaling deeply, it blows out flames of nearly 3,100 degrees Fahrenheit.", 137: "Using the most advanced technologies, scientists finally succeeded in making the first artificial POKéMON.", 138: "A prehistoric POKéMON that lived in the primordial sea, it swims by twisting its 10 tentacles about.", 139: "Its tentacles are highly developed as if they are hands and feet. As soon as it ensnares prey, it bites.", 140: "This POKéMON was regenerated from the fossil of an ancient creature. It protects itself with a hard shell.", 141: "It swims freely through water. It catches prey with its scythe-like arms and drains the victim’s fluids.", 142: "It was regenerated from a dinosaur’s genetic matter that was found in amber. It flies with high-pitched cries.", 143: "It is not satisfied unless it eats over 880 pounds of food every day. When it is done eating, it goes promptly to sleep.", 144: "One of the legendary bird POKéMON. With its long tail trailing behind, its flying form is magnificent.", 145: "One of the legendary bird POKéMON. While it is flying, it makes crackling and snapping sounds.", 146: "One of the legendary bird POKéMON. Those seeing it are overwhelmed by its orange wings that seem to be on fire.", 147: "Even the young can exceed 6.5 feet in length. It grows larger by repeatedly shedding skin.", 148: "It is said to live in seas and lakes. Even though it has no wings, it has been seen flying occasionally.", 149: "It can fly in spite of its big and bulky physique. It circles the globe in just 16 hours.", 150: "A POKéMON whose genetic code was repeatedly recombined for research. It turned vicious as a result.", 151: "A POKéMON of South America that was thought to have been extinct. It is very intelligent and learns any move."]

    @IBOutlet weak var pokemoninfo: UITextView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var pokedexIdLbl: UILabel!
    @IBOutlet weak var baseAttackLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var evolutionTextLbl: UILabel!
    
    @IBOutlet weak var speedLbl: UILabel!
    @IBOutlet weak var spdefenseLbl: UILabel!
    @IBOutlet weak var spattackLbl: UILabel!
    @IBOutlet weak var hpLbl: UILabel!
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var arrow: UIImageView!
    
    @IBOutlet weak var candy: UIImageView!
    
    @IBOutlet weak var noevo: UIImageView!
    
    @IBOutlet weak var vap: UILabel!
    @IBOutlet weak var flar: UILabel!
    @IBOutlet weak var jolt: UILabel!
    @IBOutlet weak var wstone: UILabel!
    @IBOutlet weak var fstone: UILabel!
    @IBOutlet weak var tstone: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.vap.isHidden = true
        self.flar.isHidden = true
        self.jolt.isHidden = true
        self.wstone.isHidden = true
        self.fstone.isHidden = true
        self.tstone.isHidden = true
        self.noevo.isHidden = true
        nameLbl.text = "#\(pokemon.pokedexId) \(pokemon.name.capitalized)"
       heightLbl.text = "\(String(Double(pokemon.height) / 10.0)) m"
       weightLbl.text = "\(String(Double(pokemon.weight) / 10.0)) kg"
       let img = UIImage(named: "\(pokemon.pokedexId)")
        let img1 = UIImage(named: "\(pokemon.nextEvo)")
        let img2 = UIImage(named: "Red_X.png")
       mainImg.image = img
        typeLbl.text = pokemon.pokeType
        defenseLbl.text = String(pokemon.pdefense)
        baseAttackLbl.text = String(pokemon.pattack)
        hpLbl.text = String(pokemon.hp)
        spattackLbl.text = String(pokemon.spattack)
        spdefenseLbl.text = String(pokemon.spdefense)
        speedLbl.text = String(pokemon.speed)
        pokemoninfo.text = descriptions[pokemon.pokedexId]
        
       if pokemon.pokedexId == 133 {
        self.vap.isHidden = false
        self.flar.isHidden = false
        self.jolt.isHidden = false
        self.wstone.isHidden = false
        self.fstone.isHidden = false
        self.tstone.isHidden = false
        self.candy.isHidden = true
        self.arrow.isHidden = true
        self.noevo.isHidden = false
        currentEvoImg.image = UIImage(named:"134")
        noevo.image = UIImage(named:"135")
        nextEvoImg.image = UIImage(named:"136")
        evolutionTextLbl.text = "Evolution depends on stimuli:"
        
       } else {
       currentEvoImg.image = img
        
        
        
        
       if pokemon.nextEvoName == "nil" {
        self.candy.isHidden = true
        self.arrow.isHidden = true
        self.currentEvoImg.isHidden = true
        self.nextEvoImg.isHidden = true
        noevo.image = img
        self.noevo.isHidden = false
        
       } else {
       nextEvoImg.image = img1
        }
        
       if pokemon.nextEvoName == "nil" {
        
        evolutionTextLbl.text = "No more evolutions"
        
       } else if pokemon.stone != "n" {
        evolutionTextLbl.text = "Next evolution by \(pokemon.stone): \(pokemon.nextEvoName.capitalized)"
        
       } else {
       evolutionTextLbl.text = "Next evolution at lv \(pokemon.nextEvoLv): \(pokemon.nextEvoName.capitalized)"
        }}
    }
   
}
