# Example: Neo-Brutalism Pricing Card

## Prompt
"Create a pricing section for a design tool using the Neo-Brutalism style."

## Design Direction
- **Aesthetic**: Neo-Brutalism
- **DFII**: 13 (High Impact, High Visibility)
- **Anchor**: 4px hard black borders and offset solid shadows.

## Design System Snapshot
- **Typography**: Space Grotesk (Black 900 for headings)
- **Colors**: bg: #FFFDF5, accent: #FF6B6B (Hot Red)
- **Effects**: active:translate-x-[2px] for mechanical click feel.

## Implementation (HTML/CSS)
```html
<div class="pricing-card">
  <h2 class="plan-title">PRO PLAN</h2>
  <div class="price">$29<span>/mo</span></div>
  <ul class="features">
    <li>★ Unlimited Projects</li>
    <li>★ 4K Exports</li>
    <li>★ Custom Domain</li>
  </ul>
  <button class="neo-button">GET STARTED</button>
</div>

<style>
.pricing-card {
  background: #fff;
  border: 4px solid #000;
  box-shadow: 8px 8px 0px #000;
  padding: 2rem;
  max-width: 300px;
  font-family: 'Space Grotesk', sans-serif;
}
.plan-title {
  font-weight: 900;
  font-size: 2rem;
  background: #FFD93D;
  border-bottom: 4px solid #000;
  margin: -2rem -2rem 1.5rem -2rem;
  padding: 1rem;
}
.price {
  font-size: 3rem;
  font-weight: 900;
}
.neo-button {
  width: 100%;
  background: #FF6B6B;
  border: 4px solid #000;
  box-shadow: 4px 4px 0px #000;
  padding: 1rem;
  font-weight: 700;
  cursor: pointer;
  transition: all 0.1s;
}
.neo-button:active {
  transform: translate(2px, 2px);
  box-shadow: 0px 0px 0px #000;
}
</style>
```
