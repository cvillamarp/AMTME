create extension if not exists pgcrypto;

create or replace function public.set_row_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = timezone('utc', now());
  return new;
end;
$$;

create table if not exists public.master_sections (
  id uuid primary key default gen_random_uuid(),
  owner_id text not null,
  workspace_key text not null default 'primary',
  payload jsonb not null,
  created_at timestamptz not null default timezone('utc', now()),
  updated_at timestamptz not null default timezone('utc', now())
);

create table if not exists public.episodes (
  id uuid primary key default gen_random_uuid(),
  owner_id text not null,
  workspace_key text not null default 'primary',
  payload jsonb not null,
  created_at timestamptz not null default timezone('utc', now()),
  updated_at timestamptz not null default timezone('utc', now())
);

create table if not exists public.visual_assets (
  id uuid primary key default gen_random_uuid(),
  owner_id text not null,
  workspace_key text not null default 'primary',
  payload jsonb not null,
  created_at timestamptz not null default timezone('utc', now()),
  updated_at timestamptz not null default timezone('utc', now())
);

create table if not exists public.content_pieces (
  id uuid primary key default gen_random_uuid(),
  owner_id text not null,
  workspace_key text not null default 'primary',
  payload jsonb not null,
  created_at timestamptz not null default timezone('utc', now()),
  updated_at timestamptz not null default timezone('utc', now())
);

create table if not exists public.metrics_monthly (
  id uuid primary key default gen_random_uuid(),
  owner_id text not null,
  workspace_key text not null default 'primary',
  payload jsonb not null,
  created_at timestamptz not null default timezone('utc', now()),
  updated_at timestamptz not null default timezone('utc', now())
);

create table if not exists public.metrics_episode (
  id uuid primary key default gen_random_uuid(),
  owner_id text not null,
  workspace_key text not null default 'primary',
  payload jsonb not null,
  created_at timestamptz not null default timezone('utc', now()),
  updated_at timestamptz not null default timezone('utc', now())
);

create table if not exists public.checklists (
  id uuid primary key default gen_random_uuid(),
  owner_id text not null,
  workspace_key text not null default 'primary',
  payload jsonb not null,
  created_at timestamptz not null default timezone('utc', now()),
  updated_at timestamptz not null default timezone('utc', now())
);

create table if not exists public.calendar_events (
  id uuid primary key default gen_random_uuid(),
  owner_id text not null,
  workspace_key text not null default 'primary',
  payload jsonb not null,
  created_at timestamptz not null default timezone('utc', now()),
  updated_at timestamptz not null default timezone('utc', now())
);

create table if not exists public.archive_items (
  id uuid primary key default gen_random_uuid(),
  owner_id text not null,
  workspace_key text not null default 'primary',
  payload jsonb not null,
  created_at timestamptz not null default timezone('utc', now()),
  updated_at timestamptz not null default timezone('utc', now())
);

create table if not exists public.monetization_leads (
  id uuid primary key default gen_random_uuid(),
  owner_id text not null,
  workspace_key text not null default 'primary',
  payload jsonb not null,
  created_at timestamptz not null default timezone('utc', now()),
  updated_at timestamptz not null default timezone('utc', now())
);

create table if not exists public.automation_rules (
  id uuid primary key default gen_random_uuid(),
  owner_id text not null,
  workspace_key text not null default 'primary',
  payload jsonb not null,
  created_at timestamptz not null default timezone('utc', now()),
  updated_at timestamptz not null default timezone('utc', now())
);

create table if not exists public.ai_history (
  id uuid primary key default gen_random_uuid(),
  owner_id text not null,
  workspace_key text not null default 'primary',
  payload jsonb not null,
  created_at timestamptz not null default timezone('utc', now()),
  updated_at timestamptz not null default timezone('utc', now())
);

create table if not exists public.app_config (
  id uuid primary key default gen_random_uuid(),
  owner_id text not null,
  workspace_key text not null default 'primary',
  payload jsonb not null,
  created_at timestamptz not null default timezone('utc', now()),
  updated_at timestamptz not null default timezone('utc', now())
);

-- Ensure required columns exist for pre-existing legacy tables.
alter table public.master_sections add column if not exists owner_id text;
alter table public.master_sections add column if not exists workspace_key text;
alter table public.master_sections add column if not exists payload jsonb;
alter table public.master_sections add column if not exists created_at timestamptz;
alter table public.master_sections add column if not exists updated_at timestamptz;

alter table public.episodes add column if not exists owner_id text;
alter table public.episodes add column if not exists workspace_key text;
alter table public.episodes add column if not exists payload jsonb;
alter table public.episodes add column if not exists created_at timestamptz;
alter table public.episodes add column if not exists updated_at timestamptz;

alter table public.visual_assets add column if not exists owner_id text;
alter table public.visual_assets add column if not exists workspace_key text;
alter table public.visual_assets add column if not exists payload jsonb;
alter table public.visual_assets add column if not exists created_at timestamptz;
alter table public.visual_assets add column if not exists updated_at timestamptz;

alter table public.content_pieces add column if not exists owner_id text;
alter table public.content_pieces add column if not exists workspace_key text;
alter table public.content_pieces add column if not exists payload jsonb;
alter table public.content_pieces add column if not exists created_at timestamptz;
alter table public.content_pieces add column if not exists updated_at timestamptz;

alter table public.metrics_monthly add column if not exists owner_id text;
alter table public.metrics_monthly add column if not exists workspace_key text;
alter table public.metrics_monthly add column if not exists payload jsonb;
alter table public.metrics_monthly add column if not exists created_at timestamptz;
alter table public.metrics_monthly add column if not exists updated_at timestamptz;

alter table public.metrics_episode add column if not exists owner_id text;
alter table public.metrics_episode add column if not exists workspace_key text;
alter table public.metrics_episode add column if not exists payload jsonb;
alter table public.metrics_episode add column if not exists created_at timestamptz;
alter table public.metrics_episode add column if not exists updated_at timestamptz;

alter table public.checklists add column if not exists owner_id text;
alter table public.checklists add column if not exists workspace_key text;
alter table public.checklists add column if not exists payload jsonb;
alter table public.checklists add column if not exists created_at timestamptz;
alter table public.checklists add column if not exists updated_at timestamptz;

alter table public.calendar_events add column if not exists owner_id text;
alter table public.calendar_events add column if not exists workspace_key text;
alter table public.calendar_events add column if not exists payload jsonb;
alter table public.calendar_events add column if not exists created_at timestamptz;
alter table public.calendar_events add column if not exists updated_at timestamptz;

alter table public.archive_items add column if not exists owner_id text;
alter table public.archive_items add column if not exists workspace_key text;
alter table public.archive_items add column if not exists payload jsonb;
alter table public.archive_items add column if not exists created_at timestamptz;
alter table public.archive_items add column if not exists updated_at timestamptz;

alter table public.monetization_leads add column if not exists owner_id text;
alter table public.monetization_leads add column if not exists workspace_key text;
alter table public.monetization_leads add column if not exists payload jsonb;
alter table public.monetization_leads add column if not exists created_at timestamptz;
alter table public.monetization_leads add column if not exists updated_at timestamptz;

alter table public.automation_rules add column if not exists owner_id text;
alter table public.automation_rules add column if not exists workspace_key text;
alter table public.automation_rules add column if not exists payload jsonb;
alter table public.automation_rules add column if not exists created_at timestamptz;
alter table public.automation_rules add column if not exists updated_at timestamptz;

alter table public.ai_history add column if not exists owner_id text;
alter table public.ai_history add column if not exists workspace_key text;
alter table public.ai_history add column if not exists payload jsonb;
alter table public.ai_history add column if not exists created_at timestamptz;
alter table public.ai_history add column if not exists updated_at timestamptz;

alter table public.app_config add column if not exists owner_id text;
alter table public.app_config add column if not exists workspace_key text;
alter table public.app_config add column if not exists payload jsonb;
alter table public.app_config add column if not exists created_at timestamptz;
alter table public.app_config add column if not exists updated_at timestamptz;

alter table public.master_sections alter column workspace_key set default 'primary';
alter table public.episodes alter column workspace_key set default 'primary';
alter table public.visual_assets alter column workspace_key set default 'primary';
alter table public.content_pieces alter column workspace_key set default 'primary';
alter table public.metrics_monthly alter column workspace_key set default 'primary';
alter table public.metrics_episode alter column workspace_key set default 'primary';
alter table public.checklists alter column workspace_key set default 'primary';
alter table public.calendar_events alter column workspace_key set default 'primary';
alter table public.archive_items alter column workspace_key set default 'primary';
alter table public.monetization_leads alter column workspace_key set default 'primary';
alter table public.automation_rules alter column workspace_key set default 'primary';
alter table public.ai_history alter column workspace_key set default 'primary';
alter table public.app_config alter column workspace_key set default 'primary';

alter table public.master_sections alter column payload set default '{}'::jsonb;
alter table public.episodes alter column payload set default '{}'::jsonb;
alter table public.visual_assets alter column payload set default '{}'::jsonb;
alter table public.content_pieces alter column payload set default '{}'::jsonb;
alter table public.metrics_monthly alter column payload set default '{}'::jsonb;
alter table public.metrics_episode alter column payload set default '{}'::jsonb;
alter table public.checklists alter column payload set default '{}'::jsonb;
alter table public.calendar_events alter column payload set default '{}'::jsonb;
alter table public.archive_items alter column payload set default '{}'::jsonb;
alter table public.monetization_leads alter column payload set default '{}'::jsonb;
alter table public.automation_rules alter column payload set default '{}'::jsonb;
alter table public.ai_history alter column payload set default '{}'::jsonb;
alter table public.app_config alter column payload set default '{}'::jsonb;

alter table public.master_sections alter column created_at set default timezone('utc', now());
alter table public.master_sections alter column updated_at set default timezone('utc', now());
alter table public.episodes alter column created_at set default timezone('utc', now());
alter table public.episodes alter column updated_at set default timezone('utc', now());
alter table public.visual_assets alter column created_at set default timezone('utc', now());
alter table public.visual_assets alter column updated_at set default timezone('utc', now());
alter table public.content_pieces alter column created_at set default timezone('utc', now());
alter table public.content_pieces alter column updated_at set default timezone('utc', now());
alter table public.metrics_monthly alter column created_at set default timezone('utc', now());
alter table public.metrics_monthly alter column updated_at set default timezone('utc', now());
alter table public.metrics_episode alter column created_at set default timezone('utc', now());
alter table public.metrics_episode alter column updated_at set default timezone('utc', now());
alter table public.checklists alter column created_at set default timezone('utc', now());
alter table public.checklists alter column updated_at set default timezone('utc', now());
alter table public.calendar_events alter column created_at set default timezone('utc', now());
alter table public.calendar_events alter column updated_at set default timezone('utc', now());
alter table public.archive_items alter column created_at set default timezone('utc', now());
alter table public.archive_items alter column updated_at set default timezone('utc', now());
alter table public.monetization_leads alter column created_at set default timezone('utc', now());
alter table public.monetization_leads alter column updated_at set default timezone('utc', now());
alter table public.automation_rules alter column created_at set default timezone('utc', now());
alter table public.automation_rules alter column updated_at set default timezone('utc', now());
alter table public.ai_history alter column created_at set default timezone('utc', now());
alter table public.ai_history alter column updated_at set default timezone('utc', now());
alter table public.app_config alter column created_at set default timezone('utc', now());
alter table public.app_config alter column updated_at set default timezone('utc', now());

create index if not exists master_sections_owner_workspace_idx on public.master_sections(owner_id, workspace_key);
create index if not exists episodes_owner_workspace_idx on public.episodes(owner_id, workspace_key);
create index if not exists visual_assets_owner_workspace_idx on public.visual_assets(owner_id, workspace_key);
create index if not exists content_pieces_owner_workspace_idx on public.content_pieces(owner_id, workspace_key);
create index if not exists metrics_monthly_owner_workspace_idx on public.metrics_monthly(owner_id, workspace_key);
create index if not exists metrics_episode_owner_workspace_idx on public.metrics_episode(owner_id, workspace_key);
create index if not exists checklists_owner_workspace_idx on public.checklists(owner_id, workspace_key);
create index if not exists calendar_events_owner_workspace_idx on public.calendar_events(owner_id, workspace_key);
create index if not exists archive_items_owner_workspace_idx on public.archive_items(owner_id, workspace_key);
create index if not exists monetization_leads_owner_workspace_idx on public.monetization_leads(owner_id, workspace_key);
create index if not exists automation_rules_owner_workspace_idx on public.automation_rules(owner_id, workspace_key);
create index if not exists ai_history_owner_workspace_idx on public.ai_history(owner_id, workspace_key);
create index if not exists app_config_owner_workspace_idx on public.app_config(owner_id, workspace_key);

drop trigger if exists master_sections_set_updated_at on public.master_sections;
create trigger master_sections_set_updated_at before update on public.master_sections for each row execute function public.set_row_updated_at();
drop trigger if exists episodes_set_updated_at on public.episodes;
create trigger episodes_set_updated_at before update on public.episodes for each row execute function public.set_row_updated_at();
drop trigger if exists visual_assets_set_updated_at on public.visual_assets;
create trigger visual_assets_set_updated_at before update on public.visual_assets for each row execute function public.set_row_updated_at();
drop trigger if exists content_pieces_set_updated_at on public.content_pieces;
create trigger content_pieces_set_updated_at before update on public.content_pieces for each row execute function public.set_row_updated_at();
drop trigger if exists metrics_monthly_set_updated_at on public.metrics_monthly;
create trigger metrics_monthly_set_updated_at before update on public.metrics_monthly for each row execute function public.set_row_updated_at();
drop trigger if exists metrics_episode_set_updated_at on public.metrics_episode;
create trigger metrics_episode_set_updated_at before update on public.metrics_episode for each row execute function public.set_row_updated_at();
drop trigger if exists checklists_set_updated_at on public.checklists;
create trigger checklists_set_updated_at before update on public.checklists for each row execute function public.set_row_updated_at();
drop trigger if exists calendar_events_set_updated_at on public.calendar_events;
create trigger calendar_events_set_updated_at before update on public.calendar_events for each row execute function public.set_row_updated_at();
drop trigger if exists archive_items_set_updated_at on public.archive_items;
create trigger archive_items_set_updated_at before update on public.archive_items for each row execute function public.set_row_updated_at();
drop trigger if exists monetization_leads_set_updated_at on public.monetization_leads;
create trigger monetization_leads_set_updated_at before update on public.monetization_leads for each row execute function public.set_row_updated_at();
drop trigger if exists automation_rules_set_updated_at on public.automation_rules;
create trigger automation_rules_set_updated_at before update on public.automation_rules for each row execute function public.set_row_updated_at();
drop trigger if exists ai_history_set_updated_at on public.ai_history;
create trigger ai_history_set_updated_at before update on public.ai_history for each row execute function public.set_row_updated_at();
drop trigger if exists app_config_set_updated_at on public.app_config;
create trigger app_config_set_updated_at before update on public.app_config for each row execute function public.set_row_updated_at();

alter table public.master_sections enable row level security;
alter table public.episodes enable row level security;
alter table public.visual_assets enable row level security;
alter table public.content_pieces enable row level security;
alter table public.metrics_monthly enable row level security;
alter table public.metrics_episode enable row level security;
alter table public.checklists enable row level security;
alter table public.calendar_events enable row level security;
alter table public.archive_items enable row level security;
alter table public.monetization_leads enable row level security;
alter table public.automation_rules enable row level security;
alter table public.ai_history enable row level security;
alter table public.app_config enable row level security;

drop policy if exists "master_sections_own_all" on public.master_sections;
create policy "master_sections_own_all" on public.master_sections for all to authenticated using (owner_id = auth.uid()::text) with check (owner_id = auth.uid()::text);
drop policy if exists "episodes_own_all" on public.episodes;
create policy "episodes_own_all" on public.episodes for all to authenticated using (owner_id = auth.uid()::text) with check (owner_id = auth.uid()::text);
drop policy if exists "visual_assets_own_all" on public.visual_assets;
create policy "visual_assets_own_all" on public.visual_assets for all to authenticated using (owner_id = auth.uid()::text) with check (owner_id = auth.uid()::text);
drop policy if exists "content_pieces_own_all" on public.content_pieces;
create policy "content_pieces_own_all" on public.content_pieces for all to authenticated using (owner_id = auth.uid()::text) with check (owner_id = auth.uid()::text);
drop policy if exists "metrics_monthly_own_all" on public.metrics_monthly;
create policy "metrics_monthly_own_all" on public.metrics_monthly for all to authenticated using (owner_id = auth.uid()::text) with check (owner_id = auth.uid()::text);
drop policy if exists "metrics_episode_own_all" on public.metrics_episode;
create policy "metrics_episode_own_all" on public.metrics_episode for all to authenticated using (owner_id = auth.uid()::text) with check (owner_id = auth.uid()::text);
drop policy if exists "checklists_own_all" on public.checklists;
create policy "checklists_own_all" on public.checklists for all to authenticated using (owner_id = auth.uid()::text) with check (owner_id = auth.uid()::text);
drop policy if exists "calendar_events_own_all" on public.calendar_events;
create policy "calendar_events_own_all" on public.calendar_events for all to authenticated using (owner_id = auth.uid()::text) with check (owner_id = auth.uid()::text);
drop policy if exists "archive_items_own_all" on public.archive_items;
create policy "archive_items_own_all" on public.archive_items for all to authenticated using (owner_id = auth.uid()::text) with check (owner_id = auth.uid()::text);
drop policy if exists "monetization_leads_own_all" on public.monetization_leads;
create policy "monetization_leads_own_all" on public.monetization_leads for all to authenticated using (owner_id = auth.uid()::text) with check (owner_id = auth.uid()::text);
drop policy if exists "automation_rules_own_all" on public.automation_rules;
create policy "automation_rules_own_all" on public.automation_rules for all to authenticated using (owner_id = auth.uid()::text) with check (owner_id = auth.uid()::text);
drop policy if exists "ai_history_own_all" on public.ai_history;
create policy "ai_history_own_all" on public.ai_history for all to authenticated using (owner_id = auth.uid()::text) with check (owner_id = auth.uid()::text);
drop policy if exists "app_config_own_all" on public.app_config;
create policy "app_config_own_all" on public.app_config for all to authenticated using (owner_id = auth.uid()::text) with check (owner_id = auth.uid()::text);