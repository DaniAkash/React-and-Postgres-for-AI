# React + Postgres - The AI-Ready Stack You Already Know

Slides and showcase app for the talk **"React + Postgres - The AI-Ready Stack You Already Know"** by [Dani Akash](https://github.com/DaniAkash).

> Modern web apps that deal with AI workloads tend to accumulate services like a junk drawer accumulates batteries. PostgreSQL paired with React Server Components removes most of that sprawl.

**Event:** [Expert Talks Chennai](https://www.meetup.com/expert-talks-chennai/events/314841617/)

**Recording:** [Watch on YouTube](https://youtu.be/O9r2SeC6hw8)

## Repo layout

```
.
├── slides/   Slidev deck for the talk
└── app/      Showcase example app (Postgres + React Server Components)
```

## Run the deck locally

```sh
cd slides
bun install
bun run dev
```

Built with [Slidev](https://sli.dev).

## Run the showcase app

```sh
cd app
bun install
bun run dev
```

## What the talk covers

A side-by-side comparison of a data-intensive AI app built three ways - traditional monolith, microservices, and Postgres + React Server Components - and the operational complexity of each.

Topics include:

- Auth without a service via Postgres Row Level Security
- Vector search without a vector database via pgvector
- Realtime data directly in the DB via LISTEN/NOTIFY
- Background jobs with graphile-worker or pg-boss
- RAG via Postgres full-text search
- Code-free APIs via pg_graphql or PostgREST
- React Server Components fetching directly from Postgres

## Speaker

**Dani Akash** - Founding Engineer at [BrowserOS](https://browseros.com) (YC S24).
