---
theme: default
title: React + Postgres - The AI-Ready Stack You Already Know
info: |
  ## React + Postgres - The AI-Ready Stack You Already Know
  Field report on shipping AI-heavy web apps with fewer services, less glue,
  and a lot less YAML.

  Speaker: Dani Akash, Founding Engineer at BrowserOS (YC S24).
fonts:
  sans: Inter
  serif: Playfair Display
  mono: IBM Plex Mono
  italic: Playfair Display
  weights: '300,400,500,600,700,800,900'
  webfonts: ['Source Serif 4']
css: unocss
colorSchema: dark
canvasWidth: 1920
aspectRatio: '16/9'
drawings:
  persist: false
mdc: true
transition: slide-left
layout: default
class: 'hero dark'
htmlAttrs:
  lang: en
---

<style>
@import './styles/index.css';
</style>

<div class="slide-shell">
  <WebGLBackground variant="dark" />
  <div class="chrome"><div>Expert Talks &middot; Dani Akash</div><ChromeCounter /></div>
  <div class="frame" style="display:grid;grid-template-columns:1.05fr .95fr;gap:5vw;align-items:center;height:100%">
    <div>
      <div class="kicker">REACT + POSTGRES</div>
      <h1 class="h-hero h-hero-en" style="font-size:5.4vw">The AI-ready stack<br/><span class="accent">you already know.</span></h1>
      <p class="lead" style="max-width:52vw;margin-top:3vh">How building an AI-ready app is much simpler than you'd expect.</p>
      <div class="meta-row" style="margin-top:3vh"><span>PostgreSQL</span><span>React Server Components</span><span>AI Agents</span></div>
    </div>
    <div class="terminal" aria-label="terminal install command">
      <span class="line"><span class="prompt">$</span> docker run -d --name pg \</span>
      <span class="line">    -p 5432:5432 \</span>
      <span class="line">    -e POSTGRES_PASSWORD=secret \</span>
      <span class="line">    postgres:16</span>
      <span class="line"><span class="prompt">$</span> bun run dev</span>
      <span class="line dim" style="margin-top:2vh">auth / search / vectors / jobs / realtime</span>
      <span class="line"><span class="prompt">postgres</span> is already in the room.</span>
    </div>
  </div>
  <div class="foot"><div class="title">React + Postgres &middot; AI-ready stack</div><div>OPENING</div></div>
</div>

<!-- ============================================================ -->

---
class: 'dark'
---

<div class="slide-shell">
  <div class="chrome"><div>Speaker &middot; About</div><ChromeCounter /></div>
  <div class="frame grid-2-6-6" style="padding-top:5vh">
    <div>
      <div class="kicker">INTRODUCTIONS</div>
      <h2 class="h-xl" style="font-size:5.4vw">Hi, I'm Dani.</h2>
      <div style="font-family:var(--serif-en);font-weight:500;font-size:2vw;line-height:1.25;opacity:0.78;margin-top:1.2vh">Founding Engineer at BrowserOS (YC S24)</div>
      <p class="lead" style="margin-top:3.4vh;max-width:34vw">I build browsers, terminals, and AI assistants. The seams where humans and agents meet.</p>
    </div>
    <div>
      <div class="kicker" style="margin-bottom:2vh">CURRENT OPEN SOURCE WORK</div>
      <div style="display:flex;flex-direction:column;gap:2.2vh">
        <div v-click style="display:grid;grid-template-columns:auto 1fr;gap:1vw;align-items:baseline">
          <div style="font-size:1.6vw;line-height:1">&#127760;</div>
          <div>
            <div style="font-family:var(--serif-en);font-weight:600;font-size:1.55vw;line-height:1.2">BrowserOS</div>
            <div style="font-family:var(--sans-body);font-size:max(13px,0.98vw);opacity:0.72;line-height:1.45;margin-top:0.3vh">Open-source agentic browser. Let AI see, click, and ship the boring tabs for you.</div>
          </div>
        </div>
        <div v-click style="display:grid;grid-template-columns:auto 1fr;gap:1vw;align-items:baseline">
          <div style="font-size:1.6vw;line-height:1">&#128223;</div>
          <div>
            <div style="font-family:var(--serif-en);font-weight:600;font-size:1.55vw;line-height:1.2">Agent Terminal</div>
            <div style="font-family:var(--sans-body);font-size:max(13px,0.98vw);opacity:0.72;line-height:1.45;margin-top:0.3vh">A terminal where coding agents are first-class citizens, not bolted-on guests.</div>
          </div>
        </div>
        <div v-click style="display:grid;grid-template-columns:auto 1fr;gap:1vw;align-items:baseline">
          <div style="font-size:1.6vw;line-height:1">&#129302;</div>
          <div>
            <div style="font-family:var(--serif-en);font-weight:600;font-size:1.55vw;line-height:1.2">Herbie</div>
            <div style="font-family:var(--sans-body);font-size:max(13px,0.98vw);opacity:0.72;line-height:1.45;margin-top:0.3vh">Your personal Agent Command Center. One UI for all AI Agents.</div>
          </div>
        </div>
        <div v-click style="display:grid;grid-template-columns:auto 1fr;gap:1vw;align-items:baseline">
          <div style="font-size:1.6vw;line-height:1">&#129525;</div>
          <div>
            <div style="font-family:var(--serif-en);font-weight:600;font-size:1.55vw;line-height:1.2">acpx-tools</div>
            <div style="font-family:var(--sans-body);font-size:max(13px,0.98vw);opacity:0.72;line-height:1.45;margin-top:0.3vh">Headless ACP toolkit. Talk to coding agents over the protocol, no UI required.</div>
          </div>
        </div>
        <div v-click style="display:grid;grid-template-columns:auto 1fr;gap:1vw;align-items:baseline">
          <div style="font-size:1.6vw;line-height:1">&#127912;</div>
          <div>
            <div style="font-family:var(--serif-en);font-weight:600;font-size:1.55vw;line-height:1.2">stylecn</div>
            <div style="font-family:var(--sans-body);font-size:max(13px,0.98vw);opacity:0.72;line-height:1.45;margin-top:0.3vh">Brand-themed presets for shadcn/ui. Apple, Stripe, Linear, Airbnb. Copy the CSS, ship the look.</div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="foot"><div class="title">Building at the seams</div><div>ABOUT</div></div>
</div>

---
class: 'light'
---

<div class="slide-shell">
  <div class="chrome"><div>AI-Ready &middot; Foundation</div><ChromeCounter /></div>
  <div class="frame" style="padding-top:5vh">
    <div class="kicker">THE PARTS LIST</div>
    <h2 class="h-xl" style="font-size:5vw">How to make an app AI-ready?</h2>
    <div class="grid-4" style="margin-top:5vh">
      <div class="cap-card" v-click>
        <div class="cap-header"><div class="cap-emoji">&#128272;</div><div class="cap-name">Authentication</div></div>
        <div class="cap-row cap-why"><span class="cap-label">Why</span>Agents act on behalf of a real user; the data layer needs to know which user and what they may touch.</div>
        <div class="cap-row cap-unlocks"><span class="cap-label">Unlocks</span>A personal AI assistant that reads YOUR inbox, not someone else's.</div>
      </div>
      <div class="cap-card" v-click>
        <div class="cap-header"><div class="cap-emoji">&#128268;</div><div class="cap-name">REST / GraphQL APIs</div></div>
        <div class="cap-row cap-why"><span class="cap-label">Why</span>Both the UI and the agent need typed, discoverable endpoints to call.</div>
        <div class="cap-row cap-unlocks"><span class="cap-label">Unlocks</span>An agent tool surface the LLM can introspect and invoke without hand-written glue.</div>
      </div>
      <div class="cap-card" v-click>
        <div class="cap-header"><div class="cap-emoji">&#128450;&#65039;</div><div class="cap-name">Structured data</div></div>
        <div class="cap-row cap-why"><span class="cap-label">Why</span>Filtering, joining, and aggregating real business rows is what most useful AI actually does.</div>
        <div class="cap-row cap-unlocks"><span class="cap-label">Unlocks</span>"Chat with your invoices": the agent runs filtered queries over real customer records.</div>
      </div>
      <div class="cap-card" v-click>
        <div class="cap-header"><div class="cap-emoji">&#128196;</div><div class="cap-name">Unstructured data</div></div>
        <div class="cap-row cap-why"><span class="cap-label">Why</span>Agent state, tool calls, citations, and intermediate reasoning don't fit neat columns.</div>
        <div class="cap-row cap-unlocks"><span class="cap-label">Unlocks</span>Save and replay a full agent run, including every tool call and message.</div>
      </div>
    </div>
  </div>
  <div class="foot"><div class="title">Eight capabilities every AI-ready app needs</div><div>FOUNDATION</div></div>
</div>

---
class: 'light'
---

<div class="slide-shell">
  <div class="chrome"><div>AI-Ready &middot; Runtime</div><ChromeCounter /></div>
  <div class="frame" style="padding-top:5vh">
    <div class="kicker">&hellip;continued</div>
    <div class="grid-4" style="margin-top:3vh">
      <div class="cap-card" v-click>
        <div class="cap-header"><div class="cap-emoji">&#9203;</div><div class="cap-name">Queues</div></div>
        <div class="cap-row cap-why"><span class="cap-label">Why</span>Embedding, summarisation, and ingestion take seconds to minutes; the UI cannot wait.</div>
        <div class="cap-row cap-unlocks"><span class="cap-label">Unlocks</span>Background indexing of new docs into RAG without blocking chat.</div>
      </div>
      <div class="cap-card" v-click>
        <div class="cap-header"><div class="cap-emoji">&#128269;</div><div class="cap-name">Search</div></div>
        <div class="cap-row cap-why"><span class="cap-label">Why</span>Vector finds "things like this"; full-text finds exact names and IDs; both must respect tenant + permissions.</div>
        <div class="cap-row cap-unlocks"><span class="cap-label">Unlocks</span>Hybrid retrieval across support tickets. Meaning AND product-name matches, filtered by org.</div>
      </div>
      <div class="cap-card" v-click>
        <div class="cap-header"><div class="cap-emoji">&#129521;</div><div class="cap-name">Type-safety</div></div>
        <div class="cap-row cap-why"><span class="cap-label">Why</span>One schema change should not silently break four downstream services; agents need stable contracts too.</div>
        <div class="cap-row cap-unlocks"><span class="cap-label">Unlocks</span>MCP tool schemas derived from the DB schema. Never out of sync with the data.</div>
      </div>
      <div class="cap-card" v-click>
        <div class="cap-header"><div class="cap-emoji">&#128225;</div><div class="cap-name">Realtime updates</div></div>
        <div class="cap-row cap-why"><span class="cap-label">Why</span>Agents stream tokens; jobs change state; UIs need to react without polling.</div>
        <div class="cap-row cap-unlocks"><span class="cap-label">Unlocks</span>Live "thinking &rarr; calling tool &rarr; drafting" status as the agent works.</div>
      </div>
    </div>
  </div>
  <div class="foot"><div class="title">&hellip;same eight, continued</div><div>RUNTIME</div></div>
</div>

---
class: 'dark'
---

<div class="slide-shell">
  <div class="chrome"><div>Architecture &middot; Baseline</div><ChromeCounter /></div>
  <div class="frame grid-2-6-6" style="padding-top:6vh">
    <div class="col">
      <div class="kicker">OPTION 01</div>
      <h2 class="h-xl" style="font-size:3.6vw">One deployment. Eight workloads. One restart.</h2>
      <p class="lead" style="margin-top:2.4vh">A monolith treats every workload like a short HTTP request. AI brings shapes that do not fit.</p>
      <div class="callout" style="margin-top:4vh">
        <div class="q-big">When embeddings, streams, and background jobs share threads with your web layer, the failure modes couple.</div>
        <span class="callout-src">shared process &middot; shared restart</span>
      </div>
    </div>
    <div class="diagram" style="position:relative">
      <div v-click.hide="1">
        <div class="node">
          <div class="label">One node process &middot; one restart</div>
          <div class="name" style="margin-bottom:1.4vh">The app</div>
          <div class="workload-stack">
            <div class="workload"><span class="workload-name">HTTP requests</span><span class="workload-tag">short</span></div>
            <div class="workload"><span class="workload-name">SQL queries</span><span class="workload-tag">short</span></div>
            <div class="workload"><span class="workload-name">Auth checks</span><span class="workload-tag">short</span></div>
            <div class="workload"><span class="workload-name">REST handlers</span><span class="workload-tag">short</span></div>
            <div class="workload stress"><span class="workload-name">Embedding jobs</span><span class="workload-tag">slow</span></div>
            <div class="workload stress"><span class="workload-name">WebSocket streams</span><span class="workload-tag">open</span></div>
            <div class="workload stress"><span class="workload-name">Background workers</span><span class="workload-tag">queued</span></div>
            <div class="workload stress"><span class="workload-name">Vector retrieval</span><span class="workload-tag">heavy</span></div>
          </div>
        </div>
      </div>
      <div v-click="1" style="position:absolute;inset:0">
        <div class="terminal" aria-label="monolith stress trace">
          <span class="line"><span class="prompt">$</span> pm2 status</span>
          <span class="line dim">+-----+-------+--------+--------+</span>
          <span class="line dim">| id  | name  | uptime | memory |</span>
          <span class="line dim">+-----+-------+--------+--------+</span>
          <span class="line">| 0   | app   | 4h     | 1.8g   |</span>
          <span class="line dim">+-----+-------+--------+--------+</span>
          <span class="line" style="margin-top:1.4vh"><span class="prompt">$</span> tail -f app.log</span>
          <span class="line dim">12:04:01 &nbsp;api &nbsp;POST /search &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;200 &nbsp;12ms</span>
          <span class="line dim">12:04:02 &nbsp;api &nbsp;POST /search &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;200 &nbsp;14ms</span>
          <span class="line warn">12:04:03 &nbsp;job &nbsp;embed_documents &nbsp;running (4.2s)</span>
          <span class="line warn">12:04:04 &nbsp;api &nbsp;POST /chat &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;queued &middot; 8 ahead</span>
          <span class="line bad">12:04:05 &nbsp;ws &nbsp;&nbsp;stream/12 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;disconnect (no thread)</span>
          <span class="line bad">12:04:06 &nbsp;job &nbsp;ingest_batch &nbsp;&nbsp;&nbsp;&nbsp;OOM &middot; process restarting</span>
          <span class="line bad">12:04:06 &nbsp;api &nbsp;POST /search &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;503 &middot; process restarting</span>
        </div>
      </div>
    </div>
  </div>
  <div class="foot"><div class="title">Where the failure modes couple</div><div>OPTION 01</div></div>
</div>

---
class: 'light'
---

<div class="slide-shell">
  <div class="chrome"><div>Architecture &middot; Sprawl</div><ChromeCounter /></div>
  <div class="frame" style="padding-top:3vh">
    <div class="kicker">OPTION 02</div>
    <h2 class="h-xl" style="font-size:4vw">Microservices solve the pressure by distributing the pain.</h2>
    <p class="lead" style="max-width:72vw;margin-top:1.4vh">Specialized tools can be the right answer at scale. But for a small team, every extra service adds a contract, a failure mode, a bill, and a page in the runbook.</p>
    <div class="compare" style="margin-top:2vh">
      <div class="colbox"><h3>Auth service</h3><p>Application roles become claims, sync jobs, middleware checks, and policy drift.</p></div>
      <div class="colbox"><h3>Vector database</h3><p>Embeddings leave the relational context that usually decides whether a row is even visible.</p></div>
      <div class="colbox"><h3>Queue + realtime</h3><p>Every job state now has to travel through another system before the UI can trust it.</p></div>
    </div>
    <div class="terminal" style="margin-top:2vh;padding:1.4vh 1.6vw">
      <span class="line dim">infra/</span>
      <span class="line">  docker-compose.yml</span>
      <span class="line">  vector-db.yml</span>
      <span class="line">  worker.yml</span>
      <span class="line">  websocket-gateway.yml</span>
      <span class="line">  search-indexer.yml</span>
      <span class="line warn">  watch: permission drift across every boundary</span>
    </div>
  </div>
  <div class="foot"><div class="title">Specialization is powerful &middot; coordination is expensive</div><div>OPTION 02</div></div>
</div>

---
class: 'hero light'
---

<div class="slide-shell">
  <WebGLBackground variant="light" />
  <div class="chrome"><div>Turn &middot; Platform</div><ChromeCounter /></div>
  <div class="frame" style="display:grid;gap:4vh;align-content:center;height:100%">
    <h1 class="h-hero" style="font-size:6.8vw">Postgres stopped being just a database.</h1>
    <p class="lead" style="max-width:58vw">It became a programmable platform: transactional, permissioned, extensible, searchable, observable enough, and already sitting on your critical path.</p>
    <div class="chipline"><span class="chip">RLS</span><span class="chip">pgvector</span><span class="chip">LISTEN / NOTIFY</span><span class="chip">full-text search</span><span class="chip">jobs</span><span class="chip">generated APIs</span></div>
  </div>
  <div class="foot"><div class="title">The stack you already operate</div><div>PLATFORM SHIFT</div></div>
</div>

---
class: 'dark'
---

<div class="slide-shell">
  <div class="chrome"><div>Platform &middot; Why</div><ChromeCounter /></div>
  <div class="frame" style="padding-top:3.5vh">
    <h2 class="h-xl" style="font-size:3.4vw">Three decisions turned the database into a platform.</h2>
    <p class="lead" style="max-width:78vw;margin-top:1.4vh">Object-relational core, one transaction system, one log. Every AI-ready capability either ships in the box or plugs into the same three primitives.</p>
    <div class="grid-3" style="margin-top:4vh">
      <div class="pillar" v-click>
        <div class="ic">01</div>
        <div class="t">Catalog-driven</div>
        <div class="d">Types, operators, indexes, and functions are themselves data. Adding capability is declaring it.</div>
        <div class="d-example"><span class="d-example-label">e.g.</span>pgvector adds two new index types (HNSW, IVF), as first-class as B-tree.</div>
      </div>
      <div class="pillar" v-click>
        <div class="ic">02</div>
        <div class="t">One transaction system</div>
        <div class="d">Writes, schema changes, NOTIFY, and job enqueue all share the same atomic boundary.</div>
        <div class="d-example"><span class="d-example-label">e.g.</span>"Insert the row, audit it, enqueue the embedding, notify the UI" is one statement.</div>
      </div>
      <div class="pillar" v-click>
        <div class="ic">03</div>
        <div class="t">WAL as a universal log</div>
        <div class="d">One log powers crash recovery, PITR, streaming replication, logical CDC, and read replicas.</div>
        <div class="d-example"><span class="d-example-label">e.g.</span>Every downstream pattern (audit, replicas, CDC, ETL) reuses the same primitive.</div>
      </div>
    </div>
    <div class="chipline" v-click style="margin-top:3.4vh;justify-content:center">
      <span class="chip">pgvector</span>
      <span class="chip">PostgREST</span>
      <span class="chip">pg_graphql</span>
      <span class="chip">graphile_worker</span>
      <span class="chip">pg_cron</span>
      <span class="chip">Supabase Realtime</span>
    </div>
  </div>
  <div class="foot"><div class="title">Earned, not declared.</div><div>WHY POSTGRES</div></div>
</div>

---
class: 'dark'
---

<div class="slide-shell">
  <div class="chrome"><div>Capability &middot; Auth</div><ChromeCounter /></div>
  <div class="frame" style="padding-top:4vh;display:grid;grid-template-columns:5fr 7fr;gap:3vw;align-items:start">
    <div>
      <div class="kicker">AUTHENTICATION</div>
      <h2 class="h-xl" style="font-size:3.2vw">Move authorization to the place that cannot forget it.</h2>
      <p class="lead" style="font-size:1.4vw;margin-top:1.6vh">The database knows the tenant. Every query, every generated API, every MCP tool reads from the same policy.</p>
      <div class="callout" style="margin-top:3vh"><div class="q-big" style="font-size:1.3vw">The policy travels with every query, including the accidental ones.</div><span class="callout-src">RLS as data-plane guardrail</span></div>
    </div>
    <div class="terminal walkable" style="padding:2vh 1.4vw">
      <v-clicks>
        <div class="walk-chunk">
          <span class="line dim">-- 1. The table we are protecting. One column does the work.</span>
          <span class="line">create table files (</span>
          <span class="line">&nbsp;&nbsp;id       uuid primary key,</span>
          <span class="line accent">&nbsp;&nbsp;team_id&nbsp;&nbsp;uuid not null,&nbsp;&nbsp;-- the tenancy key</span>
          <span class="line">&nbsp;&nbsp;path&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;text not null,</span>
          <span class="line">&nbsp;&nbsp;content&nbsp;&nbsp;text not null</span>
          <span class="line">);</span>
        </div>
        <div class="walk-chunk">
          <span class="line dim">-- 2. Turn RLS on. By default, nothing is allowed.</span>
          <span class="line">alter table files enable row level security;</span>
        </div>
        <div class="walk-chunk">
          <span class="line dim">-- 3. One declarative policy. That is the auth layer.</span>
          <span class="line">create policy files_team on files</span>
          <span class="line">&nbsp;&nbsp;using (team_id = current_setting('app.team_id')::uuid);</span>
        </div>
        <div class="walk-chunk">
          <span class="line dim">-- 4. The app sets the session variable per request.</span>
          <span class="line dim">--&nbsp;&nbsp;withTenant(teamId, userId, async (tx) =&gt; { ... })</span>
        </div>
      </v-clicks>
    </div>
  </div>
  <div class="foot"><div class="title">Auth is not middleware when the data layer can enforce it</div><div>RLS</div></div>
</div>

---
class: 'dark'
---

<div class="slide-shell">
  <div class="chrome"><div>Auth &middot; In Practice</div><ChromeCounter /></div>
  <div class="frame" style="padding-top:4vh;display:grid;grid-template-columns:5fr 7fr;gap:3vw;align-items:start">
    <div>
      <div class="kicker">WHAT THE POLICY DOES</div>
      <h2 class="h-xl" style="font-size:3.2vw">Read, write, join, mistake. The policy stays put.</h2>
      <p class="lead" style="font-size:1.4vw;margin-top:1.6vh">Plain SQL. No middleware to forget, no helper to call. Postgres scopes reads, blocks rogue writes, and follows every join.</p>
      <div class="callout" style="margin-top:3vh"><div class="q-big" style="font-size:1.3vw">Even the bug you would have shipped against another tenant just &hellip; does not.</div><span class="callout-src">forgotten WHERE, contained</span></div>
    </div>
    <div class="terminal walkable" style="padding:2vh 1.4vw">
      <v-clicks>
        <div class="walk-chunk">
          <span class="line dim">-- 1. A read with no WHERE clause.</span>
          <span class="line">select count(*) from files;</span>
          <span class="line dim">-- &#8680;&nbsp;&nbsp;3&nbsp;&nbsp;(your team only; 3 hidden)</span>
        </div>
        <div class="walk-chunk">
          <span class="line dim">-- 2. Try to plant a row in another tenant.</span>
          <span class="line">insert into files (team_id, path, content)</span>
          <span class="line">values ('&lt;other-team&gt;', 'evil.ts', 'leak');</span>
          <span class="line bad">-- &#10006; ERROR: new row violates row-level security policy</span>
        </div>
        <div class="walk-chunk">
          <span class="line dim">-- 3. Joins respect RLS on every joined table.</span>
          <span class="line">select c.title, count(m.*) as msgs</span>
          <span class="line">from chats c join messages m on m.chat_id = c.id</span>
          <span class="line">group by c.title;</span>
          <span class="line dim">-- &#8680;&nbsp;&nbsp;Only chats and messages your team can see.</span>
        </div>
        <div class="walk-chunk">
          <span class="line dim">-- 4. A developer forgets a WHERE clause.</span>
          <span class="line">update files set archived_at = now();</span>
          <span class="line dim">-- &#8680;&nbsp;&nbsp;Only YOUR team's files. The policy is the floor.</span>
        </div>
      </v-clicks>
    </div>
  </div>
  <div class="foot"><div class="title">Plain SQL. The policy travels with it.</div><div>RLS &middot; IN PRACTICE</div></div>
</div>

---
class: 'light'
---

<div class="slide-shell">
  <div class="chrome"><div>Detour &middot; Supabase</div><ChromeCounter /></div>
  <div class="frame" style="padding-top:5vh">
    <div class="kicker">QUICK SHOW OF HANDS</div>
    <h2 class="h-xl" style="font-size:5.6vw;max-width:80vw">Has anyone here tried <span class="accent">Supabase</span>?</h2>
    <p class="lead" style="margin-top:2vh;max-width:64vw">Probably most of you. It became a verb. Worth one minute to map why they made the same Postgres-as-platform bet we are about to make.</p>
    <div class="meta-row" style="margin-top:3vh"><span>supabase.com</span></div>
  </div>
  <div class="foot"><div class="title">Why Supabase works: the database does the heavy lifting.</div><div>DETOUR</div></div>
</div>

---
class: 'dark'
---

<div class="slide-shell">
  <div class="chrome"><div>Capability &middot; APIs &middot; Open Source</div><ChromeCounter /></div>
  <div class="frame grid-2-6-6" style="padding-top:4vh">
    <div>
      <div class="kicker">SAME IDEA. SELF-HOSTABLE.</div>
      <h2 class="h-xl" style="font-size:3.6vw">Two single-binary sidecars derive the API from your schema.</h2>
      <p class="lead" style="margin-top:1.6vh">Both read your tables, your views, your functions, and your RLS policies. Both run in one command. Neither is a service you have to operate.</p>
      <div class="callout" style="margin-top:3vh"><div class="q-big">Auto-generated. Open source. Same Postgres, same policies, two protocols.</div><span class="callout-src">PostgREST &middot; PostGraphile</span></div>
    </div>
    <div style="display:flex;flex-direction:column;gap:2.4vh">
      <v-clicks>
        <div>
          <div class="kicker" style="margin-bottom:0.8vh">REST</div>
          <div style="font-family:var(--serif-en);font-weight:700;font-size:1.7vw;line-height:1.15">PostgREST</div>
          <div style="font-family:var(--sans-body);font-size:max(13px,0.95vw);opacity:0.72;line-height:1.45;margin-top:0.4vh">postgrest.org</div>
          <div class="terminal" style="margin-top:1.2vh;padding:1.4vh 1.1vw">
            <span class="line"><span class="prompt">$</span> PGRST_DB_URI="postgres://..." \</span>
            <span class="line">&nbsp;&nbsp;PGRST_DB_ANON_ROLE=anon \</span>
            <span class="line">&nbsp;&nbsp;postgrest</span>
            <span class="line dim" style="margin-top:0.6vh">&rarr; http://localhost:3000</span>
          </div>
        </div>
        <div>
          <div class="kicker" style="margin-bottom:0.8vh">GRAPHQL</div>
          <div style="font-family:var(--serif-en);font-weight:700;font-size:1.7vw;line-height:1.15">PostGraphile</div>
          <div style="font-family:var(--sans-body);font-size:max(13px,0.95vw);opacity:0.72;line-height:1.45;margin-top:0.4vh">postgraphile.org</div>
          <div class="terminal" style="margin-top:1.2vh;padding:1.4vh 1.1vw">
            <span class="line"><span class="prompt">$</span> npx postgraphile \</span>
            <span class="line">&nbsp;&nbsp;-P postgraphile/presets/amber \</span>
            <span class="line">&nbsp;&nbsp;-c "postgres://..." -e</span>
            <span class="line dim" style="margin-top:0.6vh">&rarr; http://localhost:5678/graphql</span>
          </div>
        </div>
      </v-clicks>
    </div>
  </div>
  <div class="foot"><div class="title">One binary each. Same schema. Two protocols.</div><div>REST + GRAPHQL</div></div>
</div>

---
class: 'light'
---

<div class="slide-shell">
  <div class="chrome"><div>Data &middot; Shapes</div><ChromeCounter /></div>
  <div class="frame" style="padding-top:4vh;display:grid;grid-template-columns:5fr 7fr;gap:3vw;align-items:start">
    <div>
      <div class="kicker">STRUCTURED + UNSTRUCTURED</div>
      <h2 class="h-xl" style="font-size:3.6vw">Two shapes. One table.</h2>
      <p class="lead" style="font-size:1.4vw;margin-top:1.6vh">Postgres treats typed columns and JSONB documents as first-class on the same row. Same transaction, same RLS, same indexes. Pick the shape per field, not per table.</p>
      <div class="callout" style="margin-top:3vh"><div class="q-big" style="font-size:1.3vw">When you don&rsquo;t know the schema yet, you put it in <code style="font-family:var(--mono);color:var(--volt-green)">jsonb</code>. When you do, you put it in a column. The query path is the same.</div><span class="callout-src">one table, one engine, two shapes</span></div>
    </div>
    <div class="terminal walkable" style="padding:2vh 1.4vw">
      <div class="walk-chunk">
        <span class="line dim">-- One files table. Typed columns for what we know.</span>
        <span class="line">create table files (</span>
        <span class="line">&nbsp;&nbsp;id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uuid primary key,</span>
        <span class="line">&nbsp;&nbsp;team_id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uuid not null,</span>
        <span class="line">&nbsp;&nbsp;path&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;text not null,</span>
        <span class="line">&nbsp;&nbsp;language&nbsp;&nbsp;&nbsp;&nbsp;text,</span>
        <span class="line">&nbsp;&nbsp;size_bytes&nbsp;&nbsp;int&nbsp;&nbsp;not null,</span>
        <span class="line">&nbsp;&nbsp;content&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;text not null,</span>
        <span class="line accent">&nbsp;&nbsp;metadata&nbsp;&nbsp;&nbsp;&nbsp;jsonb not null default '{}'&nbsp;&nbsp;-- per-row schema</span>
        <span class="line">);</span>
      </div>
    </div>
  </div>
  <div class="foot"><div class="title">One table. Two shapes. Same machinery.</div><div>SHAPES</div></div>
</div>

---
class: 'dark'
---

<div class="slide-shell">
  <div class="chrome"><div>Data &middot; Structured</div><ChromeCounter /></div>
  <div class="frame" style="padding-top:4vh;display:grid;grid-template-columns:5fr 7fr;gap:3vw;align-items:start">
    <div>
      <div class="kicker">TYPED COLUMNS</div>
      <h2 class="h-xl" style="font-size:3.6vw">Filter. Join. Aggregate.</h2>
      <p class="lead" style="font-size:1.4vw;margin-top:1.6vh">Stable shapes the planner understands. Typed columns get composite indexes, foreign-key joins, and aggregates that the optimiser has been tuning for decades.</p>
      <div class="callout" style="margin-top:3vh"><div class="q-big" style="font-size:1.3vw">When the shape is fixed and you query it the same way every time, a typed column is the cheapest thing in the engine.</div><span class="callout-src">structured = predictable plans</span></div>
    </div>
    <div class="terminal walkable" style="padding:2vh 1.4vw">
      <v-clicks>
        <div class="walk-chunk">
          <span class="line dim">-- 1. Filter on typed columns. WHERE is the planner&rsquo;s lunch.</span>
          <span class="line">select path, size_bytes</span>
          <span class="line">from files</span>
          <span class="line">where language = 'typescript'</span>
          <span class="line">&nbsp;&nbsp;and size_bytes &lt; 1000;</span>
        </div>
        <div class="walk-chunk">
          <span class="line dim">-- 2. Join the relational graph. Foreign keys are real.</span>
          <span class="line">select r.name, count(f.*) as files</span>
          <span class="line">from repos r</span>
          <span class="line">left join files f on f.repo_id = r.id</span>
          <span class="line">group by r.name;</span>
        </div>
        <div class="walk-chunk">
          <span class="line dim">-- 3. Compose an index that matches the query.</span>
          <span class="line">create index files_lang_size</span>
          <span class="line">&nbsp;&nbsp;on files (language, size_bytes);</span>
        </div>
      </v-clicks>
    </div>
  </div>
  <div class="foot"><div class="title">Stable shapes for stable plans.</div><div>STRUCTURED</div></div>
</div>

---
class: 'light'
---

<div class="slide-shell">
  <div class="chrome"><div>Data &middot; Unstructured</div><ChromeCounter /></div>
  <div class="frame" style="padding-top:4vh;display:grid;grid-template-columns:5fr 7fr;gap:3vw;align-items:start">
    <div>
      <div class="kicker">JSONB</div>
      <h2 class="h-xl" style="font-size:3.4vw">JSON, queryable. Indexed. Without leaving the table.</h2>
      <p class="lead" style="font-size:1.4vw;margin-top:1.6vh">One column holds anything a row needs. Postgres exposes operators to extract values, match shapes, and index across the whole document.</p>
      <div class="callout" style="margin-top:3vh"><div class="q-big" style="font-size:1.3vw">Per-row schema. Per-row index. No second database. No new query language.</div><span class="callout-src">jsonb is a Postgres type, not a feature</span></div>
    </div>
    <div class="terminal walkable" style="padding:2vh 1.4vw">
      <v-clicks>
        <div class="walk-chunk">
          <span class="line dim">-- 1. Insert a document into the jsonb column.</span>
          <span class="line">insert into files (path, content, metadata)</span>
          <span class="line">values (</span>
          <span class="line">&nbsp;&nbsp;'src/auth.ts', '...',</span>
          <span class="line">&nbsp;&nbsp;'{"exports": ["authMiddleware"], "loc": 28}'</span>
          <span class="line">);</span>
        </div>
        <div class="walk-chunk">
          <span class="line dim">-- 2. Extract with -&gt;&gt; and test paths with -&gt;</span>
          <span class="line">select path, metadata-&gt;&gt;'loc' as loc</span>
          <span class="line">from files</span>
          <span class="line">where metadata-&gt;'exports' ? 'authMiddleware';</span>
        </div>
        <div class="walk-chunk">
          <span class="line dim">-- 3. @&gt; asks "does this document contain this shape?"</span>
          <span class="line">select path from files</span>
          <span class="line">where metadata @&gt; '{"exports": ["authMiddleware"]}';</span>
        </div>
        <div class="walk-chunk">
          <span class="line dim">-- 4. One GIN index makes every @&gt; query fast.</span>
          <span class="line">create index files_metadata_gin</span>
          <span class="line">&nbsp;&nbsp;on files using gin (metadata);</span>
        </div>
      </v-clicks>
    </div>
  </div>
  <div class="foot"><div class="title">Per-row schema. Per-row index. Same engine.</div><div>JSONB</div></div>
</div>

---
class: 'dark'
---

<div class="slide-shell">
  <div class="chrome"><div>Capability &middot; Queues</div><ChromeCounter /></div>
  <div class="frame" style="padding-top:4vh;display:grid;grid-template-columns:5fr 7fr;gap:3vw;align-items:start">
    <div>
      <div class="kicker">BACKGROUND JOBS</div>
      <h2 class="h-xl" style="font-size:3.6vw">The queue is a table.</h2>
      <p class="lead" style="font-size:1.4vw;margin-top:1.6vh">Three SQL primitives compose into a real queue: <code style="font-family:var(--mono);color:var(--volt-green)">FOR UPDATE SKIP LOCKED</code> for concurrent workers, transactions for atomic enqueue, <code style="font-family:var(--mono);color:var(--volt-green)">NOTIFY</code> for instant wake-up.</p>
      <div class="callout" style="margin-top:3vh"><div class="q-big" style="font-size:1.3vw">Create the row, audit the event, enqueue the embedding. One transaction. One commit. No outbox.</div><span class="callout-src">atomic by default</span></div>
    </div>
    <div class="terminal walkable" style="padding:2vh 1.4vw">
      <v-clicks>
        <div class="walk-chunk">
          <span class="line dim">-- 1. A queue is a table with a status column.</span>
          <span class="line">create table jobs (</span>
          <span class="line">&nbsp;&nbsp;id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uuid primary key default gen_random_uuid(),</span>
          <span class="line">&nbsp;&nbsp;payload&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;jsonb not null,</span>
          <span class="line">&nbsp;&nbsp;status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;text not null default 'queued',</span>
          <span class="line">&nbsp;&nbsp;available_at&nbsp;&nbsp;timestamptz not null default now()</span>
          <span class="line">);</span>
        </div>
        <div class="walk-chunk">
          <span class="line dim">-- 2. SKIP LOCKED lets every worker claim a job, never the same one.</span>
          <span class="line">select id, payload from jobs</span>
          <span class="line">where status = 'queued' and available_at &lt;= now()</span>
          <span class="line">order by available_at</span>
          <span class="line accent">for update skip locked</span>
          <span class="line">limit 1;</span>
        </div>
        <div class="walk-chunk">
          <span class="line dim">-- 3. Enqueue inside the same transaction as the business write.</span>
          <span class="line">begin;</span>
          <span class="line">&nbsp;&nbsp;insert into files (...) returning id;</span>
          <span class="line">&nbsp;&nbsp;insert into jobs (payload)</span>
          <span class="line">&nbsp;&nbsp;&nbsp;&nbsp;values (jsonb_build_object('file_id', $1));</span>
          <span class="line">commit;</span>
        </div>
      </v-clicks>
    </div>
  </div>
  <div class="foot"><div class="title">Queue, scheduler, outbox - all rows.</div><div>QUEUES</div></div>
</div>

---
class: 'light'
---

<div class="slide-shell">
  <div class="chrome"><div>Capability &middot; pg_cron</div><ChromeCounter /></div>
  <div class="frame" style="padding-top:4vh;display:grid;grid-template-columns:5fr 7fr;gap:3vw;align-items:start">
    <div>
      <div class="kicker">SCHEDULED JOBS</div>
      <h2 class="h-xl" style="font-size:3.6vw">pg_cron makes schedules a table too.</h2>
      <p class="lead" style="font-size:1.4vw;margin-top:1.6vh">An extension that turns cron expressions into rows. The database runs the schedule. No external scheduler, no Kubernetes CronJob, no surprise drift.</p>
      <div class="callout" style="margin-top:3vh"><div class="q-big" style="font-size:1.3vw">Every row in <code style="font-family:var(--mono);color:#5e537c">cron.job</code> is a future tick of the database&rsquo;s heartbeat.</div><span class="callout-src">github.com/citusdata/pg_cron</span></div>
    </div>
    <div class="terminal walkable" style="padding:2vh 1.4vw">
      <v-clicks>
        <div class="walk-chunk">
          <span class="line dim">-- 1. Install the extension once.</span>
          <span class="line">create extension if not exists pg_cron;</span>
        </div>
        <div class="walk-chunk">
          <span class="line dim">-- 2. Schedule a SQL command on a cron expression.</span>
          <span class="line">select cron.schedule(</span>
          <span class="line">&nbsp;&nbsp;'nightly-vacuum',</span>
          <span class="line">&nbsp;&nbsp;'0 10 * * *',&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-- 10:00 UTC, every day</span>
          <span class="line">&nbsp;&nbsp;'vacuum analyze'</span>
          <span class="line">);</span>
        </div>
        <div class="walk-chunk">
          <span class="line dim">-- 3. Or call your own function.</span>
          <span class="line">select cron.schedule(</span>
          <span class="line">&nbsp;&nbsp;'archive-stale-runs',</span>
          <span class="line">&nbsp;&nbsp;'0 3 * * 0',&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-- 03:00 UTC every Sunday</span>
          <span class="line">&nbsp;&nbsp;$$select archive_runs_older_than('30 days')$$</span>
          <span class="line">);</span>
        </div>
        <div class="walk-chunk">
          <span class="line dim">-- 4. See what is scheduled. Unschedule by name.</span>
          <span class="line">select jobid, schedule, command from cron.job;</span>
          <span class="line">select cron.unschedule('nightly-vacuum');</span>
        </div>
      </v-clicks>
    </div>
  </div>
  <div class="foot"><div class="title">The schedule is a row. The DB is the cron.</div><div>PG_CRON</div></div>
</div>

---
class: 'dark'
---

<div class="slide-shell">
  <div class="chrome"><div>Capability &middot; Graphile Worker</div><ChromeCounter /></div>
  <div class="frame" style="padding-top:4vh;display:grid;grid-template-columns:5fr 7fr;gap:3vw;align-items:start">
    <div>
      <div class="kicker">PRODUCTION QUEUES</div>
      <h2 class="h-xl" style="font-size:3.4vw">One npm package. Every queue primitive.</h2>
      <p class="lead" style="font-size:1.4vw;margin-top:1.6vh">Graphile Worker takes the SKIP LOCKED + NOTIFY pattern, adds retries, cron, batching, and TypeScript task definitions. Same Postgres, same RLS, no operational hop.</p>
      <div class="callout" style="margin-top:3vh"><div class="q-big" style="font-size:1.3vw">The job table is in your database. The worker is a binary. The producer is one line of SQL.</div><span class="callout-src">worker.graphile.org</span></div>
    </div>
    <div class="terminal walkable" style="padding:2vh 1.4vw">
      <v-clicks>
        <div class="walk-chunk">
          <span class="line dim">-- tasks/embed_file.ts</span>
          <span class="line">import type { Task } from 'graphile-worker'</span>
          <span class="line"></span>
          <span class="line">const embedFile: Task = async (payload, { logger }) =&gt; {</span>
          <span class="line">&nbsp;&nbsp;const { fileId } = payload as { fileId: string }</span>
          <span class="line">&nbsp;&nbsp;logger.info(`embedding file ${fileId}`)</span>
          <span class="line">&nbsp;&nbsp;<span class="dim">// ... compute + upsert embedding</span></span>
          <span class="line">}</span>
          <span class="line">export default embedFile</span>
        </div>
        <div class="walk-chunk">
          <span class="line dim"># One command. Connects to Postgres. Tails the queue.</span>
          <span class="line"><span class="prompt">$</span> npx graphile-worker -c "postgres:///repo"</span>
        </div>
        <div class="walk-chunk">
          <span class="line dim">-- Producer side. Same transaction as the business write.</span>
          <span class="line">begin;</span>
          <span class="line">&nbsp;&nbsp;insert into files (path, content) values (...);</span>
          <span class="line accent">&nbsp;&nbsp;perform graphile_worker.add_job(</span>
          <span class="line accent">&nbsp;&nbsp;&nbsp;&nbsp;'embed_file',</span>
          <span class="line accent">&nbsp;&nbsp;&nbsp;&nbsp;jsonb_build_object('fileId', new_file_id)</span>
          <span class="line accent">&nbsp;&nbsp;);</span>
          <span class="line">commit;</span>
        </div>
      </v-clicks>
    </div>
  </div>
  <div class="foot"><div class="title">Job state beside product state. Atomic from day one.</div><div>GRAPHILE WORKER</div></div>
</div>

---
class: 'light'
---

<div class="slide-shell">
  <div class="chrome"><div>Search &middot; Two Shapes</div><ChromeCounter /></div>
  <div class="frame" style="padding-top:4vh;display:grid;grid-template-columns:5fr 7fr;gap:3vw;align-items:start">
    <div>
      <div class="kicker">SEARCH FOR RAG</div>
      <h2 class="h-xl" style="font-size:3.4vw">RAG is retrieval. Postgres is good at retrieval.</h2>
      <p class="lead" style="font-size:1.4vw;margin-top:1.6vh">When the model needs grounded information, you do not call an API. You query your own data. Full-text is built into core Postgres. pgvector is an extension &mdash; declared like a built-in type, indexed like a built-in column, planned like a built-in operator.</p>
      <div class="callout" style="margin-top:3vh"><div class="q-big" style="font-size:1.3vw">Full-text for the words you can name. Vectors for the meaning you cannot.</div><span class="callout-src">tsvector in core &middot; pgvector via extension</span></div>
    </div>
    <div class="terminal walkable" style="padding:2vh 1.4vw">
      <div class="walk-chunk">
        <span class="line dim">-- pgvector is an extension; full-text is already in core.</span>
        <span class="line accent">create extension if not exists vector;</span>
        <span class="line"></span>
        <span class="line dim">-- One files table. Two search columns side by side.</span>
        <span class="line">create table files (</span>
        <span class="line">&nbsp;&nbsp;id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uuid primary key,</span>
        <span class="line">&nbsp;&nbsp;path&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;text not null,</span>
        <span class="line">&nbsp;&nbsp;content&nbsp;&nbsp;&nbsp;text not null,</span>
        <span class="line">&nbsp;&nbsp;tsv&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;tsvector generated always as</span>
        <span class="line">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(to_tsvector('english', content)) stored,</span>
        <span class="line">&nbsp;&nbsp;embedding&nbsp;vector(384)</span>
        <span class="line">);</span>
        <span class="line"></span>
        <span class="line dim">-- One index per search shape.</span>
        <span class="line">create index files_tsv_idx on files using gin&nbsp;&nbsp;(tsv);</span>
        <span class="line">create index files_vec_idx on files using hnsw (embedding vector_cosine_ops);</span>
      </div>
    </div>
  </div>
  <div class="foot"><div class="title">One in core, one as an extension. Same row, same plan.</div><div>SEARCH</div></div>
</div>

---
class: 'dark'
---

<div class="slide-shell">
  <div class="chrome"><div>Search &middot; Full-text</div><ChromeCounter /></div>
  <div class="frame" style="padding-top:4vh;display:grid;grid-template-columns:5fr 7fr;gap:3vw;align-items:start">
    <div>
      <div class="kicker">WORDS YOU CAN NAME</div>
      <h2 class="h-xl" style="font-size:3.6vw">Tokenise. Index. Rank.</h2>
      <p class="lead" style="font-size:1.4vw;margin-top:1.6vh">Postgres normalises text to lexemes, indexes them with GIN, and ranks matches with the same SQL planner that filters your business rows.</p>
      <div class="callout" style="margin-top:3vh"><div class="q-big" style="font-size:1.3vw">When the user types a function name, an error code, a product name: full-text is faster than your model.</div><span class="callout-src">tsvector + websearch_to_tsquery</span></div>
    </div>
    <div class="terminal walkable" style="padding:2vh 1.4vw">
      <v-clicks>
        <div class="walk-chunk">
          <span class="line dim">-- 1. websearch_to_tsquery handles &quot;auth -login&quot; naturally.</span>
          <span class="line">select path, ts_rank(tsv, q) as rank</span>
          <span class="line">from files, websearch_to_tsquery('english', 'auth middleware') q</span>
          <span class="line">where tsv @@ q</span>
          <span class="line">order by rank desc</span>
          <span class="line">limit 5;</span>
        </div>
        <div class="walk-chunk">
          <span class="line dim">-- 2. ts_headline returns the matched terms in context.</span>
          <span class="line">select path,</span>
          <span class="line">&nbsp;&nbsp;ts_headline('english', content,</span>
          <span class="line">&nbsp;&nbsp;&nbsp;&nbsp;websearch_to_tsquery('english', 'middleware'))</span>
          <span class="line">from files</span>
          <span class="line">where tsv @@ websearch_to_tsquery('english', 'middleware');</span>
        </div>
        <div class="walk-chunk">
          <span class="line dim">-- 3. Compose with structured filters in one query plan.</span>
          <span class="line">select path from files</span>
          <span class="line">where language = 'typescript'</span>
          <span class="line">&nbsp;&nbsp;and tsv @@ phraseto_tsquery('english', 'auth middleware');</span>
        </div>
      </v-clicks>
    </div>
  </div>
  <div class="foot"><div class="title">Lexemes, ranked, indexed in core.</div><div>TSVECTOR</div></div>
</div>

---
class: 'light'
---

<div class="slide-shell">
  <div class="chrome"><div>Search &middot; Vectors + Hybrid</div><ChromeCounter /></div>
  <div class="frame" style="padding-top:4vh;display:grid;grid-template-columns:5fr 7fr;gap:3vw;align-items:start">
    <div>
      <div class="kicker">MEANING YOU CANNOT NAME</div>
      <h2 class="h-xl" style="font-size:3.2vw">Vectors for the questions users phrase their own way.</h2>
      <p class="lead" style="font-size:1.4vw;margin-top:1.6vh">pgvector adds the <code style="font-family:var(--mono);color:#5e537c">vector</code> type, distance operators (<code style="font-family:var(--mono);color:#5e537c">&lt;-&gt;</code>, <code style="font-family:var(--mono);color:#5e537c">&lt;=&gt;</code>, <code style="font-family:var(--mono);color:#5e537c">&lt;#&gt;</code>), and HNSW indexes. Semantic similarity is now a column.</p>
      <div class="callout" style="margin-top:3vh"><div class="q-big" style="font-size:1.3vw">Hybrid is the win: rank by text + vector, filter by tenant + freshness, all in one plan, all under one policy.</div><span class="callout-src">RAG = retrieval, not magic</span></div>
    </div>
    <div class="terminal walkable" style="padding:2vh 1.4vw">
      <v-clicks>
        <div class="walk-chunk">
          <span class="line dim">-- 1. Nearest neighbour with cosine distance.</span>
          <span class="line">select path, 1 - (embedding &lt;=&gt; $1) as similarity</span>
          <span class="line">from files</span>
          <span class="line">where team_id = current_team_id()</span>
          <span class="line">order by embedding &lt;=&gt; $1</span>
          <span class="line">limit 5;</span>
        </div>
        <div class="walk-chunk">
          <span class="line dim">-- 2. Hybrid: blend text rank and vector rank in one query.</span>
          <span class="line">with text_hits as (</span>
          <span class="line">&nbsp;&nbsp;select id, ts_rank(tsv, q) as r</span>
          <span class="line">&nbsp;&nbsp;from files, websearch_to_tsquery('english', $1) q</span>
          <span class="line">&nbsp;&nbsp;where tsv @@ q order by r desc limit 20</span>
          <span class="line">), vec_hits as (</span>
          <span class="line">&nbsp;&nbsp;select id, 1 - (embedding &lt;=&gt; $2) as r</span>
          <span class="line">&nbsp;&nbsp;from files order by embedding &lt;=&gt; $2 limit 20</span>
          <span class="line">)</span>
          <span class="line">select f.path,</span>
          <span class="line accent">&nbsp;&nbsp;coalesce(t.r,0)*0.5 + coalesce(v.r,0)*0.5 as rank</span>
          <span class="line">from files f</span>
          <span class="line">left join text_hits t on t.id = f.id</span>
          <span class="line">left join vec_hits&nbsp;&nbsp;v on v.id = f.id</span>
          <span class="line">order by rank desc limit 10;</span>
        </div>
      </v-clicks>
    </div>
  </div>
  <div class="foot"><div class="title">Two indexes, one rank, one tenant, one query.</div><div>PGVECTOR + HYBRID</div></div>
</div>

---
class: 'dark'
---

<div class="slide-shell">
  <div class="chrome"><div>Realtime &middot; The Mechanism</div><ChromeCounter /></div>
  <div class="frame" style="padding-top:4vh;display:grid;grid-template-columns:5fr 7fr;gap:3vw;align-items:start">
    <div>
      <div class="kicker">EVENTS AS ROW CHANGES</div>
      <h2 class="h-xl" style="font-size:3.4vw">Triggers fire <code style="font-family:var(--mono);color:var(--volt-green)">pg_notify</code>. The database is the bus.</h2>
      <p class="lead" style="font-size:1.4vw;margin-top:1.6vh">LISTEN / NOTIFY ships in core Postgres. A trigger emits a payload on every row change you care about. No queue, no Redis, no Kafka, no second service to operate.</p>
      <div class="callout" style="margin-top:3vh"><div class="q-big" style="font-size:1.3vw">Notifications travel inside the transaction. They only fire on COMMIT - so your event source can never disagree with your data.</div><span class="callout-src">at-most-once delivery on commit</span></div>
    </div>
    <div class="terminal walkable" style="padding:2vh 1.4vw">
      <v-clicks>
        <div class="walk-chunk">
          <span class="line dim">-- 1. A trigger function shapes the payload as JSON.</span>
          <span class="line">create function notify_file_embedded() returns trigger as $$</span>
          <span class="line">begin</span>
          <span class="line">&nbsp;&nbsp;perform pg_notify(</span>
          <span class="line accent">&nbsp;&nbsp;&nbsp;&nbsp;'file_embedded',</span>
          <span class="line">&nbsp;&nbsp;&nbsp;&nbsp;json_build_object(</span>
          <span class="line">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'team_id', new.team_id,</span>
          <span class="line">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'file_id', new.id,</span>
          <span class="line">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'path',&nbsp;&nbsp;&nbsp;&nbsp;new.path</span>
          <span class="line">&nbsp;&nbsp;&nbsp;&nbsp;)::text</span>
          <span class="line">&nbsp;&nbsp;);</span>
          <span class="line">&nbsp;&nbsp;return new;</span>
          <span class="line">end;</span>
          <span class="line">$$ language plpgsql;</span>
        </div>
        <div class="walk-chunk">
          <span class="line dim">-- 2. Attach the trigger to the column that matters.</span>
          <span class="line">create trigger files_embedded_notify</span>
          <span class="line">&nbsp;&nbsp;after update of embedded_at on files</span>
          <span class="line">&nbsp;&nbsp;for each row execute function notify_file_embedded();</span>
        </div>
        <div class="walk-chunk">
          <span class="line dim">-- 3. Now any UPDATE that sets embedded_at fires the channel.</span>
          <span class="line">update files set embedded_at = now() where id = $1;</span>
          <span class="line dim">-- &rarr; channel: file_embedded</span>
          <span class="line dim">-- &rarr; payload: {&quot;team_id&quot;: ..., &quot;file_id&quot;: ..., &quot;path&quot;: &quot;src/auth/...&quot;}</span>
        </div>
      </v-clicks>
    </div>
  </div>
  <div class="foot"><div class="title">No queue. No Redis. One transaction.</div><div>LISTEN / NOTIFY</div></div>
</div>

---
class: 'light'
---

<div class="slide-shell">
  <div class="chrome"><div>Realtime &middot; The Subscriber</div><ChromeCounter /></div>
  <div class="frame" style="padding-top:4vh;display:grid;grid-template-columns:5fr 7fr;gap:3vw;align-items:start">
    <div>
      <div class="kicker">ONE CONNECTION, MANY CHANNELS</div>
      <h2 class="h-xl" style="font-size:3.4vw">Subscribers hold one connection and read whenever the database speaks.</h2>
      <p class="lead" style="font-size:1.4vw;margin-top:1.6vh">A client runs <code style="font-family:var(--mono);color:#5e537c">LISTEN channel</code> once and Postgres pushes payloads down the same socket. Your Node, Bun, or Deno server forwards them straight into an RSC stream or a websocket.</p>
      <div class="callout" style="margin-top:3vh"><div class="q-big" style="font-size:1.3vw">The fan-out lives in your server process, not in another service. One Postgres connection, every active tenant.</div><span class="callout-src">cheap fan-out, honest source</span></div>
    </div>
    <div class="terminal walkable" style="padding:2vh 1.4vw">
      <v-clicks>
        <div class="walk-chunk">
          <span class="line dim">-- 1. From any psql session: subscribe to a channel.</span>
          <span class="line"><span class="prompt">repo=#</span> listen file_embedded;</span>
          <span class="line dim">LISTEN</span>
        </div>
        <div class="walk-chunk">
          <span class="line dim">// 2. Same connection in Node. Hold it open, push events upward.</span>
          <span class="line">import { Client } from 'pg'</span>
          <span class="line">const client = new Client()</span>
          <span class="line">await client.connect()</span>
          <span class="line">await client.query('listen file_embedded')</span>
          <span class="line"></span>
          <span class="line">client.on('notification', (msg) =&gt; {</span>
          <span class="line accent">&nbsp;&nbsp;const event = JSON.parse(msg.payload)</span>
          <span class="line">&nbsp;&nbsp;<span class="dim">// forward into SSE / websocket / RSC stream</span></span>
          <span class="line">&nbsp;&nbsp;sseStreamForTeam(event.team_id).write(event)</span>
          <span class="line">})</span>
        </div>
        <div class="walk-chunk">
          <span class="line dim">-- 3. Trigger an event from another session. The first one prints it.</span>
          <span class="line"><span class="prompt">repo=#</span> update files set embedded_at = now()</span>
          <span class="line">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;where path = 'src/auth/middleware.ts';</span>
          <span class="line dim">UPDATE 1</span>
          <span class="line dim">Asynchronous notification &quot;file_embedded&quot; with payload</span>
          <span class="line dim">&quot;{&quot;team_id&quot;: ..., &quot;file_id&quot;: ..., &quot;path&quot;: &quot;src/auth/middleware.ts&quot;}&quot;</span>
        </div>
      </v-clicks>
    </div>
  </div>
  <div class="foot"><div class="title">LISTEN once. Read whenever Postgres speaks.</div><div>LISTEN / NOTIFY</div></div>
</div>

---
class: 'hero dark'
---

<div class="slide-shell">
  <WebGLBackground variant="dark" />
  <div class="chrome"><div>React &middot; Server Components</div><ChromeCounter /></div>
  <div class="frame" style="display:grid;grid-template-columns:1fr 1fr;gap:5vw;align-items:center;height:100%">
    <div>
      <div class="kicker">THE REACT SHIFT</div>
      <h1 class="h-hero" style="font-size:4.2vw">RSC makes direct database access feel normal again.</h1>
      <p class="lead" style="margin-top:3vh">Not from the browser. Not with leaked secrets. From the server render path, where Postgres queries, policies, and streamed UI can live together.</p>
    </div>
    <div class="terminal">
      <span class="line">export default async function Inbox() {</span>
      <span class="line">  const runs = await db.agentRuns.visibleToUser();</span>
      <span class="line">  return &lt;RunList runs={runs} /&gt;;</span>
      <span class="line">}</span>
      <span class="line dim" style="margin-top:2vh">Less client state. Fewer fetch waterfalls. Server-owned data boundaries.</span>
    </div>
  </div>
  <div class="foot"><div class="title">Data fetching as render-time composition</div><div>RSC</div></div>
</div>

---
class: 'light'
---

<div class="slide-shell">
  <div class="chrome"><div>Result &middot; Side-by-side</div><ChromeCounter /></div>
  <div class="frame" style="padding-top:5vh">
    <div class="kicker">COMPARE THE SHAPE</div>
    <h2 class="h-xl" style="font-size:5vw">Same AI product. Three architecture profiles.</h2>
    <div class="mini-table">
      <div class="mini-row head"><div>Concern</div><div>Monolith</div><div>Microservices</div><div>Postgres + RSC</div></div>
      <div class="mini-row"><div>Auth</div><div>Middleware checks</div><div>Claims across services</div><div>RLS beside rows</div></div>
      <div class="mini-row"><div>Vectors</div><div>Bolted-on table or service</div><div>Dedicated vector store</div><div>pgvector with joins</div></div>
      <div class="mini-row"><div>Realtime</div><div>App-level polling</div><div>Event gateway</div><div>DB state + notify</div></div>
      <div class="mini-row"><div>Jobs</div><div>Ad hoc worker</div><div>Queue service</div><div>Postgres-backed workers</div></div>
      <div class="mini-row"><div>UI data</div><div>API routes + client cache</div><div>Gateway contracts</div><div>Server components query directly</div></div>
    </div>
  </div>
  <div class="foot"><div class="title">The win is not fewer tools at any cost &middot; it is fewer boundaries by default</div><div>RESULT</div></div>
</div>

---
class: 'dark'
---

<div class="slide-shell">
  <div class="chrome"><div>Reality &middot; Tradeoffs</div><ChromeCounter /></div>
  <div class="frame" style="padding-top:5vh">
    <div class="kicker">WHERE THIS BREAKS DOWN</div>
    <h2 class="h-xl" style="font-size:4.9vw">Postgres can do ten jobs well enough. It should not do every job forever.</h2>
    <div class="grid-3" style="margin-top:6vh">
      <div class="pillar"><div class="ic">01</div><div class="t">Scale boundaries</div><div class="d">If one workload dominates CPU, storage, or latency, split it intentionally.</div></div>
      <div class="pillar"><div class="ic">02</div><div class="t">Operational maturity</div><div class="d">Backups, migrations, pooling, observability, and lock hygiene matter more.</div></div>
      <div class="pillar"><div class="ic">03</div><div class="t">Team boundaries</div><div class="d">If separate teams own separate products, service boundaries may be worth the cost.</div></div>
    </div>
    <div class="callout" style="margin-top:6vh;max-width:78vw"><div class="q-big">The argument is not "never specialize." It is "earn the specialization."</div><span class="callout-src">default simple &middot; split when pressure proves it</span></div>
  </div>
  <div class="foot"><div class="title">The simple stack still needs grown-up operations</div><div>TRADEOFFS</div></div>
</div>

---
class: 'hero light'
---

<div class="slide-shell">
  <WebGLBackground variant="light" />
  <div class="chrome"><div>Close &middot; Takeaway</div><ChromeCounter /></div>
  <div class="frame" style="display:grid;gap:5vh;align-content:center;height:100%">
    <div class="kicker">THE RULE OF THUMB</div>
    <h1 class="h-hero" style="font-size:6.6vw">Start with the boring thing that removes glue.</h1>
    <p class="lead" style="max-width:64vw">For small teams and solo developers, the best AI stack is often not the best tool for every job. It is the system you can understand, secure, ship, and operate without turning your roadmap into infrastructure maintenance.</p>
    <div class="terminal" style="max-width:62vw">
      <span class="line"><span class="prompt">$</span> use the database you already trust</span>
      <span class="line"><span class="prompt">$</span> keep permissions next to data</span>
      <span class="line"><span class="prompt">$</span> add specialized tools when the pressure is real</span>
    </div>
  </div>
  <div class="foot"><div class="title">You probably already have it installed</div><div>END</div></div>
</div>

---
class: 'hero dark'
---

<div class="slide-shell">
  <WebGLBackground variant="dark" />
  <div class="chrome"><div>Thank you &middot; Connect</div><ChromeCounter /></div>
  <div class="frame" style="display:grid;grid-template-columns:1.1fr .9fr;gap:5vw;align-items:center;height:100%">
    <div>
      <div class="kicker">END OF TRANSMISSION</div>
      <h1 class="h-hero" style="font-size:7.4vw;line-height:0.95">Thank you.</h1>
      <p class="lead" style="max-width:34vw;margin-top:2vh">Questions, war stories, counter-takes. Find me on any of these. The slides and the sample app are public.</p>
    </div>
    <div style="display:grid;gap:2vh">
      <div class="contact-row">
        <span class="contact-label">GITHUB</span>
        <span class="contact-value">@DaniAkash</span>
      </div>
      <div class="contact-row">
        <span class="contact-label">X</span>
        <span class="contact-value">@dani_akash_</span>
      </div>
      <div class="contact-row">
        <span class="contact-label">WEB</span>
        <span class="contact-value">daniakash.com</span>
      </div>
      <div class="contact-row">
        <span class="contact-label">SLIDES + APP</span>
        <span class="contact-value" style="font-size:1.5vw">github.com/DaniAkash/React-and-Postgres-for-AI</span>
      </div>
    </div>
  </div>
  <div class="foot"><div class="title">React + Postgres &middot; The AI-Ready Stack You Already Know</div><div>Dani Akash</div></div>
</div>

<style>
.contact-row {
  display: flex;
  flex-direction: column;
  gap: 0.4vh;
  padding: 1.6vh 0;
  border-top: 1px solid rgba(var(--paper-rgb), 0.18);
}
.contact-row:last-child { border-bottom: 1px solid rgba(var(--paper-rgb), 0.18); }
.contact-label {
  font-family: var(--mono);
  font-size: max(11px, 0.82vw);
  letter-spacing: 0.26em;
  text-transform: uppercase;
  opacity: 0.55;
}
.contact-value {
  font-family: var(--serif-en);
  font-weight: 600;
  font-size: 2.6vw;
  letter-spacing: -0.01em;
  line-height: 1.1;
}
</style>
