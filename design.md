# React + Postgres - Style Reference
> Editorial field-report aesthetic. Dark and light spreads alternate against animated WebGL backdrops, anchored by a single volt-green accent.

**Theme:** dark-led (with light spreads as counterweight)

This deck reads like a printed field report rendered on a CRT. The base canvas is a near-black ink with a paper-cream counterpart for "turn" pages, both sitting on top of slow, painterly WebGL backgrounds: holographic dispersion on dark spreads, a silver-paper spiral vortex on light ones. Typography does the heavy lifting. Playfair Display drives display headlines with negative tracking and serif italic accents, while IBM Plex Mono works as the magazine chrome - kickers, footers, terminal blocks, metadata. The whole composition feels intentionally analog and editorial, with a single electric color (volt-green) reserved for the moments that matter.

## Tokens - Colors

| Name | Value | Token | Role |
|------|-------|-------|------|
| Ink | `#050507` | `--ink` | Dark page canvas, terminal text on light, default dark background. |
| Ink Tint | `#101010` | `--ink-tint` | Terminal surface, node card surface, subtle dark elevation. |
| Paper | `#f2f2f2` | `--paper` | Light page canvas, primary text on dark, terminal text. |
| Paper Tint | `#b8b3b0` | `--paper-tint` | Warm secondary text on dark spreads. |
| Volt Green | `#00d992` | `--volt-green` | Single accent color. Terminal prompts, hot node borders, hero highlight word. Always carries a soft glow filter. |
| Volt Mint | `#2fd6a1` | `--volt-mint` | Secondary green for layered hot states. |
| Volt Surface | `#101010` | `--volt-surface` | Terminal and node background. |
| Volt Border | `#3d3a39` | `--volt-border` | Terminal and node border. |
| Volt Muted | `#8b949e` | `--volt-muted` | Dim terminal text, secondary metadata. |
| Volt Warm | `#b8b3b0` | `--volt-warm` | Node description text, warm muted body. |
| Volt White | `#f2f2f2` | `--volt-white` | Primary text inside terminal and node surfaces. |
| Warn | `#ffba00` | inline | Terminal warning lines. Use sparingly. |
| Bad | `#fb565b` | inline | Terminal error lines. Use sparingly. |

### Accent gradient

The accent's signature treatment is not a gradient but a glow:

```css
.accent {
  color: var(--volt-green);
  filter: drop-shadow(0 0 6px rgba(0, 217, 146, 0.42));
}
```

Reserve `.accent` for a single highlighted word per hero slide. Never apply it to body copy.

## Tokens - Typography

### Playfair Display - Display headlines, lead quotes, italic emphasis, numerals. The italic cuts carry attitude; the heavy weights pull headlines into magazine-cover territory. Negative tracking at hero sizes tightens the visual.  ·  `--serif-en`
- **Substitute:** Source Serif 4, Georgia, serif
- **Weights:** 400, 500, 600, 700, 800, 900 (plus italic 400, 700)
- **Sizes:** 1.75vw (lead), 2.3vw (h-md), 3.1vw (h-sub), 5.5vw (mid numerals), 6.2vw (h-xl), 8vw (stat numerals), 10vw (h-hero), 11vw (display)
- **Line height:** 0.85 - 1.5 depending on size (tighter as it scales up)
- **Letter spacing:** -0.025 to 0 (always negative or neutral)
- **Role:** Display headlines, lead quotes, italic emphasis, numerals.

### Source Serif 4 - Body serif fallback when Playfair is unavailable, and an optional softer body voice for editorial spreads.  ·  `--serif-body-en`
- **Substitute:** Georgia, serif
- **Weights:** 300, 400, 500, 600 (plus italic 400)

### IBM Plex Mono - Magazine chrome (top metadata, bottom footers), kicker labels, terminal lines, stat-card labels, image captions, chip pills, page counters.  ·  `--mono`
- **Substitute:** SFMono-Regular, Menlo, Monaco, Consolas, monospace
- **Weights:** 400, 500, 600
- **Sizes:** 10px - 13px (most chrome), 0.78vw - 0.95vw (terminal lines)
- **Letter spacing:** 0.14em - 0.3em (always positive, generous)
- **Text transform:** uppercase for all chrome and labels

### Inter - Body sans, node descriptions, comparison body, step descriptions. The neutral counterweight that lets the serif and mono do the talking.  ·  `--sans-body`
- **Substitute:** system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif
- **Weights:** 300, 400, 500, 600, 700
- **Sizes:** 0.92vw (mini-row body), 1vw (stat note), 1.1vw (pillar desc), 1.2vw (lead body)

### Type Scale

| Role | Class | Size | Line Height | Letter Spacing |
|------|-------|------|-------------|----------------|
| kicker (mono uppercase) | `.kicker` | 12px | - | 0.3em |
| meta (mono uppercase) | `.meta`, `.meta-row` | max(11px, 0.88vw) | - | 0.16em |
| chrome (mono uppercase) | `.chrome` | max(11px, 0.78vw) | - | 0.2em |
| foot (mono uppercase) | `.foot` | max(11px, 0.78vw) | - | 0.18em |
| body sans | `.body-zh` | max(15px, 1.22vw) | 1.75 | 0.01em |
| body serif | `.body-serif` | max(15px, 1.3vw) | 1.65 | - |
| lead | `.lead` | 1.75vw - 1.9vw | 1.4 - 1.5 | - |
| h-md | `.h-md` | 2.3vw | 1.3 | - |
| h-sub | `.h-sub` | 3.1vw | 1.25 | - |
| h-xl | `.h-xl` | 6.2vw (often overridden) | 1.08 | -0.01em |
| h-hero | `.h-hero` | 10vw (often overridden 7-9vw) | 0.96 | -0.02em |
| display | `.display` | 11vw | 0.92 | -0.025em |
| big numeral | `.big-num`, `.stat .n` | 8vw - 10vw | 0.85 - 0.88 | -0.03em |
| ghost numeral | `.ghost` | 34vw | 0.8 | -0.04em (6% opacity decorative) |

## Tokens - Spacing & Shapes

**Base unit:** viewport-relative. Padding, gaps, and type scale use `vw`/`vh` so the deck renders at any aspect ratio without layout collapse.

**Density:** spacious. Magazine-like breathing room - hero slides use a full 80vh `.frame`, body slides pad 5-6vh top.

### Spacing scale (in use, not arbitrary)

| Use | Value |
|-----|-------|
| Slide padding | `6vh 6vw 10vh 6vw` |
| Section vertical gap | 3vh - 5vh |
| Inline gap (chips, meta) | 1.2em - 1.4em |
| Grid gap (compare, pillars) | 1.4vw - 4vw |
| Chrome bar top padding | 6vh |
| Foot bar bottom padding | auto (margin-top:auto) |
| Terminal padding | `2.2vh 1.6vw` |
| Stat-card top padding | 1.6vh |

### Border radius

| Element | Value |
|---------|-------|
| Terminal, node | 8px |
| Frame image | 4px |
| Chip | 999px |
| Nav dot (active) | 999px |

### Shadows / Elevation

| Element | Value |
|---------|-------|
| Terminal | `rgba(92, 88, 85, 0.18) 0 0 15px` |
| Node (hot) | `rgba(0, 217, 146, 0.18) 0 0 20px` (plus 2px volt-green border) |
| Accent text glow | `drop-shadow(0 0 6px rgba(0, 217, 146, 0.42))` |

### Layout

- **Slide canvas:** full-bleed `100vw x 100vh`. No max-width constraint.
- **Chrome bar:** top of slide, justify-between, mono uppercase 0.2em.
- **Foot bar:** bottom of slide, justify-between, mono uppercase 0.18em.
- **Frame:** flex column or grid filling the middle. Common grid presets: `grid-2-7-5` (7fr 5fr), `grid-2-6-6` (1fr 1fr), `grid-2-8-4` (8fr 4fr), `grid-3` (3 equal cols), `grid-4` (2x2), `grid-6` (3x2), `grid-3-3` (3x3).

## Components

### Slide Shell
**Role:** Every spread

Outer `<section class="slide [hero] [light|dark]">` with three children: `.chrome` (top), `.frame` (middle, takes remaining space), `.foot` (bottom). The `.slide::before` overlay applies a 78-88% paper/ink wash for legibility on body slides; `.slide.hero::before` drops to 16-22% so the WebGL background bleeds through.

### Chrome Bar
**Role:** Magazine masthead

Top-of-slide flex row, justify-between. Left side is a slug like "Field Report . AI Apps" or "Capability . Auth". Right side is the page counter "07 / 16". Mono, uppercase, 0.2em tracking, ~62% opacity.

### Foot Bar
**Role:** Magazine footer

Bottom-of-slide flex row, justify-between. Left side has a `.title` (serif, sentence case, lower contrast) summarizing the spread's point. Right side is an all-caps mono section label like "PGVECTOR" or "OPTION 03".

### Terminal Block
**Role:** Code / shell exhibits

Volt surface (`#101010`), 1px volt-border, 8px radius, mono. Lines wrap with `white-space:pre-wrap`. Prompts use `<span class="prompt">` in volt-green. Dim notes use `<span class="dim">` in volt-muted. Warnings and errors are warm-yellow and red. Reserved for code, schemas, infra trees, and aphoristic shell lines.

### Stat Card
**Role:** Numeric callouts in `grid-6` or `grid-4`

Top border in `rgba(127,127,127,0.3)`, then a mono uppercase `.stat-label`, a heavy Playfair numeral (`.stat-nb`) at 5.8vw - 7.5vw with `.stat-unit` riding small alongside, then an Inter `.stat-note` description. Used for "1 service / 1 db / 1 engine" style problem maps.

### Pipeline
**Role:** Multi-step flows (request path, lifecycle)

Section starts with a `.pipeline-label` mono header, then a `.pipeline` grid with `data-cols="3|4|5|6"`. Each `.step` carries a `.step-nb` italic Playfair numeral, an Inter `.step-title`, and an Inter `.step-desc`. Top border on each step links them visually as a printed-out timeline.

### Callout Quote
**Role:** Editorial pull-quote

Left border 3px solid currentColor, soft 5% ink wash on light spreads, 6% paper wash on dark. Inside: a `.q-big` Playfair quote at 1.6vw, then a `.callout-src` mono uppercase attribution.

### Diagram Node
**Role:** Architecture cards

Volt surface card with a mono uppercase `.label`, a bold Inter `.name`, and an Inter `.desc`. Add `.hot` for the spotlight node - 2px volt-green border and the volt-green glow shadow.

### Pillar
**Role:** Tradeoff or principle cards

3-column grid. Each pillar has an oversized italic Playfair index (`.ic`), a bold Playfair `.t` title at 2.4vw, and an Inter `.d` description.

### Compare Columns
**Role:** Three-way side-by-side

`.compare` 3-column grid. Each `.colbox` opens with a top border, then a Playfair `h3` at 2vw, then an Inter paragraph at ~78% opacity. Used for "Auth / Vectors / Realtime" type comparisons.

### Mini Table
**Role:** Side-by-side result matrix

`.mini-table` with a `.mini-row.head` (mono uppercase 0.16em) and subsequent `.mini-row`s. First column is mono uppercase 0.1em tracking (the concern name); other columns are Inter body.

### Chip Line
**Role:** Tag pills under hero/turn slides

Flex wrap row of `.chip` pills - mono uppercase 0.12em, 999px radius, 1px currentColor border, low-opacity surface fill that flips between dark and light modes.

### Magazine Numerals
**Role:** Decorative oversized digits

`.big-num` (10vw heavy) and `.ghost` (34vw at 6% opacity, absolutely positioned) provide silent typographic anchors. Use sparingly - one per slide max.

## Do's and Don'ts

### Do
- Lead every spread with the chrome + frame + foot triad. The deck reads as a printed magazine; chrome is the recurring identity.
- Reserve `volt-green` (`#00d992`) for moments of truth: one accent word per hero, terminal prompts, hot nodes. Apply the glow filter (`drop-shadow(0 0 6px rgba(0,217,146,0.42))`) when used as text.
- Alternate dark and light spreads. Adjacent dark slides flatten the rhythm; the silver-paper light spreads exist specifically to give the WebGL palette a counter-beat.
- Use Playfair Display for every headline at 5vw and up, with negative letter-spacing baked into `.h-hero`, `.h-xl`, `.display`. Tighter tracking is part of the editorial voice.
- Use IBM Plex Mono uppercase with at least 0.16em tracking for every kicker, chrome label, foot label, stat-card label, image caption, and chip. Tight mono is incorrect at this scale.
- Keep terminal blocks honest: real-looking SQL or shell. The terminal is a content surface, not decoration.
- Use viewport units (`vw`, `vh`) for every dimension that should scale. The deck must render at 16:9, 16:10, and projector aspect ratios.

### Don't
- Never put body copy in Playfair Display. Italic emphasis is fine; full paragraphs in serif kill scanability.
- Never use volt-green for body text, headlines, or chrome. The accent loses meaning the moment it spreads.
- Never use black `#000` for ink or pure white `#fff` for paper. The deck uses `#050507` and `#f2f2f2` to keep the WebGL backdrop visible.
- Never apply hard shadows or saturated drop-shadows. Elevation comes from the WebGL gradient and subtle 1px borders, not from CSS lift effects.
- Never mix sentence case with the all-caps mono chrome. Chrome, kickers, footers, captions are always uppercase with generous tracking.
- Never pack a hero slide. Heros use lighter overlays so the WebGL shows through; over-stuffed heros muddy the painterly background.
- Never use em-dashes in slide copy. The deck reads as carefully edited; em-dashes are an AI tell.

## Elevation

- **Terminal:** 1px `--volt-border` + soft `rgba(92,88,85,0.18) 0 0 15px` ambient glow.
- **Node (hot):** 2px `--volt-green` border + `rgba(0,217,146,0.18) 0 0 20px` glow.
- **Frame image:** flat 4px corner, no shadow. The WebGL backdrop provides ambient depth.
- **Accent text:** `drop-shadow(0 0 6px rgba(0,217,146,0.42))` - never a box shadow.

## Imagery

The visual atmosphere is generated, not photographic. Two WebGL fragment shaders bathe the deck:

- **Dark shader (Holographic Dispersion):** subtle rainbow perturbations driven by mouse position, layered cosine palettes, and a softly pulsing highlight. Looks like a hot foil chrome plate catching ambient light.
- **Light shader (Spiral Vortex):** domain-warped FBM noise in silver-paper tones, with low-intensity violet/blue refractions and a mouse-radial repulsion field. Looks like brushed metal under a soft sky.

Both shaders animate at requestAnimationFrame, so motion is constant but slow enough to read as ambient. Body class `.light-bg` cross-fades the canvases over 1.2s when the active slide switches theme. No raster photography. No icon imagery except the optional Lucide outline icons at 1.4 stroke weight.

## Layout

Each slide is `100vw x 100vh`. Inside, padding is `6vh 6vw 10vh 6vw`. The `.frame` flex-column or grid takes the middle space; chrome and foot bookend it. Hero slides skip rigid grids and let one headline + lead + chipline anchor the page. Content slides lean on the named grids (`grid-2-7-5`, `grid-2-6-6`, `grid-2-8-4`, `grid-3`, `grid-4`, `grid-6`) to keep visual structure consistent without prescribing exact pixel sizes.

Reading order is left-to-right, top-to-bottom, with the chrome line and foot line treated like newspaper running heads. A reader who only reads the chrome and foot lines should still get a coherent table of contents.

## Agent Prompt Guide

### Quick color reference
- Page (dark): `Ink` (#050507)
- Page (light): `Paper` (#f2f2f2)
- Body text (on dark): `Paper` (#f2f2f2) at 60-85% opacity
- Body text (on light): `Ink` (#050507) at 60-85% opacity
- Accent (sparingly): `Volt Green` (#00d992) with glow
- Surface (terminal, node): `Volt Surface` (#101010)
- Border: `Volt Border` (#3d3a39)

### Example component prompts

1. **Create a hero slide:** Wrap in `<section class="slide hero dark">`. Add `<div class="chrome">` with a left slug ("Field Report . AI Apps") and a right page counter ("01 / 16"). Inside `<div class="frame">`, split 1.05fr / 0.95fr. Left column: `.kicker` mono uppercase, then `<h1 class="h-hero h-hero-en">` with one word wrapped in `<span class="accent">`. Below it a `.lead` paragraph capped at 52vw, then a `.meta-row` chip-style mono row. Right column: a `Terminal` block of 4-5 lines including one `<span class="prompt">$</span>` line. Close with `<div class="foot">` showing the spread's editorial title and a right-side section label.

2. **Create a stat-card grid for problems:** On a light spread, after the kicker and h-xl headline, add `<div class="grid-6">`. Render six `.stat-card` blocks: label (mono uppercase), `.stat-nb` Playfair numeral with a tiny `.stat-unit`, and a one-line `.stat-note`. Use this for "junk drawer" enumerations - never for more than 6 items.

3. **Create a pipeline section:** Add `<div class="pipeline-section">`, then `<div class="pipeline-label">` mono uppercase header ("Request path"), then `<div class="pipeline" data-cols="5">` with five `.step` children. Each step gets a `.step-nb` italic Playfair numeral (01, 02, ...), an Inter `.step-title`, and a one-sentence `.step-desc`. Keep total step count to 3-5; this is a printed timeline, not a swim lane.

4. **Create a comparison row:** `<div class="compare">` with three `.colbox` children. Each opens with an `<h3>` in Playfair at 2vw and a single-paragraph `<p>` at ~78% opacity. Three columns is the right count; four feels cramped on widescreen.

5. **Create a closing slide:** Use `<section class="slide hero light">`. Center a giant `.h-hero` headline, a single `.lead` paragraph, and a small Terminal showing 3 takeaway lines prefixed with `$`. Skip chips. Skip stat cards. The close should feel quiet.

## Similar Brands

- **MIT Technology Review** - serif-heavy editorial with mono asides, dark covers, restrained accent palette.
- **Pentagram** - poster-grade typographic composition, oversized numerals, geometric chrome.
- **Bloomberg Businessweek** - magazine running-head chrome, dense pull-quotes, contrarian color usage.
- **Wired (print)** - tech-magazine voice with playful but disciplined hierarchy, terminal-tone code blocks.
- **Edge (the games magazine)** - dramatic full-bleed spreads with low-key UI, monospace metadata at the gutter.
- **IDEO design briefs** - field-report tone, kicker labels, body serif with sans support.

## Quick Start

### CSS Custom Properties

```css
:root {
  /* Theme colors (active system) */
  --ink: #050507;
  --ink-rgb: 5, 5, 7;
  --ink-tint: #101010;
  --paper: #f2f2f2;
  --paper-rgb: 242, 242, 242;
  --paper-tint: #b8b3b0;

  /* Volt accent palette */
  --volt-bg: #050507;
  --volt-surface: #101010;
  --volt-border: #3d3a39;
  --volt-green: #00d992;
  --volt-mint: #2fd6a1;
  --volt-muted: #8b949e;
  --volt-warm: #b8b3b0;
  --volt-white: #f2f2f2;

  /* Fonts */
  --serif-en: "Playfair Display", "Source Serif 4", Georgia, serif;
  --serif-body-en: "Source Serif 4", Georgia, serif;
  --serif-display: var(--serif-en);
  --mono: "SFMono-Regular", "IBM Plex Mono", Menlo, Monaco, Consolas, monospace;
  --sans-body: Inter, system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
}

.accent {
  color: var(--volt-green);
  filter: drop-shadow(0 0 6px rgba(0, 217, 146, 0.42));
}
```

### Tailwind v4

```css
@theme {
  /* Colors */
  --color-ink: #050507;
  --color-ink-tint: #101010;
  --color-paper: #f2f2f2;
  --color-paper-tint: #b8b3b0;
  --color-volt-green: #00d992;
  --color-volt-mint: #2fd6a1;
  --color-volt-surface: #101010;
  --color-volt-border: #3d3a39;
  --color-volt-muted: #8b949e;
  --color-volt-warm: #b8b3b0;
  --color-volt-white: #f2f2f2;

  /* Fonts */
  --font-serif-en: "Playfair Display", "Source Serif 4", Georgia, serif;
  --font-serif-body-en: "Source Serif 4", Georgia, serif;
  --font-mono: "SFMono-Regular", "IBM Plex Mono", Menlo, Monaco, Consolas, monospace;
  --font-sans-body: Inter, system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
}
```
