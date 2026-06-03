# Catur Cilik Design Guide

Use this document as the single source of truth for all UI and UX updates in this project.

## 1) Product Tone

- Audience: children and beginners learning chess.
- Personality: playful, clear, encouraging, and safe.
- Experience goals:
- Fast to understand.
- Rewarding feedback for progress.
- Consistent visuals across home, game, and overlays.

## 2) Core Visual Direction

- Main palette:
- Primary blue: `#2b9fd8`
- Dark blue: `#1a86bb`
- Accent gold: `#f0a500`
- Success green: `#27ae60`
- Warning/fail red: `#c0392b`
- Neutrals: `#f7f9fc`, `#e8edf2`, `#555`, `#333`
- Chess board colors:
- Light square: `#f0d9b5`
- Dark square: `#b58863`

Keep this bright, kid-friendly style. Avoid switching to dark themes or muted enterprise styles unless explicitly requested.

## 3) Typography

- Display/headings: Fredoka One.
- Supporting/body: Nunito (with Segoe UI fallback).
- Tone:
- Headings should feel fun and bold.
- Helper text should stay simple and readable.

## 4) Layout Principles

- Top nav: compact, always visible, utility actions only.
- Hero: strong visual identity, immediate context, quick status pills.
- Main area:
- Home mode: card grid for entry points.
- Game mode: board-first layout with minimal distractions.
- Overlays/panels: rounded cards, clear close path, high contrast CTA.

Use rounded corners, soft shadows, and clear spacing rhythm. Keep UI touch-friendly and mobile-first.

## 5) Components and States

- Buttons:
- Primary actions use blue or gold accents.
- Hover/active states should be visible but subtle.
- Cards:
- White backgrounds, soft shadows, small lift on hover.
- Board cells:
- Distinct selected, highlight, and reachable-star states.
- Feedback banners/modals:
- Win = green gradient.
- Fail = red gradient.
- Include concise copy and optional iconography.

## 6) Motion and Feedback

- Keep animations playful but short.
- Existing pattern examples to preserve:
- Pop-in for overlays.
- Pulse/glow for actionable targets.
- Shake for invalid action feedback.
- Confetti/spark effects for milestone moments.

Animations should support understanding, not distract from gameplay.

## 7) Accessibility and Usability Rules

- Maintain readable contrast for text and controls.
- Keep touch targets large enough for children (minimum ~40px where possible).
- Preserve icon + text pairing for clarity.
- Do not rely on color alone for game-critical states.
- Support both desktop and mobile layouts.

## 8) Content and Language

- Primary copy style: short, positive, plain-language.
- Languages currently used: ENG and BM.
- Any new player-facing text must include both language variants when relevant.

## 9) Implementation Guardrails for Future Changes

Before merging any UI change, confirm:

1. The new UI matches this color and typography direction.
2. Existing fun/learning tone is preserved.
3. Home/game/overlay consistency remains intact.
4. New states include hover/active/disabled handling where applicable.
5. Mobile behavior still works.
6. No regressions to board readability or game feedback.

## 10) Change Process

For every new design/UI change:

1. Check this file first.
2. If your change introduces a new pattern, update this guide in the same commit.
3. Keep the guide brief and practical; avoid abstract design language.

---

Owner note: This file is the canonical design reference for this project.