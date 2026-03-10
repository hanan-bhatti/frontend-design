# Example: Cyberpunk Hero Section

## Prompt
"Design a hero section for a decentralized cloud storage platform using the Cyberpunk theme."

## Design Direction
- **Aesthetic**: Cyberpunk / Glitch
- **DFII**: 14 (High Impact, High Fit)
- **Anchor**: Chromatic aberration on title and scanline overlay.

## Design System Snapshot
- **Typography**: Orbitron (Headings), JetBrains Mono (Body)
- **Colors**: background: #0a0a0f, accent: #00ff88 (Neon Green)
- **Effects**: 1px glowing borders, chamfered corners via clip-path.

## Implementation (HTML/CSS)
```html
<section class="cyber-hero">
  <div class="scanlines"></div>
  <h1 class="glitch" data-text="DECENTRALIZED VOID">DECENTRALIZED VOID</h1>
  <p class="terminal-text">> SECURE YOUR BYTES IN THE SPRAWL...</p>
  <button class="cyber-button">INITIALIZE UPLOAD</button>
</section>

<style>
.cyber-hero {
  background: #0a0a0f;
  color: #00ff88;
  padding: 4rem;
  position: relative;
  overflow: hidden;
}
.glitch {
  font-family: 'Orbitron', sans-serif;
  font-size: 4rem;
  text-shadow: 2px 0 #ff00ff, -2px 0 #00d4ff;
  animation: glitch 2s infinite;
}
.cyber-button {
  background: transparent;
  border: 2px solid #00ff88;
  color: #00ff88;
  padding: 1rem 2rem;
  clip-path: polygon(0 10px, 10px 0, 100% 0, 100% calc(100% - 10px), calc(100% - 10px) 100%, 0 100%);
  transition: all 0.2s;
}
.cyber-button:hover {
  background: #00ff88;
  color: #0a0a0f;
  box-shadow: 0 0 15px #00ff88;
}
@keyframes glitch {
  0% { transform: skew(0deg); }
  20% { transform: skew(-2deg); }
  40% { transform: skew(2deg); }
  100% { transform: skew(0deg); }
}
</style>
```
