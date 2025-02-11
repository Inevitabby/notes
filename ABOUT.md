---
is_about_page: true
---

<center>
	<h1 id="about">About</h1>
	<h5><a href="https://gitlab.com/inevitabby/notes/">Link to Repository</a></h5>
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

It feels incredibly wasteful to have my notes rot into nothingness after spending so much time and effort on them, so I spend more time and effort on preserving them. At the bare minimum, it's good review for myself.

**Open Knowledge**

Despite drowning in information, a lot of academic knowledge is locked-up behind textbooks, semester-long subscriptions, and increasing cost-per-credit hours—

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


—I hope that you'll be inspired to not only preserve, but share your knowledge, too.

# Workflow & Architecture

## A. Markdown

I take most of my notes in plaintext (Markdown) during lecture.

In unrelated news, the source of the incessant click-clacking keyboard driving you insane during lecture has yet to be found.

When I want to upload my note(s) to [this GitLab repository](https://gitlab.com/inevitabby/notes/), I just add them to a folder, like so:
```
|-cs1300
|--index.md
|--01 - Formal Logic.md
|--02 - Propositional Logic.md
|--etc...
|-cs1400
|--etc...
|-phl2020
|--etc...
```

## B. Conversion

The `daemon.sh` script can be run with `./daemon.sh`, and it's essentially a wrapper for `pandoc` that does multithreading and selective processing.

> **More Info for Nerds**: `daemon.sh` has two states:
> 1. **Running**: Any Markdown files that are edited get converted into HTML.
> 
> > - Script starts in this state.
> > - Uses hashes to detect file edits.
> 
> 2. **Cleanup**: *All* files are converted. `<style>` tags are replaced with a `<link>` pointing to a shared `style.min.css`.
> 
> > - Script enters this state when being killed (`CTRL+C`)
> > - Converting everything allows changes outside of Markdown edits to propagate (e.g., edits to `template.html`)
> 
> **Note**: `daemon.sh` can also be run in oneshot mode with `./daemon.sh -o`, where it just does the cleanup process.

**Tools Used**

- [GitLab Pages](https://docs.gitlab.com/ee/user/project/pages/): GitLab lets you host static websites from Git repositories on GitLab.
- [`pandoc`](https://pandoc.org): Universal document converter. Used to convert Markdown to HTML.
	* A modified version of the [template.html](https://github.com/jgm/pandoc-templates/) file Pandoc uses to convert Markdown to HTML is used to easily plug in new CSS, JS, and HTML without fiddling with Pandoc options.
- [`awk`](https://en.wikipedia.org/wiki/AWK): Used for the crackpot HTML minifier.
- [`PlantUML`](https://plantuml.com/): Tool to create diagrams from plain text.
	* A simple Lua filter ([`plantuml.lua`](https://gitlab.com/inevitabby/notes/-/blob/pages/.util/plantuml.lua?ref_type=heads)) is used to turn all embedded PlantUML into embedded SVGs. 

**Gentoo Packages**

```
app-text/pandoc
sys-apps/gawk
media-gfx/plantuml
```
