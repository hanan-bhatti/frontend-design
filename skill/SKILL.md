# Frontend Design Master (Unified Pro)

A high-performance design orchestrator that eliminates generic UI by enforcing distinctive aesthetics, rigorous UX psychology, and technical excellence.

## 🎯 Selective Reading Rule (MANDATORY)

**Read REQUIRED files always, OPTIONAL only when needed:**

| File | Status | When to Read |
|------|--------|--------------|
| [ux-psychology.md](references/ux-psychology.md) | 🔴 **REQUIRED** | Always read first! |
| [color-system.md](references/color-system.md) | ⚪ Optional | Color/palette decisions |
| [typography-system.md](references/typography-system.md) | ⚪ Optional | Font selection/pairing |
| [visual-effects.md](references/visual-effects.md) | ⚪ Optional | Glassmorphism, shadows, gradients |
| [animation-guide.md](references/animation-guide.md) | ⚪ Optional | Animation needed |
| [motion-graphics.md](references/motion-graphics.md) | ⚪ Optional | Lottie, GSAP, 3D |
| [decision-trees.md](references/decision-trees.md) | ⚪ Optional | Context templates |

## ⚠️ CRITICAL: ASK BEFORE ASSUMING (MANDATORY)

> **STOP! If the user's request is open-ended, DO NOT default to safe patterns.**

| AI Default Tendency | Why It's Bad | Think Instead |
|---------------------|--------------|---------------|
| **Bento Grids** | Overused cliché | Why does this NEED a grid? |
| **Hero Split** | Predictable | Massive Typography or Vertical Narrative? |
| **Mesh Gradients** | Lazy background | Radical color pairing? |
| **Fintech Blue** | Safe harbor | Red, Black, or Neon Green? |
| **Rounded corners** | Generic | Sharp, brutalist edges? |

## 1. Design Intelligence Categories

| Priority | Category | Impact | Domain |
|----------|----------|--------|--------|
| 1 | Accessibility | CRITICAL | `ux` |
| 2 | Interaction | CRITICAL | `ux` |
| 3 | Performance | HIGH | `ux` |
| 4 | Layout | HIGH | `ux` |
| 5 | Style/Color | MEDIUM | `style`, `color` |

## 2. Aesthetic Themes Library (30+)

Trigger by name or use the internal search script:

| Monochrome | Bauhaus | Modern Dark | Newsprint | SaaS Modern |
|---|---|---|---|---|
| Luxury | Terminal | Swiss Minimalist | Kinetic | Flat Design |
| Art Deco | Material Design | Neo-Brutalism | Bold Typography | Academia |
| Cyberpunk | Web3 | Playful Geometric | Minimal Dark | Claymorphism |
| Professional | Botanical | Vaporwave | Enterprise | Sketch |
| Industrial | Neumorphism | Organic | Maximalism | Retro |

## 3. Design Feasibility & Impact Index (DFII)

Evaluate direction before execution (Score -5 to +15):
`DFII = (Impact + Fit + Feasibility + Performance) − Consistency Risk`

- **12–15**: Excellent - Execute fully.
- **8–11**: Strong - Proceed with discipline.
- **≤ 3**: Weak - Rethink aesthetic direction.

## 4. Execution Workflow

### Step 1: Analyze Constraints
Identify Product Type, Tone, Audience, and Stack. **ASK** if vague.

### Step 2: Generate Design System
Use the `--design-system` pattern to define Patterns, Styles, Colors, and Typography. Avoid AI safe-harbors.

### Step 3: Implementation
- **Typography**: 1 expressive display font + 1 restrained body font.
- **Color**: 60-30-10 distribution using CSS variables.
- **Motion**: Purposeful entrance sequences (transform/opacity).
- **Code**: Semantic HTML, Accessible (WCAG AA), Performance-optimized.

## 5. Runtime Scripts & Tools

| Script | Purpose | Usage |
|--------|---------|-------|
| `search.py` | Design System Search | `python3 scripts/search.py "keywords" --design-system` |
| `ux_audit.py` | UX/A11y Audit | `python3 scripts/ux_audit.py <path>` |

## 6. Integration Rules

- **Iconography**: No emojis. Use SVG (Lucide/Heroicons) exclusively.
- **Hover**: Stable states, no layout shifts.
- **Touch**: 44x44px minimum targets.
- **Spacing**: 8-point grid rhythm.

---
**License**: MIT
**Author**: Hanan Bhatti
**Version**: 1.0.0
