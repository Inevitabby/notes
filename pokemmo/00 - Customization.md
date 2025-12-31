---
title: "Client Customization"
---

# Mods

## Aesthetic

- Theme: [Archetype](https://github.com/ssjshields/archetype)
- Followers: [Complete PokeMMO Follower Sprites](https://forums.pokemmo.com/index.php?/topic/138391-complete-pokemmo-follower-sprites-updated-and-fixed-version-legendary-and-forms-included/)
- Music: [PokeMMO Music Remastered](https://forums.pokemmo.com/index.php?/topic/150396-mod-pokemmo-music-remastered-complete-music-overhaul/)

> **Aside**: Archetype Installation
> 
> Archetype is available via GitHub and can be cloned directly into the mod folder like:
> 
> ```bash
> git clone "https://github.com/ssjshields/archetype" --depth 1
> ```

## Utility

- Strings: [SupersStrings!](https://forums.pokemmo.com/index.php?/topic/188112-supersstrings/)
- Weakness Chart: [Bullseye Injector](https://github.com/UncleTyrone/Bullseye-Injector)

> **Aside**: [**IMPORTANT**] — Bullseye Injector Scaling Fix
> 
> In `./sprites/battlesprites/table-summary-scale.txt`:
> - Replace all instances of `2.70` with `1.75`

> **Aside**: What is a String mod?
> 
> All game text (strings) can be dumped to XML and customized.
> 
> This means you can:
> 1. Add more text to convey useful information (e.g., replace "`Modest`" with "`Modest [+SpA|-Atk]`" to reduce nature/item memorization),
> 2. Remove text to make the game snappier (e.g., removing "X got Y experience" message spam), and
> 3. Combine several messages into a single massive text block.
> 
> ---
> 
> e.g., Instead of a trainer saying:
> 
> ```
> Yammy: So, you finally made it...<confirm>
> Yammy: That's right, the real gym leader was me all<confirm>
> Yammy: along!<confirm>
> Yammy: Here I come!<confirm>
> ```
> 
> You would just get a single message like:
> 
> ```
> [$8632] / +50%[$12948] / +75%[$15106] / +100%[$17264]
> 
> Yammy: So, you finally made it... That's right, the real gym leader was me all along! Here I come!<confirm>
> ```

> **Aside**: What is Bullseye?
> 
> Bullseye is a sprite mod that modifies every single Pokemon sprite to have some symbols next to it that display its type weaknesses.
> 
> This is useful if you can't remember type weaknesses, and in certain situations (e.g., double battles) the vanilla UI won't tell you whether a move is effective.

# Keybinds

## Control

Key A: `<Spacebar>`

## Overworld Hotbar

| Hotbar Position |     1     |  2  |  3   |   4   |    5    |    6     |    7     |     8     |      9      |
|-----------------|:---------:|:---:|:----:|:-----:|:-------:|:--------:|:--------:|:---------:|:-----------:|
| Keybind         |    `1`    | `2` | `L`  |  `R`  |   `Z`   |   `M`    |   `T`    |    `F`    |     `S`     |
| Item            | Sprayduck |     | Lure | Repel | Bicycle | Town Map | Teleport | Super Rod | Sweet Scent |

> **Aside**: More Explanation
> 
> - Teleport: Teleports you to the nearest PC, right in front of Nurse Joy!
> - Town Map: Just the map. Click on a town to Fly there.
> - Bike: Lets you move through the overworld faster.
> - Super Rod: Lets you fish for Pokemon.
> - Sweet Scent: Summons hordes, used for [XP / EV Training](https://forums.pokemmo.com/index.php?/topic/77490-simple-ev-training-leveling-guide-using-horde/).

## Battle Hotbar

| Hotbar Position |     1      |     2      |     3      |     4     |     5     |
|-----------------|:----------:|:----------:|:----------:|:---------:|:---------:|
| Keybind         |    `1`     |    `2`     |    `L`     |    `R`    |    `Z`    |
| Item            | Great Ball | Ultra Ball | Quick Ball | Dusk Ball | Poké Ball |

## Movement

`hjkl` for movement can be better than arrow keys if your keyboard is small (e.g., I use `hjkl` on my laptop, but arrow keys on my desktop)
