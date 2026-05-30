// Drizzle schema - mirrors sql/01-05 one-for-one.
//
// This is the only file the rest of the TypeScript codebase imports.
// Types flow out of these definitions (via Drizzle's $inferSelect /
// $inferInsert), so changing a column here changes every consumer
// at compile time. Same shape, same names as the SQL.

import {
  pgTable,
  uuid,
  text,
  integer,
  timestamp,
  jsonb,
  vector,
  primaryKey,
  index,
  uniqueIndex,
  check,
} from 'drizzle-orm/pg-core'
import { sql } from 'drizzle-orm'

// ---------- identity + tenancy ----------

export const users = pgTable('users', {
  id: uuid('id').primaryKey().defaultRandom(),
  email: text('email').unique().notNull(),
  displayName: text('display_name'),
  createdAt: timestamp('created_at', { withTimezone: true }).notNull().defaultNow(),
})

export const teams = pgTable('teams', {
  id: uuid('id').primaryKey().defaultRandom(),
  name: text('name').notNull(),
  slug: text('slug').unique().notNull(),
  createdAt: timestamp('created_at', { withTimezone: true }).notNull().defaultNow(),
})

export const teamMembers = pgTable(
  'team_members',
  {
    teamId: uuid('team_id').notNull().references(() => teams.id, { onDelete: 'cascade' }),
    userId: uuid('user_id').notNull().references(() => users.id, { onDelete: 'cascade' }),
    role: text('role').notNull().default('member'),
    joinedAt: timestamp('joined_at', { withTimezone: true }).notNull().defaultNow(),
  },
  (t) => ({
    pk: primaryKey({ columns: [t.teamId, t.userId] }),
    userIdx: index('team_members_user_idx').on(t.userId),
    roleCheck: check('role_check', sql`role in ('owner', 'admin', 'member')`),
  }),
)

// ---------- repos ----------

export const repos = pgTable(
  'repos',
  {
    id: uuid('id').primaryKey().defaultRandom(),
    teamId: uuid('team_id').notNull().references(() => teams.id, { onDelete: 'cascade' }),
    githubUrl: text('github_url').notNull(),
    name: text('name').notNull(),
    defaultBranch: text('default_branch').notNull().default('main'),
    ingestStatus: text('ingest_status').notNull().default('pending'),
    filesTotal: integer('files_total').notNull().default(0),
    filesIndexed: integer('files_indexed').notNull().default(0),
    metadata: jsonb('metadata').notNull().default({}),
    createdAt: timestamp('created_at', { withTimezone: true }).notNull().defaultNow(),
    updatedAt: timestamp('updated_at', { withTimezone: true }).notNull().defaultNow(),
  },
  (t) => ({
    teamUrlUq: uniqueIndex('repos_team_url_uq').on(t.teamId, t.githubUrl),
    teamIdx: index('repos_team_idx').on(t.teamId, t.createdAt),
  }),
)

// ---------- files (the hero) ----------

export const files = pgTable(
  'files',
  {
    id: uuid('id').primaryKey().defaultRandom(),
    repoId: uuid('repo_id').notNull().references(() => repos.id, { onDelete: 'cascade' }),
    teamId: uuid('team_id').notNull().references(() => teams.id, { onDelete: 'cascade' }),
    path: text('path').notNull(),
    language: text('language'),
    sizeBytes: integer('size_bytes').notNull(),
    sha: text('sha').notNull(),
    content: text('content').notNull(),
    metadata: jsonb('metadata').notNull().default({}),
    embedding: vector('embedding', { dimensions: 384 }),
    embeddedAt: timestamp('embedded_at', { withTimezone: true }),
    updatedAt: timestamp('updated_at', { withTimezone: true }).notNull().defaultNow(),
  },
  (t) => ({
    repoPathUq: uniqueIndex('files_repo_path_uq').on(t.repoId, t.path),
    teamRepoIdx: index('files_team_repo_idx').on(t.teamId, t.repoId, t.path),
  }),
)

// ---------- chats + messages ----------

export const chats = pgTable('chats', {
  id: uuid('id').primaryKey().defaultRandom(),
  teamId: uuid('team_id').notNull().references(() => teams.id, { onDelete: 'cascade' }),
  repoId: uuid('repo_id').references(() => repos.id, { onDelete: 'set null' }),
  userId: uuid('user_id').notNull().references(() => users.id),
  title: text('title'),
  createdAt: timestamp('created_at', { withTimezone: true }).notNull().defaultNow(),
})

export const messages = pgTable('messages', {
  id: uuid('id').primaryKey().defaultRandom(),
  chatId: uuid('chat_id').notNull().references(() => chats.id, { onDelete: 'cascade' }),
  teamId: uuid('team_id').notNull().references(() => teams.id, { onDelete: 'cascade' }),
  role: text('role').notNull(),
  content: text('content').notNull(),
  payload: jsonb('payload').notNull().default({}),
  createdAt: timestamp('created_at', { withTimezone: true }).notNull().defaultNow(),
})

// ---------- agent runs ----------

export const agentRuns = pgTable('agent_runs', {
  id: uuid('id').primaryKey().defaultRandom(),
  teamId: uuid('team_id').notNull().references(() => teams.id, { onDelete: 'cascade' }),
  messageId: uuid('message_id').references(() => messages.id, { onDelete: 'set null' }),
  model: text('model').notNull(),
  status: text('status').notNull(),
  startedAt: timestamp('started_at', { withTimezone: true }).notNull().defaultNow(),
  finishedAt: timestamp('finished_at', { withTimezone: true }),
  payload: jsonb('payload').notNull(),
  embedding: vector('embedding', { dimensions: 384 }),
})

// ---------- inferred types ----------

export type User = typeof users.$inferSelect
export type NewUser = typeof users.$inferInsert
export type Team = typeof teams.$inferSelect
export type Repo = typeof repos.$inferSelect
export type File = typeof files.$inferSelect
export type Chat = typeof chats.$inferSelect
export type Message = typeof messages.$inferSelect
export type AgentRun = typeof agentRuns.$inferSelect
