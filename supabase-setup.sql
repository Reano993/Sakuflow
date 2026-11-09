-- Jalankan seluruh SQL ini di Supabase Dashboard > SQL Editor.
-- RLS memastikan setiap akun hanya dapat membaca/menulis baris miliknya.

create table if not exists public.sakuflow_data (
  user_id uuid primary key references auth.users(id) on delete cascade,
  transactions jsonb not null default '[]'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.sakuflow_data enable row level security;

drop policy if exists "Users can read own SakuFlow data" on public.sakuflow_data;
create policy "Users can read own SakuFlow data"
  on public.sakuflow_data for select to authenticated
  using (auth.uid() = user_id);

drop policy if exists "Users can insert own SakuFlow data" on public.sakuflow_data;
create policy "Users can insert own SakuFlow data"
  on public.sakuflow_data for insert to authenticated
  with check (auth.uid() = user_id);

drop policy if exists "Users can update own SakuFlow data" on public.sakuflow_data;
create policy "Users can update own SakuFlow data"
  on public.sakuflow_data for update to authenticated
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

-- Backup snapshot setiap kali transaksi ditambah/dihapus.
create table if not exists public.sakuflow_backups (
  id bigint generated always as identity primary key,
  user_id uuid not null references auth.users(id) on delete cascade,
  transactions jsonb not null,
  created_at timestamptz not null default now()
);

alter table public.sakuflow_backups enable row level security;

drop policy if exists "Users can read own SakuFlow backups" on public.sakuflow_backups;
create policy "Users can read own SakuFlow backups"
  on public.sakuflow_backups for select to authenticated
  using (auth.uid() = user_id);

drop policy if exists "Users can create own SakuFlow backups" on public.sakuflow_backups;
create policy "Users can create own SakuFlow backups"
  on public.sakuflow_backups for insert to authenticated
  with check (auth.uid() = user_id);
