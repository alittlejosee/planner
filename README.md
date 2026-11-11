# MY LIFE OS — Version 1.0

A responsive Vietnamese personal life management web app with pastel-blue styling.

## Included modules
- Dashboard overview
- Schedule calendar and daily agenda
- Daily-life log
- Habit tracker
- Task manager with status, due date, priority and filters
- Income/expense ledger, budgets and wallet/account labels
- Notes and journal
- Reports, spending breakdown and CSV export
- JSON backup/restore
- Optional Supabase email/password auth and cloud sync

## Run locally
1. Unzip the package.
2. Open `index.html` in a modern browser. Internet is needed for the Supabase JS CDN and Google Font; local data entry works without a Supabase project.
3. Data is saved in that browser's localStorage until cloud sync is configured.

## Enable cloud sync (Supabase)
1. Create a project at https://supabase.com.
2. In Project Settings > API, copy the Project URL and the publishable/anon key.
3. Open SQL Editor in Supabase and run the contents of `schema.sql`.
4. In Authentication > Providers, enable Email. Configure email confirmation as desired.
5. Open MY LIFE OS > Cài đặt. Paste the Project URL and publishable/anon key, then click **Lưu cấu hình**.
6. Enter your email and password, then choose **Tạo tài khoản** or **Đăng nhập**.
7. After signing in, MY LIFE OS loads that account's data and saves changes to the `lifeos_data` table. Row Level Security ensures each user can access only their own row.

Important: use only the browser-safe publishable/anon key. Never put a Supabase `service_role` key or an AI provider secret key in this page.

## AI roadmap / safe integration
Version 1.0 includes automatic rule-based summaries and spending insights in Reports. To add a real AI provider, create a server-side API route or Supabase Edge Function, store the provider key as a server secret, and send only the minimum necessary user-approved data. Do not expose the AI API key in `index.html`.

## Notes and limitations
- This is a single-user-per-login MVP; it does not yet include shared workspaces or multi-currency support.
- Schedule entries are date-based and displayed in the monthly calendar; recurring-event automation and push notifications are planned for a later release.
- Finance balances are computed from recorded transactions; account balances are not yet reconciled automatically per wallet.
- Cloud sync requires your own Supabase project and configuration. Until then, data stays in the current browser profile.
- Always export a JSON backup before clearing browser data or switching devices before cloud sync is active.


## Finance v1.2
Added income source, main/side job classification, and average monthly primary-job salary based on months with recorded income category "Lương".