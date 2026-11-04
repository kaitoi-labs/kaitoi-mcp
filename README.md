<img src="assets/kaitoi-icon.png" alt="Kaitoi Studio" width="128" height="128" />

# Kaitoi Studio MCP

Connect an MCP-compatible agent to Kaitoi Studio to discover nodes, work with
projects and assets, inspect workflows, and run creative-production graphs.
This repository contains connection documentation, examples and registry
metadata for Kaitoi's hosted server; the backend runs as part of Kaitoi Studio.

## Connect

Add the remote server using your client's MCP connection settings:

```text
https://mcp.studio.kaitoi.io
```

The transport is Streamable HTTP. Compatible clients discover OAuth and open
Kaitoi's browser sign-in and consent flow. Each user connects their own account.
Account permissions and the granted `mcp:read` / `mcp:write` scopes determine
available actions. Check current account eligibility at
[kaitoi.io/studio](https://kaitoi.io/studio).

A URL-only configuration for clients that support remote HTTP and OAuth:

```json
{
  "mcpServers": {
    "kaitoi-studio": {
      "url": "https://mcp.studio.kaitoi.io"
    }
  }
}
```

For clients using manually supplied bearer tokens, generate the client-specific
configuration in Studio's **Settings → MCP**. Keep that token private and out
of source control. A manually pasted token is an alternative connection mode;
it is not a replacement for OAuth in directory submission.

Connection examples:

- [Native remote HTTP with OAuth](examples/http-native.json)
- [Claude Code with browser authorization](examples/claude-code.sh)
- [Legacy Claude Desktop bridge with OAuth](examples/claude-desktop.json)
- [Manual bearer-token alternative](examples/http-bearer.json)

## Workflows

The current implementation includes tools for:

- Discovering nodes and inspecting their inputs before running them.
- Building and validating graphs and saving reusable projects.
- Starting durable runs, polling their status and retrieving results.
- Browsing existing projects, files and supported workflow templates.
- Reading API contracts and guidance for building applications with Kaitoi.
- Connecting to an explicitly selected, opted-in Studio session when supported.

The authenticated server's discovery responses are authoritative. Tool counts,
profiles, optional integrations and UI features vary by deployment, account
permissions and granted scopes; this README does not certify an exact live
catalog or availability in every host.

## Studio canvas and headless graphs

An unattached MCP connection uses a separate account-scoped server graph.
Connecting the server does not automatically attach an agent to whichever
Studio tab is open. Where Studio attachment is enabled and advertised, select
and attach the intended opted-in tab explicitly. Lost attachment must be
resolved explicitly rather than silently switching to another graph.

## Execution and results

Provider-backed operations may consume existing Kaitoi credits and provider
allowances. Use the advertised run/status/result contracts and stable
idempotency keys to avoid duplicate execution when retrying. A pending result
means poll the original run, rather than starting it again. Media rendering
and optional Run Inspector UI depend on host and server support; structured
results remain the baseline interface.

## First requests

- “List my Kaitoi projects.”
- “Find nodes that join two pieces of text. Show their inputs without running anything.”
- “Describe the workflow available to this connection without changing it.”
- “Show the API contract for the workflow template I select.”

## Support and policies

- [Kaitoi Studio](https://kaitoi.io/studio)
- [Support](https://kaitoi.io/contact)
- [Privacy](https://kaitoi.io/privacy)
- [Terms](https://kaitoi.io/terms)

Public-directory submission and approval are separate from connecting the
hosted server directly. Nothing in this README implies approval or endorsement
by a particular MCP client or directory.

## Registry metadata

`server.json` contains the source metadata for the `io.kaitoi/studio` MCP
Registry listing. `mcp-registry-metadata.json` provides descriptive information
and tool groups for maintainers. Updating these files on GitHub does not publish
a new Registry version or submit a ChatGPT plugin; those are separate release
steps. The live authenticated catalog remains authoritative.

## License

Repository documentation and examples are provided under the [MIT License](LICENSE).
Access to the hosted server is governed by the Kaitoi Studio terms of service.
