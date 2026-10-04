-- Tab Prendas (copiada da Kitty Quest; mesma estrutura de kq_gifts, dados separados).
create table public.pt_gifts (
  id uuid primary key default gen_random_uuid(),
  item text not null check (length(trim(item)) > 0),
  recipient text,
  category text not null default 'aniversario' check (category = any (array['aniversario','natal'])),
  buyer text,
  giver text,
  value numeric not null default 0 check (value >= 0),
  settled boolean not null default false,
  created_at timestamptz not null default now()
);
alter table public.pt_gifts enable row level security;
create policy pt_gifts_authenticated_all on public.pt_gifts for all to authenticated using (true) with check (true);
