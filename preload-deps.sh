#!/bin/bash

# Create an array of all packages to add
PACKAGES=(
  "next"
  "react"
  "react-dom"
  "@types/react"
  "@types/react-dom"
  "@types/node"
  "typescript"
  "@tailwindcss/postcss"
  "tailwindcss"
  "eslint"
  "eslint-config-next"
  "@eslint/eslintrc"
  "@clerk/clerk-react"
  "@clerk/nextjs"
  "@clerk/themes"
  "@hookform/resolvers"
  "@radix-ui/react-accordion"
  "@radix-ui/react-alert-dialog"
  "@radix-ui/react-aspect-ratio"
  "@radix-ui/react-avatar"
  "@radix-ui/react-checkbox"
  "@radix-ui/react-collapsible"
  "@radix-ui/react-context-menu"
  "@radix-ui/react-dialog"
  "@radix-ui/react-dropdown-menu"
  "@radix-ui/react-hover-card"
  "@radix-ui/react-label"
  "@radix-ui/react-menubar"
  "@radix-ui/react-navigation-menu"
  "@radix-ui/react-popover"
  "@radix-ui/react-progress"
  "@radix-ui/react-radio-group"
  "@radix-ui/react-scroll-area"
  "@radix-ui/react-select"
  "@radix-ui/react-separator"
  "@radix-ui/react-slider"
  "@radix-ui/react-slot"
  "@radix-ui/react-switch"
  "@radix-ui/react-tabs"
  "@radix-ui/react-toggle"
  "@radix-ui/react-toggle-group"
  "@radix-ui/react-tooltip"
  "class-variance-authority"
  "clsx"
  "cmdk"
  "convex"
  "date-fns"
  "embla-carousel-react"
  "input-otp"
  "lucide-react"
  "next-themes"
  "react-day-picker"
  "react-hook-form"
  "react-resizable-panels"
  "recharts"
  "sonner"
  "tailwind-merge"
  "tw-animate-css"
  "vaul"
  "zod"
  "npm-run-all"
  "prettier"
  "axios"
)

# Run pnpm store add in parallel with a maximum of 5 concurrent processes
for pkg in "${PACKAGES[@]}"; do
  (pnpm store add "$pkg") &
  
  # Limit the number of background processes
  if [[ $(jobs -r | wc -l) -ge 5 ]]; then
    # Use wait without -n option since it's causing an error
    wait
  fi
done

# Wait for all background processes to finish
wait
