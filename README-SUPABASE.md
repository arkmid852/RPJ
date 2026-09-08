# RPJ Gestão de O.S. — V7 (Supabase + Vercel)

Esta versão mantém o RPJ Gestão de O.S. com Supabase/Auth e adiciona proteção contra perda de dados por cache local antigo.

## Correções da V7
- O login não envia mais o estado local para o Supabase antes de carregar o estado online.
- Ao entrar, o Supabase é a fonte oficial dos dados.
- Salvamentos confirmam a gravação online antes de informar que a operação foi concluída.
- O salvamento busca o estado mais recente do banco e mescla alterações de dispositivos diferentes, reduzindo o risco de um computador/celular sobrescrever O.S., clientes ou aparelhos criados em outro dispositivo.
- A O.S. só exibe confirmação de salvamento depois da confirmação do banco.
- A logo do cliente permanece em `assets/logo-rpj.jpeg`.

## Supabase
URL: configurada no `index.html`.

A chave usada no frontend deve ser apenas a chave pública/publishable. Nunca coloque uma `service_role`/secret key no HTML.

## Banco
A tabela usada pela aplicação é `public.rpj_state`, com a linha `id = 'main'`.
As permissões/RLS precisam permitir SELECT, INSERT e UPDATE para usuários autenticados.

## Vercel
Suba os arquivos do projeto no repositório GitHub conectado à Vercel. Depois do commit, a Vercel cria um novo deployment automaticamente.
