## System Objective
Modern ML systems fail less often due to model quality than due to **unclear execution boundaries, implicit infrastructure behavior, and weak isolation between control and data planes**.

This project explores how to design a **minimal ML infrastructure platform** that makes execution semantics, deployment boundaries, and resource ownership **explicit**, using GCP as the substrate.

The goal is not feature completeness, but **clarity of system behavior under load, change, and failure**.

---

## System Decomposition

### Control Plane
- Declarative infrastructure via Terraform
- Explicit ownership of lifecycle (create / update / destroy)
- Environment-level isolation (e.g., dev vs prod)

The control plane defines *what exists* and *who is allowed to change it*.

---

### Data Plane
- Containerized ML workloads
- GPU-capable execution environments
- Runtime configuration passed explicitly at launch

The data plane defines *how computation executes* and *where resource contention occurs*.

---

## Execution Model

This platform enforces a **container-first execution model**:
- Model code is treated as an opaque workload
- Infrastructure decisions do not leak into training or inference logic
- Runtime behavior is observable and reproducible

This mirrors production ML systems where **predictability beats convenience**.

---

## Key Design Decisions & Tradeoffs

### Terraform over imperative tooling
- **Pro:** reproducibility, auditability, reviewable change sets  
- **Con:** slower iteration for ad-hoc experimentation  

Chosen to bias toward correctness and long-term maintainability.

---

### Minimal abstraction layer
- **Pro:** system behavior remains inspectable
- **Con:** less ergonomic for end users

Avoids hiding failure modes behind orchestration magic.

---

### No built-in autoscaling or scheduling
- **Pro:** resource behavior remains explicit
- **Con:** manual capacity management required

Autoscaling is deferred intentionally to avoid masking performance bottlenecks.

---

## What This Demonstrates (Hiring Signal)

- ML infrastructure reasoning beyond model code
- Control plane vs data plane separation
- Infrastructure-as-code applied to ML systems
- Execution-model thinking (not just deployment)
- Comfort operating near hardware and resource constraints

This project is designed to be read by **infra engineers**, not end users.

---

## Known Limitations & Failure Modes

- No multi-tenant isolation guarantees
- No fairness or priority scheduling
- No fault-tolerant job orchestration
- Assumes trusted workloads

These limitations are explicit to keep system boundaries legible.

---

## How to Run (Intentionally High-Level)

1. Provision infrastructure via Terraform
2. Build containerized ML workloads
3. Deploy workloads to provisioned resources

Exact commands are omitted intentionally to emphasize **architecture over tooling**.

---

## Future Extensions

- Training vs inference resource partitioning
- Scheduling constraints and admission control
- Latency and cold-start benchmarking
- Multi-region control plane coordination
- Failure injection and recovery analysis

---

## Scope Clarification

This is **not**:
- A managed ML platform
- An end-user ML product
- A fully productionized system

It *is*:
- A systems exploration
- An execution-model reference
- A foundation for deeper ML infra work
