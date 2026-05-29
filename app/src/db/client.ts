// Drizzle client + the one trick that makes RLS work from the app:
// `withTenant(teamId, userId, fn)` sets the session variables Postgres
// reads inside the policies declared in sql/06_rls_policies.sql.
//
// Every server-side query runs inside one of these blocks. Forgetting
// to set them does not leak data - the policies fail closed.

import { drizzle } from 'drizzle-orm/node-postgres'
import { Pool } from 'pg'
import { sql } from 'drizzle-orm'
import * as schema from './schema'

const pool = new Pool({
  connectionString: process.env.DATABASE_URL ?? 'postgres://repo:repo@localhost:5432/repo',
  max: 10,
})

export const db = drizzle(pool, { schema })

export async function withTenant<T>(
  teamId: string,
  userId: string | null,
  fn: (tx: typeof db) => Promise<T>,
): Promise<T> {
  return await db.transaction(async (tx) => {
    await tx.execute(sql`select set_config('app.team_id', ${teamId}, true)`)
    if (userId) {
      await tx.execute(sql`select set_config('app.user_id', ${userId}, true)`)
    }
    return await fn(tx as unknown as typeof db)
  })
}
