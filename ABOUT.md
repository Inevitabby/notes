---
is_about_page: true
---

<center>
	<h1 id="about">About</h1>
</center>

# Me

I am an undergraduate student of Computer Science.

# Why?

This website exists for two reasons:
1. Preservation, and
2. [Open Knowledge](https://en.wikipedia.org/wiki/Open_knowledge)

**Preservation**

> *"He was going to live forever, or die in the attempt."*\
> — Joseph Heller, *Catch-22*

Are all sunk costs fallacies?

It feels incredibly wasteful to have my notes bitrot into nothingness after spending so much time and effort on them, so I spend more time and effort on preserving them.

**Open Knowledge**

Good student resources aren't a natural feature of the landscape in academia, they need real people and community backing them.

It's easy to fall into instrumentalism (e.g., "nobody will benefit", "this is a waste of time"), but that only rationalizes inaction and alienation.

The exemplary route is better. "If I don't, someone won't" is weaker than "if I do, someone might".

$$
\frac{
	\text{Ends}
}{
	\text{Means}
}
\lt
\frac{
	\text{Means}
}{
	\text{Ends}
}
$$

# Workflow & Architecture

## A. Markdown

I take most of my notes in plaintext (Markdown) during lecture.

In unrelated news, the source of the incessant click-clacking keyboard driving you insane during lecture has yet to be found.

When I want to upload my note(s) to [this Codeberg repository](https://codeberg.org/inevitabby/notes/), I just add them to a subfolder named `markdown` inside a parent folder, like so:
```
|-cs1300
|---markdown
|-cs1400
|---markdown
|-cs50
|---markdown
|-phl2020
|---markdown
```
- *Note: New folders need to be added to the `DIRECTORIES` array in `daemon.sh`* 

## B. Conversion

The `daemon.sh` script can be run with `./daemon.sh`, and it's essentially a wrapper for `pandoc` that does multithreading and selective processing.

> **More Info for Nerds**: `daemon.sh` has two states:
> 1. **Running**: Any Markdown files that are edited get converted into HTML.
> 
> > - Script starts in this state.
> > - Uses hashes to detect file edits. Selectivity means CPU doesn't get maxed-out reconverting files, so conversions are faster.
> 
> 2. **Cleanup**: *All* files are converted and `<style>` tags are replaced with a `<link>` pointing to a shared `style.min.css`.
> 
> > - Script enters this state when being killed (`CTRL+C`)
> > - Converting everything allows changes outside of Markdown edits to propagate (e.g., edits to `template.html`)
> 
> **Note**: `daemon.sh` can also be run in oneshot mode with `./daemon.sh -o`, where it just does the cleanup process.

**Tools**

- [`pandoc`](https://pandoc.org): Universal document converter. Converts the Markdown to HTML.
	* A modified version of the [template.html](https://github.com/jgm/pandoc-templates/) file Pandoc uses to convert Markdown to HTML is used to easily plug in new CSS, JS, and HTML without fiddling with Pandoc options.
- [Codeberg Pages](https://codeberg.page/): Codeberg lets you host static websites from Git repositories on Codeberg.
- [`awk`](https://en.wikipedia.org/wiki/AWK): Used for the crackpot HTML minifier.
