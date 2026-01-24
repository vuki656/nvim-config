# Debugging Guide

## Next.js API Routes

### Step 1: Start Next.js with debugging enabled

```bash
NODE_OPTIONS='--inspect' npm run dev
```

You should see: `Debugger listening on ws://127.0.0.1:9229/...`

### Step 2: Set a breakpoint

Open your API route file (e.g., `app/api/something/route.ts`) and press `<Leader>db` on a line inside your handler function.

### Step 3: Attach the debugger

Press `<Leader>dc` and select **"Attach (port 9229)"**

### Step 4: Trigger the breakpoint

Make a request to your API route (via browser, curl, or your app). The debugger should pause at your breakpoint.

---

## Express / Node.js Server

```bash
node --inspect server.js
# or
NODE_OPTIONS='--inspect' npm start
```

Then attach with `<Leader>dc` → "Attach (port 9229)"

---

## Debug a Test

1. Open test file, set breakpoint with `<Leader>db`
2. Cursor on the test you want to debug
3. Press `<Leader>jrd` to debug closest test

---

## Keymaps Reference

| Key | Action |
|-----|--------|
| `<Leader>db` | Toggle breakpoint |
| `<Leader>dB` | Conditional breakpoint |
| `<Leader>dc` | Start/Continue |
| `<Leader>dq` | Terminate session |
| `<Leader>dn` | Step over |
| `<Leader>di` | Step into |
| `<Leader>do` | Step out |
| `<Leader>du` | Toggle DAP UI |
| `<Leader>de` | Evaluate expression |
| `<Leader>dh` | Hover variable |
| `<Leader>jrd` | Debug closest test |

---

## Launch Configurations

| Configuration | Use Case |
|--------------|----------|
| Launch Current File | Run current JS file with node |
| Launch TS File (ts-node) | Run TypeScript file directly |
| Attach (port 9229) | Connect to running process (Next.js, Express) |
| Attach (custom port) | Connect to non-standard debug port |
| Launch NPM Script | Run npm script with debugging |
