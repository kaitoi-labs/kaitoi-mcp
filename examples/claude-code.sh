#!/usr/bin/env bash
# Add the hosted Kaitoi Studio MCP using its OAuth discovery.
set -euo pipefail

claude mcp add --transport http kaitoi-studio \
  https://mcp.studio.kaitoi.io

# Open /mcp in Claude Code and complete browser sign-in/consent when prompted.
# Verify by asking: "Use Kaitoi Studio to list my projects."
# For manual bearer-key clients, generate the exact config in Studio Settings → MCP.
