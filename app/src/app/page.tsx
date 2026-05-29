// One RSC page. Lists repos and files for the active tenant.
//
// The query runs inside withTenant() which sets app.team_id, so the
// RLS policies in sql/06_rls_policies.sql do the filtering. There is
// no `where team_id = ...` in user code anywhere on this page.

import { withTenant } from '../db/client'
import { repos, files } from '../db/schema'
import { desc } from 'drizzle-orm'

// RSC page hits Postgres on every request, so opt out of static prerender.
export const dynamic = 'force-dynamic'

// In a real app these come from the session. Hardcoded for the demo.
const DEMO_TEAM = '11111111-1111-1111-1111-111111111111'
const DEMO_USER = '00000000-0000-0000-0000-000000000001'

export default async function HomePage() {
  const data = await withTenant(DEMO_TEAM, DEMO_USER, async (tx) => {
    const repoRows = await tx
      .select({
        id: repos.id,
        name: repos.name,
        url: repos.githubUrl,
        status: repos.ingestStatus,
        total: repos.filesTotal,
        indexed: repos.filesIndexed,
      })
      .from(repos)
      .orderBy(desc(repos.createdAt))

    const fileRows = await tx
      .select({
        path: files.path,
        language: files.language,
        size: files.sizeBytes,
        embedded: files.embeddedAt,
      })
      .from(files)
      .limit(20)

    return { repos: repoRows, files: fileRows }
  })

  return (
    <main>
      <div className="kicker">Repo Companion</div>
      <h1>Chat with your codebase. <span className="accent">Postgres-first.</span></h1>
      <p className="muted">
        Active tenant: <code>BrowserOS</code>. Every query on this page is
        RLS-scoped via <code>app.team_id</code>. Acme&apos;s repos are invisible.
      </p>

      <h2>Repos ({data.repos.length})</h2>
      <table>
        <thead><tr><th>Repo</th><th>URL</th><th>Status</th><th>Indexed</th></tr></thead>
        <tbody>
          {data.repos.map((r) => (
            <tr key={r.id}>
              <td><strong>{r.name}</strong></td>
              <td><code>{r.url}</code></td>
              <td>{r.status}</td>
              <td>{r.indexed} / {r.total}</td>
            </tr>
          ))}
        </tbody>
      </table>

      <h2>Files ({data.files.length})</h2>
      <table>
        <thead><tr><th>Path</th><th>Lang</th><th>Size</th><th>Embedded</th></tr></thead>
        <tbody>
          {data.files.map((f) => (
            <tr key={f.path}>
              <td><code>{f.path}</code></td>
              <td>{f.language}</td>
              <td className="muted">{f.size}b</td>
              <td className="muted">{f.embedded ? '✓' : 'pending'}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </main>
  )
}
