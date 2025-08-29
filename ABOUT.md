---
is_about_page: true
---

<h1 id="about" class="title">About</h1>
<center>
	<h5><a href="https://gitlab.com/inevitabby/notes/">Link to Repository</a></h5>
</center>

# Why This Exists

## 1. Preservation

> *"He was going to live forever, or die in the attempt."*\
> — Joseph Heller, *Catch-22*

Are all sunk costs fallacies?

It feels incredibly wasteful to learn something and have my notes and memory atrophy after spending the time and effort; so I spend more time and effort on preserving them.

Also, it forces me to explain things to myself, which is good for learning.

## 2. Open Knowledge

Most organizations with the power to share academic knowledge prioritize selling over sharing, but that doesn't mean individuals should be apathetic.

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

## 3. It's Cool

If you're a nerd.

# Workflow & Architecture

## A. Markdown

I take my notes in plaintext (Markdown) during lecture.

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

The `daemon.sh` script can be run with `./daemon.sh`, and it's essentially a wrapper for `pandoc` that does parallel processing and selective processing.

<details><summary>**More Info for Nerds**</summary>

`daemon.sh` has two states:

1. **Running**: Any Markdown files that are edited get converted into HTML.
      - Script starts in this state.
	- Uses hashes to detect file edits.

2. **Cleanup**: *All* files are converted. `<style>` tags are replaced with a `<link>` pointing to a shared `style.min.css`.
      - Script enters this state when being killed (`CTRL+C`)
	- Converting everything allows changes outside of Markdown edits to propagate (e.g., edits to `template.html`)

> **Note**: `daemon.sh` can also be run in oneshot mode with `./daemon.sh -o`, where it just does the cleanup process.
</details>

**Tools Used**

- [GitLab Pages](https://docs.gitlab.com/ee/user/project/pages/): The Git repository is hooked up to a CI to automatically build this website on push.
- [`pandoc`](https://pandoc.org): Universal document converter.
	- Used to convert Markdown to HTML.
	- I use Lua filters to do text postprocessing and extend my Markdown.
- [`minify`](https://github.com/tdewolff/minify): Minification and (especially) CSS bundling.
- [`PlantUML`](https://plantuml.com/): Tool to create diagrams from plaintext.
	* A simple Lua filter ([`plantuml.lua`](https://gitlab.com/inevitabby/notes/-/blob/pages/.util/plantuml.lua?ref_type=heads)) is used to turn all embedded PlantUML into embedded SVGs. 

**Gentoo Dependencies**

- `app-text/pandoc`
- `media-gfx/plantuml`
- `sys-apps/gawk`[^fn1]
- https://github.com/tdewolff/minify[^fn2]

All of this is defined in the CI config, though I have to install these dependencies on my own devices.

[^fn1]: *If your system somehow lacks it.*

[^fn2]: *Since `minify` isn't in the Portage tree yet, I just built it from source and added ~/go/bin to my $PATH.*
