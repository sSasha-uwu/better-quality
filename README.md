# Better Quality
Adds quality scaling to belt speed, drill/pumpjack mining speed, cargo/fluid wagon size, storage tank size, and locomotive speed/power usage, adds options for speed module quality penalty, quality module quality bonus, and adds a number of optional quality-related entities.

Made possible by the Quality Lib mod (https://mods.factorio.com/mod/quality-lib).

## Features

### Entity Quality stat scaling

Adds quality stat scaling to items that did not previously have them. Currently supports the listed items, including vanilla Loaders and AAI Loaders.

Quality scaling is slightly less than the default of vanilla (1.3x, 1.6x, 1.9x, 2.5x), mainly because it kept the final values at Legendary neat.

#### Transport Belt/Splitter/Underground Belt/Loader belt speed, Mining Drill/Pumpjack mining speed, Cargo Wagon/Fluid Wagon size, Storage Tank size:

    Uncommon:  1.2x
    Rare:      1.4x
    Epic:      1.6x
    Legendary: 2.0x

#### Locomotive top speed:

    Uncommon:  1.04x
    Rare:      1.08x
    Epic:      1.12x
    Legendary: 1.20x

#### Locomotive fuel burn rate:

    Uncommon:  0.9x
    Rare:      0.8x
    Epic:      0.7x
    Legendary: 0.5x

### Speed Module and Quality Module options (Optional)
Provides mod options allowing the user to adjust the quality penalty of Speed Modules, and adjust the quality bonus of Quality Modules.

### Optimization Module (Optional)

Added to help optimize certain beacon setups, specifically beaconed quality upcyclers. This module can be added to beacons and provides a small amount of speed and productivity at the cost of increased power draw and pollution generated.

This module is useless within machines and generally suboptimal within beacons, but can be an optimal -- albeit resource inefficient -- choice in situations where throughput is limited, such as the Assemblers and Recyclers handling higher rarity items within beaconed quality upcyclers.

#### Default Stats (Adjustable in mod settings):

    Speed:              1%
    Productivity:       2%
    Energy Consumption: 25%
    Pollution:          5%

#### Recipe:

    In:   Speed Module 3 1x, Productivity Module 3 1x
    Out:  Optimization Module 1x
    Time: 60s

Unlocked via the `Quantum Processor` research.

### Centrifuge 2 (Optional)

Added to help bridge the gap between the Centrifuge and Assembling Machine 3, specifically in terms of Quality recipes. Has very similar stats to the Assembling Machine 3.

#### Stats:

    Health:         400
    Crafting Speed: 1.25
    Energy Usage:   875kW
    Module Slots:   4

#### Recipe:

    In:   Speed Module 4x, Centrifuge 4x
    Out:  Centrifuge 2 1x
    Time: 4s

Unlocked via the `Automation 3` research.

### Bulk Recycler (Optional)

Added to fix issues with Recyclers causing upstream bottlenecks due to their RNG nature. The Bulk Recycler takes in four items instead of one, and outputs the ingredients of one item instead of 1/4th of an item.

Stats are identical to the vanilla Recycler, and is unlocked from the same technology.

### Alternative Recycler Output Location (Optional)

Due to the shape of Recyclers, there is more space towards their long side as opposed to their short side when the Recycler is completely surrounded by Beacons. This option exists to shift the output towards the long side to allow for hyper-optimized beaconed Recycler setups.