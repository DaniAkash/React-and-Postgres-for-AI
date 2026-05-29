// Mock deterministic embeddings.
//
// Hashes the input string into a 384-dim unit vector. Same input
// always produces the same vector, so the search demo is reproducible
// and runs offline. Swap with a real model call when LIVE_AI=true.

import { createHash } from 'node:crypto'

export function mockEmbedding(text: string, dimensions = 384): number[] {
  const hash = createHash('sha512').update(text).digest()
  const vec: number[] = []
  for (let i = 0; i < dimensions; i++) {
    const byte = hash[i % hash.length]!
    vec.push((byte / 127.5) - 1)
  }
  // Normalise to unit length so cosine distance is well-behaved.
  const norm = Math.sqrt(vec.reduce((acc, x) => acc + x * x, 0))
  return vec.map((x) => x / norm)
}

export async function embed(text: string): Promise<number[]> {
  if (process.env.LIVE_AI === 'true') {
    // Wire up OpenAI / Anthropic / Voyage here when you flip the flag.
    throw new Error('LIVE_AI not wired yet; using mockEmbedding for the demo')
  }
  return mockEmbedding(text)
}
