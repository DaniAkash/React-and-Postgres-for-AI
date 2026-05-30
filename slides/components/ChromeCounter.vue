<script setup lang="ts">
// @ts-ignore — slidev provides these at runtime
import { useSlideContext } from '@slidev/client'
import { computed, unref } from 'vue'

// $page is the LOCAL slide's number (injected per-slide), so each slide's
// ChromeCounter renders its own page number even though all are mounted
// in the DOM. $nav.total is the live slide count, so insertions / removals
// flow through automatically.
const { $page, $nav } = useSlideContext()

const pad = (n: number) => String(n).padStart(2, '0')
const left = computed(() => pad(unref($page)))
const right = computed(() => pad($nav.value.total))
</script>

<template>
  <div>{{ left }} / {{ right }}</div>
</template>
