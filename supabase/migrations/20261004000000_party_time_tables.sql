-- Tabelas da Party Time (mesmo projeto Supabase da Kitty Quest).
-- Acesso: qualquer utilizador autenticado lê e escreve; anónimos não veem nada.
create table public.pt_guests (
  id uuid primary key default gen_random_uuid(),
  name text not null check (length(trim(name)) > 0),
  plus integer not null default 0 check (plus >= 0),
  sent boolean not null default false,
  confirmed boolean not null default false,
  created_at timestamptz not null default now()
);
create table public.pt_food (
  id uuid primary key default gen_random_uuid(),
  name text not null check (length(trim(name)) > 0),
  qty text,
  who text,
  created_at timestamptz not null default now()
);
create table public.pt_todos (
  id uuid primary key default gen_random_uuid(),
  text text not null check (length(trim(text)) > 0),
  done boolean not null default false,
  created_at timestamptz not null default now()
);
alter table public.pt_guests enable row level security;
alter table public.pt_food   enable row level security;
alter table public.pt_todos  enable row level security;
create policy pt_guests_authenticated_all on public.pt_guests for all to authenticated using (true) with check (true);
create policy pt_food_authenticated_all   on public.pt_food   for all to authenticated using (true) with check (true);
create policy pt_todos_authenticated_all  on public.pt_todos  for all to authenticated using (true) with check (true);
