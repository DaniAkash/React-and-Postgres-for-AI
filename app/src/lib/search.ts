// Hybrid search: calls the SQL function declared in sql/08_hybrid_search.sql.
//
// The work happens in Postgres. The TS layer just shapes the inputs,
// passes the embedding as a vector literal, and types the rows back.

import { sql } from 'drizzle-orm'
import { db } from '../db/client'
import { embed } from './embeddings'

export type SearchHit = {
  fileId: string
  repoId: string
  path: string
  textRank: number
  vectorRank: number
  freshnessRank: number
  rank: number
}

export async function searchFiles(query: string, k = 10): Promise<SearchHit[]> {
  const embedding = await embed(query)
  const vectorLiteral = `[${embedding.join(',')}]`

  const result = await db.execute<SearchHit>(sql`
    select
      file_id        as "fileId",
      repo_id        as "repoId",
      path,
      text_rank      as "textRank",
      vector_rank    as "vectorRank",
      freshness_rank as "freshnessRank",
      rank
    from search_files(${query}, ${vectorLiteral}::vector(384), 0.5, 0.5, 30, ${k})
  `)
  return result.rows as SearchHit[]
}
