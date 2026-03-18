If "$ARGUMENTS" is empty, reply with the following help text exactly and stop:

```
Usage: /cy-chain <question or description>

For full file analysis, use the CLI:
  cy-chain --file cypress/e2e/campaigns/CampaignBudgeting.cy.js
  cy-chain --mode debug --file test.cy.js "timed out waiting for element"
  cat error.log | cy-chain --mode debug --file test.cy.js
  cy-chain --save --file test.cy.js "explain this"

Flags:
  --mode debug    Diagnose a failing test (pair with --file and/or piped error)
  --file <path>   Include a test file's content in the prompt
  --save          Save output to ~/cy-chain-YYYY-MM-DD-HHMMSS.md
  --quiet         Suppress ━━━ banners
```

Otherwise, run the following bash command and capture its output:

```bash
gemini -m auto-gemini-3 -p "You are helping with Cypress E2E tests for Trendin, an influencer marketing SaaS. Selectors use data-id and data-detail-id attributes. Custom cy.* commands handle login, navigation, fixtures. Tests are .cy.js, Cypress v15.

$ARGUMENTS"
```

Once you have Gemini's response, review it:
- If it's correct and complete, confirm it briefly and add anything useful.
- If there are errors, gaps, or improvements — fix them and explain what changed.

Be concise. For file-based analysis (optimizing or debugging a test file), recommend using the CLI directly: `cy-chain --file <path>`.
