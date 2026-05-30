import './globals.css'

export const metadata = {
  title: 'Repo Companion',
  description: 'Chat with your codebase. Postgres-first.',
}

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  )
}
