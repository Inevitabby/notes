# Rust

- You can do low-level and higher-level programming.
- Strict and helpful compilation.
- Stability.

## Hello World

```rust
fn main() {
    println!("Hello, world!");
}
```
- Indent with four spaces, not a tab
- `main()`{.rust} always runs first
- `println!` is calling a macro, not a function

## Cargo

**Cargo**: Package manager and build system.
- `Cargo.toml`: Configuration file.
- `Cargo.lock`: Contains all dependency info for reproducible builds.
- External dependencies are fetched from *registry* on [Crates.io](https://crates.io/)

**Creating a New Project**: 
```bash
cargo new <project_name>
```
* Creates new rust project in a folder named `<project_name>` with a configuration file and `src` folder
	+ Also does `git init`{.bash} if not already in a Git repository.
	+ Top-level directory is for README, license, etc.

**Building, Running, and Checking:**
```bash
cargo build
```
- Will create a build in `/target/debug/`.
- Add `--release` flag to compile with optimization.
	* Will go in `/target/release/`

```bash
cargo run
```
- Will run the executable in `/target/debug/`
	* You can also still execute it directly
- Will also compile if source has changed (like `make`)

```bash
cargo check
```
- Will check for compiler errors without building.

**Updating Crates**
```bash
cargo update
```
- Will ignore `Cargo.lock` and find latest versions of packages that fit the `Cargo.toml` .

**View Documentation**
```bash
cargo doc --open
```
- Generates documentation for all crates in the project and opens it in the browser.

## Bringing a Library into Scope (`use`)

> **Example**: Bringing in standard IO library
> ```rust
> use std::io;
> ```
> - This lets you do `io::stdin()` instead of `std::io::stdin()`

**Prelude**: List of things Rust automatically imports into every Rust program.
- [https://doc.rust-lang.org/std/prelude/index.html](https://doc.rust-lang.org/std/prelude/index.html)

## Range Expression

> **Example**:
> ```rust
> let secret_number = rand::thread_rng().gen_range(1..=100);
> ```
> - Generates a number between 1 and 100, inclusively.

## Match

**Match**: Like a switch statement for `enum`.
- Made of arms.
- **Arm**: Pattern to match against

## Shadowing

Lets us reused variable names.
- Helpful for converting variable types.
