# ML Infrastructure Platform (GCP)

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
- A foundation for deeper ML infra work# ML Infrastructure Platform (GCP)

## Problem Statement
Training and serving ML models reliably requires more than model code. It requires **repeatable infrastructure**, **clear execution boundaries**, and **controlled interfaces** between training, inference, and cloud resources.

This project explores how to design a minimal ML infrastructure platform on GCP that makes **deployment, scaling, and isolation explicit**, rather than implicit.

---

## Architecture Overview

**Control Plane**
- Terraform-managed infrastructure
- Declarative resource provisioning
- Environment-level separation (dev / prod)

**Data Plane**
- Containerized workloads
- GPU-enabled execution
- Explicit runtime configuration

The separation ensures infrastructure decisions do not leak into model logic.

---

## Key Design Decisions

- **Terraform over manual provisioning**  
  Chosen for reproducibility and auditability.

- **Container-first execution model**  
  Forces clear runtime boundaries and prevents environment drift.

- **Minimal abstraction layer**  
  Avoids overengineering while keeping extension points visible.

Each decision trades convenience for **predictability and debuggability**.

---

## What This Demonstrates

- ML infrastructure design thinking
- Control plane vs data plane separation
- Infrastructure-as-code for ML systems
- Cloud-native execution models
- Reproducible ML environments

This project is intentionally infrastructure-focused rather than model-focused.

---

## Failure Modes & Limitations

- Not optimized for multi-tenant workloads
- No built-in autoscaling policies
- No scheduler-level fairness guarantees
- Assumes trusted users and workloads

These are deliberate omissions to keep system boundaries explicit.

---

## How to Run (High Level)

1. Provision infrastructure via Terraform
2. Build container images
3. Deploy workloads to provisioned resources

Exact commands are intentionally omitted to emphasize architecture over tooling.

---

## Future Work

- Add inference vs training resource isolation
- Introduce workload scheduling constraints
- Benchmark cold-start and deployment latency
- Extend to multi-region deployments
