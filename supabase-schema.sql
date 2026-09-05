-- RPJ Gestão de O.S. — banco online Supabase
create table if not exists public.rpj_state (
  id text primary key,
  data jsonb not null default '{"users":[],"clients":[],"devices":[],"orders":[],"seq":1000}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.rpj_state enable row level security;

drop policy if exists "Authenticated users can read RPJ state" on public.rpj_state;
drop policy if exists "Authenticated users can insert RPJ state" on public.rpj_state;
drop policy if exists "Authenticated users can update RPJ state" on public.rpj_state;

create policy "Authenticated users can read RPJ state"
on public.rpj_state for select to authenticated using (true);

create policy "Authenticated users can insert RPJ state"
on public.rpj_state for insert to authenticated with check (true);

create policy "Authenticated users can update RPJ state"
on public.rpj_state for update to authenticated using (true) with check (true);

insert into public.rpj_state (id)
values ('main')
on conflict (id) do nothing;
