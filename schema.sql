-- MY LIFE OS: Supabase SQL setup
-- Run this in Supabase Dashboard > SQL Editor.
create table if not exists public.lifeos_data (
  user_id uuid primary key references auth.users(id) on delete cascade,
  payload jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.lifeos_data enable row level security;

drop policy if exists "Users can read their own lifeos data" on public.lifeos_data;
create policy "Users can read their own lifeos data"
  on public.lifeos_data for select
  using (auth.uid() = user_id);

drop policy if exists "Users can insert their own lifeos data" on public.lifeos_data;
create policy "Users can insert their own lifeos data"
  on public.lifeos_data for insert
  with check (auth.uid() = user_id);

drop policy if exists "Users can update their own lifeos data" on public.lifeos_data;
create policy "Users can update their own lifeos data"
  on public.lifeos_data for update
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);
