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

I take most of my notes in plaintext (Markdown) during lecture.

In an unrelated note, the source of the incessant click-clacking keyboard driving you insane during lecture has yet to be found.

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

The `markdown_to_html.sh` Bash script will convert any unconverted/updated Markdown files into HTML automatically and can be run on a timer like so—
```bash
watch "bash markdown_to_html.sh"
```
—while cleaning/editing the Markdown files, before just committing to the repo.

And that's all!

If you're interested in the details, keep reading, but that's all for this about page.

**Architecture**

- [`pandoc`](https://pandoc.org): Universal document converter. Converts the Markdown to HTML.
	* A modified version of the [template.html](https://github.com/jgm/pandoc-templates/) file Pandoc uses to convert Markdown to HTML is used to easily plug in new CSS, JS, and HTML without fiddling with Pandoc options.
- [`markdown_to_html.sh`](https://codeberg.org/Inevitabby/notes/src/branch/pages/markdown_to_html.sh): Bash script that acts as a wrapper for `pandoc` that:
	1. Improves performance by converting files in parallel
	2. Stores the hash of every Markdown file and uses the hash to detect when a file is changed (allowing the script to convert files only when necessary, which prevents the script from maxing out the CPU processing files over-and-over when being run by `watch`) [rel: [`check_hash.sh`](https://codeberg.org/Inevitabby/notes/src/branch/pages/check_hash.sh)]
	3. Minifying the HTML with a crackpot `awk` script [rel: [`minify.awk`](https://codeberg.org/Inevitabby/notes/src/branch/pages/minify.awk)]
- [Codeberg Pages](https://codeberg.page/): Codeberg lets you host static websites from Git repositories on Codeberg.
