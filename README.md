# GAT - GitHub Actions Tools

A set of helpers for building composable GitHub actions

## Installation

When building a GitHub Action start with:

```Dockerfile
# source
FROM andy9775/gat as gat
# ================= start of action =================
# any compatible source
FROM alpine
# ============== copy specific helpers ==============
# in this case, copy the environment variable helpers
COPY --from=gat /gat/env/shell /env
RUN /env/setup.sh
# ================= continue action =================
# ...
```
