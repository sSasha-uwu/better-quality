# better-quality
Removes the quality penatly from speed modules and adds quality scaling to belt speed, drill/pumpjack mining speed, cargo/fluid wagon size, storage tank size, and locomotive speed/power usage.

Legendary values are 2x base with the exception of Locomotives, which halve the power draw (fuel consumption) and increase top speed by about 30%.

Currently supports both vanilla loaders and AAI loaders, but no other mods. However, adding support for additional items, modded or not, is very easy and modular. See the `common.lua` file for an example of how the quality table structure works.

If you add support for a mod yourself, feel free to submit an issue/pull request on the github. I would be more than happy to accept your contribution.

Due to the hardcoded nature of quality, this mod utilizes new prototypes to replace the original ones in order to increase the relevant stats. This process is automatic upon both player and robot placement, and will also update existing entities on load.

# WARNING

Uninstalling this mod will cause Factorio to delete ALL entities that are added by this mod. It is HIGHLY recommended that you keep a backup of your original save if you install this mod on an existing save. I'm new to Factorio modding, so any suggestions on how to fix this would be appreciated.

There are currently no in-game settings for this mod, as adding them seems like it would be difficult with the way that the current Factorio settings system works. Once again, I'm new, so feel free to make any suggestions and/or contribute to the github.
