# Publishing Guide

Follow these steps to make your skill public and available to all AI agents.

## Step 1: GitHub
1. Create a repo on GitHub named `frontend-design-master`.
2. Push your current folder:
   ```bash
   git remote add origin https://github.com/your-username/frontend-design-master.git
   git branch -M main
   git push -u origin main
   ```

## Step 2: NPM
1. Login to NPM: `npm login`
2. Publish: `npm publish --access public` (from the `skill/` directory)

## Step 3: Skills.sh
1. Go to [skills.sh/submit](https://skills.sh/submit).
2. Enter your GitHub URL: `https://github.com/your-username/frontend-design-master`.

## How users will install it:
Users can then run:
```bash
# Via GitHub
claude skill install github.com/your-username/frontend-design-master

# Via NPM
npm install @your-username/frontend-design-master
```
