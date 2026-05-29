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
    <div class="col" style="justify-content:space-between;min-height:66vh">
      <div>
        <div class="kicker">OPTION 01</div>
        <h2 class="h-xl" style="font-size:4.4vw">The traditional monolith is simple until AI makes it hungry.</h2>
        <p class="lead" style="margin-top:2vh">One deployable unit. One database. Great local reasoning. Then embeddings, async ingestion, chat updates, and permissioned retrieval push pressure into every corner.</p>
      </div>
      <div class="callout"><div class="q-big">The monolith is not wrong. It is just asked to pretend every workload is a request-response workload.</div><span class="callout-src">runtime pressure &middot; async / vector / realtime</span></div>
    </div>
    <div class="diagram">
      <div class="node hot"><div class="label">Web App</div><div class="name">React UI + API routes</div><div class="desc">Business logic, auth checks, data access, AI calls.</div></div>
      <div class="node"><div class="label">Database</div><div class="name">Postgres as system of record</div><div class="desc">Application tables, relational constraints, transactions.</div></div>
      <div class="node"><div class="label">New Pressure</div><div class="name">Embedding jobs, retrieval, live status</div><div class="desc">Usually bolted on after the first AI feature works.</div></div>
    </div>
  </div>
  <div class="foot"><div class="title">One process, one database, new workload shapes</div><div>OPTION 01</div></div>
</div>

---
class: 'light'
---

<div class="slide-shell">
  <div class="chrome"><div>Architecture &middot; Sprawl</div><ChromeCounter /></div>
  <div class="frame" style="padding-top:5vh">
    <div class="kicker">OPTION 02</div>
    <h2 class="h-xl" style="font-size:5.2vw">Microservices solve the pressure by distributing the pain.</h2>
    <p class="lead" style="max-width:72vw;margin-top:2vh">Specialized tools can be the right answer at scale. But for a small team, every extra service adds a contract, a failure mode, a bill, and a page in the runbook.</p>
    <div class="compare">
      <div class="colbox"><h3>Auth service</h3><p>Application roles become claims, sync jobs, middleware checks, and policy drift.</p></div>
      <div class="colbox"><h3>Vector database</h3><p>Embeddings leave the relational context that usually decides whether a row is even visible.</p></div>
      <div class="colbox"><h3>Queue + realtime</h3><p>Every job state now has to travel through another system before the UI can trust it.</p></div>
    </div>
    <div class="terminal" style="margin-top:5vh">
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
    <div class="kicker">THE TURN</div>
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
  <div class="chrome"><div>Stack &middot; Map</div><ChromeCounter /></div>
  <div class="frame" style="padding-top:5vh">
    <div class="kicker">OPTION 03</div>
    <h2 class="h-xl" style="font-size:4.2vw">The Postgres + React Server Components approach collapses layers.</h2>
    <div class="pipeline-section">
      <div class="pipeline-label">Request path</div>
      <div class="pipeline" data-cols="5">
        <div class="step"><div class="step-nb">01</div><div class="step-title">User intent</div><div class="step-desc">A prompt, search, workflow run, or dashboard view.</div></div>
        <div class="step"><div class="step-nb">02</div><div class="step-title">RSC boundary</div><div class="step-desc">Server components fetch without shipping a client data layer.</div></div>
        <div class="step"><div class="step-nb">03</div><div class="step-title">Postgres policies</div><div class="step-desc">RLS decides visibility next to the data.</div></div>
        <div class="step"><div class="step-nb">04</div><div class="step-title">AI retrieval</div><div class="step-desc">Hybrid full-text + vector queries with relational filters.</div></div>
        <div class="step"><div class="step-nb">05</div><div class="step-title">Stream UI</div><div class="step-desc">RSC renders the result path back into the app.</div></div>
      </div>
    </div>
    <div class="terminal" style="margin-top:5vh"><span class="line"><span class="prompt">app/agent/page.tsx</span> imports server-only data functions</span><span class="line dim">No browser secret. No client cache ceremony. No duplicated permission model.</span></div>
  </div>
  <div class="foot"><div class="title">One data plane &middot; server-rendered product surface</div><div>OPTION 03</div></div>
</div>

---
class: 'dark'
---

<div class="slide-shell">
  <div class="chrome"><div>Capability &middot; Auth</div><ChromeCounter /></div>
  <div class="frame grid-2-7-5" style="padding-top:6vh">
    <div>
      <div class="kicker">AUTH WITHOUT A SERVICE</div>
      <h2 class="h-xl" style="font-size:4.7vw">Move authorization to the place that cannot forget it.</h2>
      <p class="lead" style="margin-top:2vh">Row Level Security lets the database enforce tenant, team, and user boundaries. Your app can still authenticate users; Postgres owns what rows they may touch.</p>
      <div class="callout" style="margin-top:5vh"><div class="q-big">The policy travels with every query, including the accidental ones.</div><span class="callout-src">RLS as data-plane guardrail</span></div>
    </div>
    <div class="terminal">
      <span class="line">alter table documents enable row level security;</span>
      <span class="line"></span>
      <span class="line">create policy team_docs on documents</span>
      <span class="line">  using (team_id = current_setting('app.team_id')::uuid);</span>
      <span class="line"></span>
      <span class="line dim">-- same rule for search, embeddings, admin screens</span>
    </div>
  </div>
  <div class="foot"><div class="title">Auth is not middleware when the data layer can enforce it</div><div>RLS</div></div>
</div>

---
class: 'light'
---

<div class="slide-shell">
  <div class="chrome"><div>Capability &middot; Vectors</div><ChromeCounter /></div>
  <div class="frame grid-2-6-6" style="padding-top:6vh">
    <div>
      <div class="kicker">VECTOR SEARCH WITHOUT A VECTOR DATABASE</div>
      <h2 class="h-xl" style="font-size:4.7vw">Embeddings are more useful when they stay next to your rows.</h2>
      <p class="lead" style="margin-top:2vh">With pgvector, semantic similarity can participate in normal SQL: tenant filters, joins, recency windows, permissions, ranking, and transactions.</p>
      <div class="chipline"><span class="chip">embedding</span><span class="chip">metadata</span><span class="chip">tenant_id</span><span class="chip">created_at</span><span class="chip">visibility</span></div>
    </div>
    <div class="terminal">
      <span class="line">select id, title</span>
      <span class="line">from documents</span>
      <span class="line">where workspace_id = $1</span>
      <span class="line">order by embedding &lt;-&gt; $2</span>
      <span class="line">limit 8;</span>
      <span class="line dim" style="margin-top:2vh">Semantic search, still relational.</span>
    </div>
  </div>
  <div class="foot"><div class="title">The join is the product feature</div><div>PGVECTOR</div></div>
</div>

---
class: 'dark'
---

<div class="slide-shell">
  <div class="chrome"><div>Capability &middot; Realtime</div><ChromeCounter /></div>
  <div class="frame" style="padding-top:5vh">
    <div class="kicker">REALTIME DIRECTLY IN THE DB</div>
    <h2 class="h-xl" style="font-size:4.6vw">For many agent workflows, live updates are database events.</h2>
    <p class="lead" style="max-width:72vw;margin-top:2vh">LISTEN/NOTIFY is not a replacement for every event system. But for "job advanced", "run failed", "message ready", and "document indexed", it can be the simplest honest event source.</p>
    <div class="pipeline-section">
      <div class="pipeline-label">Agent run lifecycle</div>
      <div class="pipeline" data-cols="4">
        <div class="step"><div class="step-nb">01</div><div class="step-title">Insert run</div><div class="step-desc">UI creates a row with status queued.</div></div>
        <div class="step"><div class="step-nb">02</div><div class="step-title">Worker claims</div><div class="step-desc">Job updates row to running.</div></div>
        <div class="step"><div class="step-nb">03</div><div class="step-title">Notify channel</div><div class="step-desc">DB emits the state change.</div></div>
        <div class="step"><div class="step-nb">04</div><div class="step-title">Render update</div><div class="step-desc">Server streams status into the product UI.</div></div>
      </div>
    </div>
  </div>
  <div class="foot"><div class="title">Events as rows changing state</div><div>LISTEN / NOTIFY</div></div>
</div>

---
class: 'light'
---

<div class="slide-shell">
  <div class="chrome"><div>Capability &middot; Background Work</div><ChromeCounter /></div>
  <div class="frame grid-2-7-5" style="padding-top:6vh">
    <div>
      <div class="kicker">BACKGROUND JOBS SIMPLIFIED</div>
      <h2 class="h-xl" style="font-size:4.7vw">Queues become easier when the queue is allowed to be relational.</h2>
      <p class="lead" style="margin-top:2vh">Graphile Worker and pg-boss use Postgres-native primitives for durable jobs, locking, retries, schedules, and transactional enqueue.</p>
      <div class="callout" style="margin-top:5vh"><div class="q-big">Create the user, write the audit event, enqueue the embedding job: one transaction.</div><span class="callout-src">atomic product behavior</span></div>
    </div>
    <div class="terminal">
      <span class="line">await sql.begin(async tx =&gt; {</span>
      <span class="line">  await tx`insert into documents ...`;</span>
      <span class="line">  await tx`select graphile_worker.add_job(</span>
      <span class="line">    'embed_document', json_build_object('id', doc_id)</span>
      <span class="line">  )`;</span>
      <span class="line">});</span>
    </div>
  </div>
  <div class="foot"><div class="title">Job state belongs beside product state</div><div>WORKERS</div></div>
</div>

---
class: 'dark'
---

<div class="slide-shell">
  <div class="chrome"><div>Capability &middot; Retrieval</div><ChromeCounter /></div>
  <div class="frame" style="padding-top:5vh">
    <div class="kicker">RAG WITHOUT THE COMPLEXITY</div>
    <h2 class="h-xl" style="font-size:4.8vw">Most retrieval is not pure vector search. It is filtered, ranked, permissioned search.</h2>
    <div class="compare">
      <div class="colbox"><h3>Full-text</h3><p>Exact terms, product names, issue IDs, table names, API references. Great when words matter.</p></div>
      <div class="colbox"><h3>Vectors</h3><p>Semantic neighbors, paraphrases, intent matching, "find things like this". Great when meaning matters.</p></div>
      <div class="colbox"><h3>SQL filters</h3><p>Workspace, user role, freshness, document type, state, source, and audit rules. Great when correctness matters.</p></div>
    </div>
    <div class="terminal" style="margin-top:5vh">
      <span class="line">rank = text_rank * 0.45 + vector_rank * 0.45 + freshness * 0.10</span>
      <span class="line dim">Hybrid retrieval is a product policy, not just an index choice.</span>
    </div>
  </div>
  <div class="foot"><div class="title">RAG is retrieval plus rules</div><div>HYBRID SEARCH</div></div>
</div>

---
class: 'light'
---

<div class="slide-shell">
  <div class="chrome"><div>Capability &middot; APIs</div><ChromeCounter /></div>
  <div class="frame grid-2-6-6" style="padding-top:6vh">
    <div>
      <div class="kicker">APIS WITHOUT WRITING EVERY API</div>
      <h2 class="h-xl" style="font-size:4.7vw">When your schema is deliberate, the API layer can be generated.</h2>
      <p class="lead" style="margin-top:2vh">Tools like PostgREST and pg_graphql turn tables, views, functions, and policies into a data API. That changes the work: less endpoint glue, more schema design.</p>
      <div class="chipline"><span class="chip">views</span><span class="chip">functions</span><span class="chip">policies</span><span class="chip">schema comments</span></div>
    </div>
    <div class="diagram">
      <div class="node"><div class="label">Tables</div><div class="name">Source of truth</div><div class="desc">Normalized data and constraints.</div></div>
      <div class="node hot"><div class="label">Views + functions</div><div class="name">Product contract</div><div class="desc">Stable shapes for the UI and agents.</div></div>
      <div class="node"><div class="label">Generated API</div><div class="name">PostgREST / pg_graphql</div><div class="desc">HTTP or GraphQL without repetitive handlers.</div></div>
    </div>
  </div>
  <div class="foot"><div class="title">API design shifts down into schema design</div><div>GENERATED API</div></div>
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
