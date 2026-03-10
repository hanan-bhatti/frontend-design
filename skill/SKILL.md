---
name: frontend-design-master
description: Orchestrates high-craft frontend UI generation using 30+ distinctive aesthetic themes and the 21 Laws of UX. Make sure to use this skill whenever the user mentions designing UIs, creating web layouts, styling components, applying aesthetics (like Cyberpunk, Brutalism, Minimalist), or auditing user experience, even if they don't explicitly ask for a 'design system'.
---

# Frontend Design Master

A high-performance design orchestrator that eliminates generic "AI UI" by enforcing distinctive aesthetics, rigorous UX psychology, and technical excellence.

## Core Philosophy & Mandates

Your goal is to create memorable, high-craft interfaces. 
1. **Never Assume Safe Defaults**: Do not default to bento grids, hero splits, or mesh gradients unless explicitly justified by the brand or user.
2. **Enforce Intentional Aesthetics**: Every design must follow a named, explicit stance (e.g., *Neo-Brutalism*, *SaaS Modern*, *Cyberpunk*).
3. **Apply UX Psychology**: Design decisions must be backed by the 21 Laws of UX (Hick's Law, Fitts' Law, Gestalt principles).
4. **Deliver Production Code**: Output working HTML/CSS/JS or framework code (React/Tailwind), not just visual mockups. Ensure WCAG AA accessibility.

## Progressive Disclosure: When to Read References

Do not read all reference files at once. Read them only when the context demands it:

- `references/laws-of-ux.md` - **REQUIRED**: Read this if you need to justify layout decisions or perform a UX audit.
- `references/ux-psychology.md` - **REQUIRED**: Read this for deep psychological behavioral patterns and trust-building systems.
- `references/color-system.md` - Read when defining palettes (60-30-10 rule) or calculating dark mode contrast.
- `references/typography-system.md` - Read when establishing modular font scales or pairings.
- `references/visual-effects.md` - Read when applying glassmorphism, shadows, or gradients.
- `references/animation-guide.md` - Read when implementing transition timings and micro-interactions.

## Execution Workflow

### Step 1: Constraint Analysis
Identify the Product Type, Tone, Audience, and Tech Stack. 
If the user's request is vague, **ASK** before assuming:
- "What color palette do you prefer?"
- "What specific style are you going for (minimal, retro, corporate)?"

### Step 2: Theme Selection
Select or ask the user to choose from the 30+ available aesthetic themes located in the `data/` directory (e.g., `data/13_neo_brutalism.xml`). Use the `read_file` tool to ingest the specific XML theme constraints before writing code.

### Step 3: Implement Design System
Establish the base tokens:
- **Typography**: 1 expressive display font + 1 restrained body font.
- **Color**: Implement the 60-30-10 rule using CSS variables.
- **Spacing**: Use an 8-point grid system.

### Step 4: Code Generation
Output the requested components adhering to the selected theme and UX laws. 
- Use SVG icons (Lucide/Heroicons) — NEVER use emojis for UI elements.
- Ensure minimum 44x44px touch targets (Fitts' Law).
- Minimize choices to reduce decision fatigue (Hick's Law).

## Runtime Scripts

Use these scripts to validate your work or assist the user:

- **UX Laws Lookup**: `python3 scripts/ux_laws_lookup.py [law_name]`
- **Project UX Audit**: `python3 scripts/laws_auditor.py .`
- **Full UX/A11y Audit**: `python3 scripts/ux_audit.py <path>`
