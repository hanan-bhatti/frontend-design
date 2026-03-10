# Publishing Guide

Follow these steps to make your skill public and available to all AI agents.

## Step 1: GitHub
1. Ensure your local branch is up to date:
   ```bash
   git add .
   git commit -m "Final metadata sync"
   git push origin main
   ```

## Step 2: NPM
1. Login to NPM: `npm login`
2. Publish: `npm publish --access public` (from the `skill/` directory)

## Step 3: Skills.sh
1. Go to [skills.sh/submit](https://skills.sh/submit).
2. Enter your GitHub URL: `https://github.com/hanan-bhatti/frontend-design`.

## How users will install it:
Users can then run:
```bash
# Via GitHub (Recommended)
claude skill install github.com/hanan-bhatti/frontend-design

# Via NPM
npm install @hanan-bhatti/frontend-design-master
```
