// World
private final int SECTORS_PER = 10;
private final int TOTAL_SECTORS = SECTORS_PER * SECTORS_PER;

// Notification
private final int NOTIFICATION_TTL = 10; // Notification time to live.
private final int NOTIFICATION_MAX_OPACITY = 50; // Notification time to live.

// Entity metrics
private final int CATS = 100;
private final int RATS = 250;
private final int CATS_PER_SECTOR = CATS / TOTAL_SECTORS;
private final int RATS_PER_SECTOR = RATS / TOTAL_SECTORS;

// Entity configuration.
// Rats.
private final int RAT_COPULATE_RATE = 10; // Reproduce x out of 1000 times.
private final int RAT_COPULATE_DISTANCE = 5; // Number of pixels a rat has to be close to to qualify for consumption.
private final int RAT_MIN_DEFAULT_TICKS_UNTIL_BLEH = 100; // Default minimum number of ticks before the cat dies without eating.
private final int RAT_MAX_DEFAULT_TICKS_UNTIL_BLEH = 200; // Default maximum number of ticks before the cat dies without eating.
private final int RAT_SINK_SCURRY_THRESHHOLD = 30;
private final int RAT_SINK_LETHAL_THRESHHOLD = 50;
private final int RAT_BULK_REMOVAL = 10;
private final int RAT_SCURRY_SPEED = 10;
private final Boolean RAT_COPULATE_SPORT = false; // Do the rats reproduce for sport? Allows multiple new rats per tick.

// Cats.
private final int CAT_EAT_DISTANCE = 50; // Number of pixels a rat has to be close to to qualify for consumption.
private final int CAT_EAT_CHANCE = 750; // Succeed in eating the rat x out of 1000 times.
private final int CAT_MIN_DEFAULT_TICKS_UNTIL_BLEH = 100; // Default minimum number of ticks before the cat dies without eating.
private final int CAT_MAX_DEFAULT_TICKS_UNTIL_BLEH = 200; // Default maximum number of ticks before the cat dies without eating.
private final int CAT_COPULATE_DISTANCE = 5; // Number of pixels a cat has to be close to to qualify for consumption.
private final int CAT_COPULATE_RATE = 5; // Reproduce x out of 1000 times.
private final int CAT_COPULATE_COST = 20;
private final int CAT_COPULATE_MIN_RATS = 50;
private final int CAT_SINK_SCURRY_THRESHHOLD = 20;
private final int CAT_SINK_LETHAL_THRESHHOLD = 30;
private final int CAT_BULK_REMOVAL = 5;
private final int CAT_SCURRY_SPEED = 10;
private final int CAT_INTELEGENCE_CHASE_REQUIRED = 0;
private final Boolean CAT_SPORT_KILL = false; // Do cats sport kill? Allows multiple dead rats per tick.
private final Boolean CAT_COPULATE_SPORT = false; // Do the cats reproduce for sport? Allows multiple new cats per tick.

// Even though these aren't final/constant, we capitalize because
// they will only be assigned to once in the setup() function.
// Misc.
private int SECTOR_EVERY = 0;
private int FONT_SIZE = 0;
