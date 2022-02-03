// World
final int SECTORS_PER = 10;
final int TOTAL_SECTORS = SECTORS_PER * SECTORS_PER;

// Notification
final int NOTIFICATION_TTL = 10; // Notification time to live.
final int NOTIFICATION_MAX_OPACITY = 50; // Notification time to live.

// Entity metrics
final int CATS = 100;
final int RATS = 750;
final int CATS_PER_SECTOR = CATS / TOTAL_SECTORS;
final int RATS_PER_SECTOR = RATS / TOTAL_SECTORS;

// Entity configuration.
final int RAT_OUTBREAK = 10; // Chance per tick for a outbreak of rats to happen somewhere. Chance out of 1000.
final int RAT_OUTBREAK_MIN = 10; // Minimum number of rats per rat outbreak.
final int RAT_OUTBREAK_MAX = 10; // Maximum number of rats per rat outbreak.

// Rats.
final int RAT_COPULATE_RATE = 25; // Reproduce x out of 1000 times.
final int RAT_COPULATE_DISTANCE = 10; // Number of pixels a rat has to be close to to qualify for consumption.
final int RAT_MIN_DEFAULT_TICKS_UNTIL_BLEH = 100; // Default minimum number of ticks before the cat dies without eating.
final int RAT_MAX_DEFAULT_TICKS_UNTIL_BLEH = 200; // Default maximum number of ticks before the cat dies without eating.
final int RAT_SINK_LETHAL_THRESHHOLD = 50; // The max number of rats in a sector before they start to die.
final int RAT_BULK_REMOVAL = 10; // The amount of rats that die per tick in a sector that exeeds the lethal threadhold.
final int RAT_SCURRY_SPEED = 10; // The scurry speed of the rats.
final Boolean RAT_COPULATE_SPORT = false; // Do the rats reproduce for sport? Allows multiple new rats per tick.

// Cats.
final int CAT_EAT_DISTANCE = 75; // Number of pixels a rat has to be close to to qualify for consumption.
final int CAT_EAT_CHANCE = 1000; // Succeed in eating the rat x out of 1000 times.
final int CAT_MIN_DEFAULT_TICKS_UNTIL_BLEH = 100; // Default minimum number of ticks before the cat dies without eating.
final int CAT_MAX_DEFAULT_TICKS_UNTIL_BLEH = 200; // Default maximum number of ticks before the cat dies without eating.
final int CAT_COPULATE_DISTANCE = 5; // Number of pixels a cat has to be close to to qualify for consumption.
final int CAT_COPULATE_RATE = 10; // Reproduce x out of 1000 times.
final int CAT_COPULATE_COST = 20; // The amount of ticks until bleh it takes to reproduce.
final int CAT_COPULATE_MIN_RATS = 50; // The minimum number of rats that is required for reproduction.
final int CAT_SINK_LETHAL_THRESHHOLD = 30; // The max number of cats in a sector before they start to die.
final int CAT_BULK_REMOVAL = 5; // The amount of cats that die per tick in a sector that exeeds the lethal threadhold.
final int CAT_SCURRY_SPEED = 10; // The scurry speed of the cats.
final int CAT_INTELEGENCE_CHASE_REQUIRED = 75; // The intelegence of a cat before it can track a dense rat sector. Intelegence is random between 1-100.
final int CAT_INTELEGENCE_SUDDEN_DUNCE = 0; // The chance that a cat will suddenly become a dunce (intelegence 0) for destination reached. Chance out of 1000.
final Boolean CAT_SPORT_KILL = false; // Do cats sport kill? Allows multiple dead rats per tick.
final Boolean CAT_COPULATE_SPORT = false; // Do the cats reproduce for sport? Allows multiple new cats per tick.

// Even though these aren't final/constant, we capitalize because
// they will only be assigned to once in the setup() function.
// Misc.
int SECTOR_EVERY = 0;
int FONT_SIZE = 0;
